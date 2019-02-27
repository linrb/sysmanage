package com.lin.sysmanage.dao;

import com.lin.sysmanage.entity.GoodsEntity;

public interface GoodsMapper {
   GoodsEntity getGoodsById(int gid);
   
   int updateGoods(GoodsEntity goodsEntity);
   //乐观锁更新库存
   int updateGoodsByOptimistic(GoodsEntity goodsEntity);
}
