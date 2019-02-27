package com.lin.sysmanage.service.Impl;

import com.lin.sysmanage.dao.GoodsMapper;
import com.lin.sysmanage.entity.GoodsEntity;
import com.lin.sysmanage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public GoodsEntity getGoodsById(int gid) {
        return goodsMapper.getGoodsById( gid );
    }

    @Override
    public int updateGoods(GoodsEntity goodsEntity) {
        return goodsMapper.updateGoods( goodsEntity );
    }
}
