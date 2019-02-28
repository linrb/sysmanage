package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.GoodsEntity;

import java.util.List;

public interface GoodsService {
    GoodsEntity getGoodsById(int gid);
    
    int updateGoods(GoodsEntity goodsEntity);
    
    List<GoodsEntity> getGoodsList();
}
