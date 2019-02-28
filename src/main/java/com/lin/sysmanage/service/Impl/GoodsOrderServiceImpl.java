package com.lin.sysmanage.service.Impl;

import com.lin.sysmanage.cache.RedisUtils;
import com.lin.sysmanage.dao.GoodsMapper;
import com.lin.sysmanage.dao.GoodsOrderMapper;
import com.lin.sysmanage.entity.GoodsEntity;
import com.lin.sysmanage.entity.GoodsOrderEntity;
import com.lin.sysmanage.service.GoodsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsOrderServiceImpl implements GoodsOrderService {
    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    GoodsOrderMapper goodsOrderMapper;

    @Autowired
    RedisUtils redisUtils;

    /**
     * 普通更新
     *
     * @param gid
     * @return
     */
    @Override
    public int createOrder(int gid) {
        int result;
        //校验库存
        GoodsEntity stock = checkStock( gid );
        if (null == stock) {
            //return ResultEntity.error( 0 ,"没有该秒杀商品信息！") ;
            return 0;
        }
        if (stock.getSale() >= stock.getCount()) {
            // return ResultEntity.error( 0 ,"库存不足！") ;
            return -1;
        }
        //扣库存
        saleStockOptimistic( stock );
        //saleStock(stock);
        //创建订单
        result = saveGoodsOrder( stock );
        return result;
    }

    /**
     * 基于redis锁更新
     *
     * @param gid
     * @return
     */
    @Override
    public int createOptimisticOrderUseRedis(int gid) {
        //检验库存，从 Redis 获取
        // Integer count = Integer.parseInt(redisTemplate.opsForValue().get(RedisKeysConstant.STOCK_COUNT + sid));
        Integer count = (Integer) redisUtils.get( "STOCK_COUNT" + gid );

        // Integer sale = Integer.parseInt(redisTemplate.opsForValue().get(RedisKeysConstant.STOCK_SALE + sid));
        Integer sale = (Integer) redisUtils.get( "STOCK_SALE" + gid );
        if (sale >= count) {//库存不足
            return -1;
        }

        GoodsEntity stock = checkStockByRedis( gid );
        if (null == stock) {
            return 0;
        }
        if (stock.getSale().equals( stock.getCount() )) {
            return -1;
        }
        Integer version = (Integer) redisUtils.get( "STOCK_VERSION" + gid );
        stock.setSale( sale );
        stock.setVersion( version );
        //乐观锁更新库存 以及更新 Redis
        saleStockOptimisticByRedis( stock );
        //创建订单
        int id = saveGoodsOrder( stock );
        return id;
    }

    /**
     * 检查商品
     *
     * @param gid
     * @return
     */
    private GoodsEntity checkStock(int gid) {
        GoodsEntity stock = goodsMapper.getGoodsById( gid );
        return stock;
    }

    /**
     * 普通更新
     *
     * @param stock
     * @return
     */
    private int saleStock(GoodsEntity stock) {
        stock.setSale( stock.getSale() + 1 );
        return goodsMapper.updateGoods( stock );
    }

    /**
     * 数据库乐观锁更新库存
     *
     * @param stock
     */
    private void saleStockOptimistic(GoodsEntity stock) {
        int count = goodsMapper.updateGoodsByOptimistic( stock );
        if (count == 0) {
            throw new RuntimeException( "并发更新库存失败" );
        }
    }

    /**
     * Redis检查库存
     *
     * @param gid
     * @return
     */
    private GoodsEntity checkStockByRedis(int gid) {
        GoodsEntity goods = (GoodsEntity) redisUtils.get( "GOODS" + gid );
        System.out.println( "名称1：" + goods.getGoodsName() );
        if (goods == null) {
            goods = goodsMapper.getGoodsById( gid );
            if (null != goods) {
                redisUtils.set( "GOODS" + gid, goods, 300 );
            }
        }
        return goods;
    }

    /**
     * 乐观锁更新数据库 还要更新 Redis
     *
     * @param stock
     */
    private void saleStockOptimisticByRedis(GoodsEntity stock) {
        int count = goodsMapper.updateGoodsByOptimistic( stock );
        if (count == 0) {
            throw new RuntimeException( "并发更新库存失败" );
        }
        redisUtils.incr( "STOCK_SALE" + stock.getId(), 1 );
        redisUtils.incr( "STOCK_VERSION" + stock.getId(), 1 );
    }

    /**
     * 保存订单
     *
     * @param goodsEntity
     * @return
     */
    @Override
    public int saveGoodsOrder(GoodsEntity goodsEntity) {
        GoodsOrderEntity order = new GoodsOrderEntity();
        order.setGoodsId( goodsEntity.getId() );
        order.setGoodsName( goodsEntity.getGoodsName() );
        int id = goodsOrderMapper.saveGoodsOrder( order );
        return id;
    }
}
