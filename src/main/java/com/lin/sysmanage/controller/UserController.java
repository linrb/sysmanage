package com.lin.sysmanage.controller;

import com.lin.sysmanage.aspect.Log;
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
        return userList;
    }

    @Log(descrption = "查询用户信息",actionType = "4")
    @ResponseBody
    @RequestMapping(value = "/getUserById", produces = {"application/json;charset=UTF-8"})
    public User getUserById(Integer userId) {
        return userService.getUserById(userId);
    }
}
