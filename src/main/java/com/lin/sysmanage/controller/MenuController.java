package com.lin.sysmanage.controller;

import com.lin.sysmanage.aspect.Log;
import com.lin.sysmanage.entity.Menu;
import com.lin.sysmanage.service.IMenuService;
import com.lin.sysmanage.utils.Log4jUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    private static Logger log = Log4jUtils.getLog(MenuController.class);

    @RequestMapping("/menuList")
    @Log(descrption = "查询菜单", actionType = "4")
    public String menu() {
        log.error("错误消息");
        return "menu/menu";
    }

    @Log(descrption = "查询菜单信息", actionType = "4")
    @GetMapping("/list")
    @ResponseBody
    public List<Menu> list(Menu menu) {
        List<Menu> menuList = menuService.selectMenuList(menu);
        return menuList;
    }

    /*
    分页查询
     */
    @GetMapping("findMenuListByPage")
    @ResponseBody
    public List<Menu> findMenuListByPage(Integer pageNum, Integer pageSize) {

        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 10 : pageSize;
        List<Menu> menuList = menuService.findMenuListByPage(pageNum, pageSize);
        return menuList;
    }

}
