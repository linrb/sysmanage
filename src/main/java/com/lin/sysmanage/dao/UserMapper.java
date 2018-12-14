package com.lin.sysmanage.dao;

import com.lin.sysmanage.entity.User;

import java.util.List;

//@Mapper
public interface UserMapper {

    User getUserById(Integer userId);

    List<User> getUserList();

    User getUserByUserName(String userName);

    List<User> selectUserList(User user);
}
