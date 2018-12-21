package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.User;

import java.util.List;

public interface IUserService {

    User getUserById(Integer userId);  
    List<User> getUserList();
    List<User> selectUserList(User user);
    
    //以下是基于MongoDB的操作
    void  saveUser(User user);
    
    List<User> findUserByName(String userName);

    void updateUser(User user);
    
    void deleteUserById(Integer id);

    List<User> findAll(int pageNo, int pageSize);

}
