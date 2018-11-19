package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.User;

import java.util.List;

public interface IUserService {

    User getUserById(Integer userId);

    List<User> getUserList();

}
