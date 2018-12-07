package com.lin.sysmanage.service.Impl;

import com.lin.sysmanage.dao.UserMapper;
import com.lin.sysmanage.entity.User;
import com.lin.sysmanage.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * @Cacheable 应用到读取数据的方法上，先从缓存中读取，如果没有再从DB获取数据，然后把数据添加到缓存中
     * key 缓存在redis中的key
     * unless 表示条件表达式成立的话不放入缓存
     * @param userId 主键
     * @return
     */
    @Override   
    @Cacheable(value = "user", key = "#root.args[0]", unless = "#result eq null") 
    public User getUserById(Integer userId) {
        System.out.println("无缓存的时候调用数据库读取");
        return userMapper.getUserById(userId);
    }

    public List<User> getUserList() {
        return userMapper.getUserList();
    }
}
