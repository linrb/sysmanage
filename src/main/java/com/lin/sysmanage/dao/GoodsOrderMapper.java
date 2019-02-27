package com.lin.sysmanage.dao;

import com.lin.sysmanage.entity.GoodsOrderEntity;

import java.util.List;

public interface GoodsOrderMapper {
    int saveGoodsOrder(GoodsOrderEntity goodsOrderEntity);
    GoodsOrderEntity getGoodsOrderById(int id);
    List<GoodsOrderEntity> getOrderList();
}
