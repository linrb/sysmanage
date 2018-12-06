package com.lin.sysmanage.controller;

import com.lin.sysmanage.entity.User;
import com.lin.sysmanage.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    @ResponseBody
    @RequestMapping(value = "/getUserList")
    public List<User> getUserList() {
        List<User> userList = userService.getUserList();
        System.out.println();
        return userList;
    }

    //@Log(descrption = "查询用户信息", actionType = "4")
    @ResponseBody
    @RequestMapping(value = "/getUserById")
    public User getUserById(Integer userId) {
        User user = userService.getUserById(userId);
        System.out.println("数据测试成功,user:"+user.getUserName()); 
        return  user;
    }
}
