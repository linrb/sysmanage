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

    @Override
    public int createOrder(int gid) {
        //校验库存
        GoodsEntity stock = checkStock( gid );
        //扣库存
        saleStockOptimistic( stock );
        //saleStock(stock);
        //创建订单
        int id = saveGoodsOrder( stock );
        return id;
    }

    @Override
    public int createOptimisticOrderUseRedis(int gid) {
        //检验库存，从 Redis 获取
        GoodsEntity stock = checkStockByRedis(gid);
        //乐观锁更新库存 以及更新 Redis
        saleStockOptimisticByRedis(stock);
        //创建订单
        int id = saveGoodsOrder(stock);
        return id ;
    }

    private GoodsEntity checkStock(int gid) {
        GoodsEntity stock = goodsMapper.getGoodsById( gid );
        if (stock.getSale().equals( stock.getCount() )) {
            throw new RuntimeException( "库存不足" );
        }
        return stock;
    }

    /**
     * 普通更新
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
     * @param gid
     * @return
     */
    private GoodsEntity checkStockByRedis(int gid) {
        // Integer count = Integer.parseInt(redisTemplate.opsForValue().get(RedisKeysConstant.STOCK_COUNT + sid));
        Integer count = (Integer) redisUtils.get( "STOCK_COUNT" + gid );
        System.out.println("库存："+count);
        // Integer sale = Integer.parseInt(redisTemplate.opsForValue().get(RedisKeysConstant.STOCK_SALE + sid));
        Integer sale = (Integer) redisUtils.get( "STOCK_SALE" + gid );
        System.out.println("已售："+count);
        if (count.equals( sale )) {
            throw new RuntimeException( "库存不足 Redis currentCount=" + sale );
        }
        // Integer version = Integer.parseInt( redisTemplate.opsForValue().get( RedisKeysConstant.STOCK_VERSION + sid ) );
        Integer version = (Integer) redisUtils.get( "STOCK_VERSION" + gid );
        System.out.println("锁："+version);
        GoodsEntity goods= (GoodsEntity) redisUtils.get("goods"+gid );
        System.out.println("名称1："+goods.getGoodsName());
        if(goods==null)
        {
            goods =goodsMapper.getGoodsById( gid );
            redisUtils.set( "goods"+gid,goods );
            System.out.println("名称2："+goods.getGoodsName());
        }
        GoodsEntity stock = new GoodsEntity();
        stock.setId( gid );
        stock.setGoodsName(goods.getGoodsName() );
        stock.setCount( count );
        stock.setSale( sale );
        stock.setVersion( version );
        return stock;
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
        //自增
        // redisTemplate.opsForValue().increment(RedisKeysConstant.STOCK_SALE + stock.getId(),1) ;       
        // redisTemplate.opsForValue().increment(RedisKeysConstant.STOCK_VERSION + stock.getId(),1) ;
        redisUtils.incr( "STOCK_SALE" + stock.getId(), 1 );
        redisUtils.incr( "STOCK_VERSION" + stock.getId(), 1 );
    }

    @Override
    public int saveGoodsOrder(GoodsEntity goodsEntity) {
        GoodsOrderEntity order = new GoodsOrderEntity();
        order.setGoodsId( goodsEntity.getId() );
        order.setGoodsName( goodsEntity.getGoodsName() );
        int id = goodsOrderMapper.saveGoodsOrder( order );
        return id;
    }
}
