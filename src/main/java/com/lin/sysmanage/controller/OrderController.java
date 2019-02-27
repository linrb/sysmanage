package com.lin.sysmanage.controller;


import com.lin.sysmanage.service.GoodsOrderService;
import com.lin.sysmanage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsOrderService goodsOrderService;

    @RequestMapping("/creatOrder/{gid}")
    @ResponseBody
    public String createWrongOrder(@PathVariable int gid) {     
        int id = 0;
        try {
           // id = goodsOrderService.createOptimisticOrderUseRedis(gid);
            id = goodsOrderService.createOrder(gid);
        } catch (Exception e) {
          e.printStackTrace();
        }
        return String.valueOf(id);
    }
    
}
