package com.lin.sysmanage.dao;

import com.lin.sysmanage.entity.GoodsEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {
   GoodsEntity getGoodsById(@Param("id") int id);
   
   int updateGoods(GoodsEntity goodsEntity);
   //乐观锁更新库存
   int updateGoodsByOptimistic(GoodsEntity goodsEntity);

   List<GoodsEntity> getGoodsList();
}
