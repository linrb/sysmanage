package com.lin.sysmanage.service.Impl;

import com.lin.sysmanage.dao.UserMapper;
import com.lin.sysmanage.entity.User;
import com.lin.sysmanage.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserById(Integer userId) {

       return userMapper.getUserById(userId);
    }

    public List<User> getUserList()
    {
        return  userMapper.getUserList();
    }
}
