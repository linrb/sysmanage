package com.lin.sysmanage.controller;

import com.lin.sysmanage.cache.RedisUtils;
import com.lin.sysmanage.entity.GoodsEntity;
import com.lin.sysmanage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    RedisUtils redisUtils;

    @RequestMapping("/goodslist")    
    public String goodslist() {      
            return "goods/goodslist";
    }
    
    @RequestMapping("/getSeckillGoods")
    @ResponseBody
    public  List<GoodsEntity>  getSeckillGoods() {
        List<GoodsEntity>   goodsList = goodsService.getGoodsList();
            if (goodsList != null) {
                for (GoodsEntity goodsEntity : goodsList) {
                    redisUtils.set( "STOCK_COUNT" + goodsEntity.getId(), goodsEntity.getCount() );
                    redisUtils.set( "STOCK_SALE" + goodsEntity.getId(), goodsEntity.getSale() );
                    redisUtils.set( "STOCK_VERSION" + goodsEntity.getId(), goodsEntity.getVersion() );
                    redisUtils.set( "GOODS" + goodsEntity.getId(), goodsEntity );
                }
            }
        return goodsList;
    }

}
