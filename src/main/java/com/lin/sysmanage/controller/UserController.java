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
        for (Integer i=3;i<5;i++) {
            User user = new User();
            user.setUserId(i.toString());
            user.setUserName("xm"+i);
            user.setPassword("123456");
            user.setLoginName("小明"+i);
           // userService.saveUser(user);
        }
        return "userlist";
    }

    @ResponseBody
    @RequestMapping(value = "/getUserList")
    public List<User> getUserList() {
        List<User> userList = userService.getUserList();       
        User user=userService.findUserByUserName("xm3");        
        user.setLoginName("xm-3");
        user.setPassword("123");       
        userService.updateUser(user);
        List<User> u1=userService.findAll(1,10);
        userList.addAll(u1);
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
