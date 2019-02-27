package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.GoodsEntity;

public interface GoodsService {
    GoodsEntity getGoodsById(int gid);
    int updateGoods(GoodsEntity goodsEntity);
}
