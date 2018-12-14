package com.lin.sysmanage.controller;

import com.lin.sysmanage.aspect.Log;
import com.lin.sysmanage.cache.RedisUtils;
import com.lin.sysmanage.entity.Menu;
import com.lin.sysmanage.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @Autowired
    RedisUtils redisUtils;

    @RequestMapping("/menuList")
    public String menu() {
        return "menu/menulist";
    }


    @Log(descrption = "查询菜单信息", actionType = "4")
    @RequestMapping("/list")
    @ResponseBody
    public List<Menu> list() {
       /* List<Menu> menuList = (List<Menu>) redisUtils.get("menuList");
        if (menuList == null) {
            System.out.println("缓存中没有");
            menuList = menuService.selectMenuList(menu);
            redisUtils.set("menuList", menuList);
            System.out.println("添加缓存");
        } else {
            System.out.println("从缓存中取" + menuList.size());
        }*/
        List<Menu> menuList = menuService.selectMenuAll();
        return menuList;
    }


    @Log(descrption = "查询菜单信息", actionType = "4")
    @RequestMapping("/selectMenuById")
    @ResponseBody
    public Menu selectMenuById(Long menuId) {
        Menu menu = menuService.selectMenuById(menuId);
        return menu;
    }

    /*
    分页查询
     */
    @RequestMapping("findMenuListByPage")
    @ResponseBody
    public List<Menu> findMenuListByPage(Integer pageNum, Integer pageSize) {
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 10 : pageSize;
        List<Menu> menuList = menuService.findMenuListByPage(pageNum, pageSize);
        return menuList;
    }

}
