package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.GoodsEntity;
import com.lin.sysmanage.entity.ResultEntity;

public interface GoodsOrderService {
    int saveGoodsOrder(GoodsEntity goodsEntity);
    
    int createOrder(int gid);
    
    int createOptimisticOrderUseRedis(int gid);
}
