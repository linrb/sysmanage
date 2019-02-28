package com.lin.sysmanage.controller;


import com.lin.sysmanage.cache.RedisUtils;
import com.lin.sysmanage.entity.ResultEntity;
import com.lin.sysmanage.service.GoodsOrderService;
import com.lin.sysmanage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private GoodsOrderService goodsOrderService;   

    @Autowired
    RedisUtils redisUtils;
    
    @RequestMapping("/creatOrder")
    @ResponseBody
    public ResultEntity createWrongOrder(int gid) {
   // public ResultEntity createWrongOrder(@PathVariable int gid) {
        int result = 0;
        try {
            //goodsOrderService.createOptimisticOrderUseRedis(gid);
            result = goodsOrderService.createOptimisticOrderUseRedis( gid );
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (0 == result) {
            return ResultEntity.ok( "没有该秒杀商品信息！" );
        } else if (-1 == result) {
            return ResultEntity.ok( "库存不足！" );
        } else {
            return ResultEntity.ok( "秒杀成功！" );
        }
    }

}
