package com.lin.sysmanage.dao;

import com.lin.sysmanage.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    User getUserById(Integer userId);

    List<User> getUserList();

    User getUserByUserName(String userName);
}
