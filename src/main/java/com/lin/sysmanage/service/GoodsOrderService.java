package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.GoodsEntity;

public interface GoodsOrderService {
    int saveGoodsOrder(GoodsEntity goodsEntity);

    int createOrder(int gid);
    int createOptimisticOrderUseRedis(int gid);
}
