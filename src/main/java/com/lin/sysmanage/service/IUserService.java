package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.User;

import java.util.List;

public interface IUserService {

    User getUserById(Integer userId);

    List<User> getUserList();
    
    //以下是基于MongoDB的操作
    void  saveUser(User user);
    
    User findUserByUserName(String userName);

    void updateUser(User user);
    
    void deleteUserById(Integer id);

    List<User> findAll(int pageNo, int pageSize);

}
