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
        for (Integer i = 3; i < 5; i++) {
            User user = new User();
            user.setUserId(i.toString());
            user.setUserName("xm" + i);
            user.setPassword("123456");
            user.setLoginName("小明" + i);
            // userService.saveUser(user);
        }
        return "userlist";
    }
    
    @Log(descrption = "查询用户信息", actionType = "4")
    @ResponseBody
    @RequestMapping(value = "/getUserList")
    public List<User> getUserList(User user) {
        System.out.println("数据测试,user:" + user.getLoginName());
        List<User> userList = userService.selectUserList(user);
        if(!user.getLoginName().isEmpty()) {
            List<User> userUp = userService.findUserByName(user.getLoginName());
            //userUp.setLoginName("xm-3");
            // userUp.setPassword("123");       
            // userService.updateUser(userUp);
            // List<User> u1=userService.findAll(1,10);
            if (userUp != null) {
                userList.addAll(userUp);
            }
        }else
        {
            List<User> userMongoDb = userService.findAll(1,100);
            userList.addAll(userMongoDb);
        }
        return userList;
    }

    //@Log(descrption = "查询用户信息", actionType = "4")
    @ResponseBody
    @RequestMapping(value = "/getUserById")
    public User getUserById(Integer userId) {
        User user = userService.getUserById(userId);
        System.out.println("数据测试成功,user:" + user.getUserName());
        return user;
    }
}
