package com.lin.sysmanage.service.Impl;

import com.lin.sysmanage.dao.UserMapper;
import com.lin.sysmanage.entity.User;
import com.lin.sysmanage.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MongoTemplate mongoTemplate;

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

    @Override
    public List<User> selectUserList(User user) {
        return userMapper.selectUserList(user);
    }

    /**
     * 创建对象
      * @param user
     */    
    @Override
    public void saveUser(User user) {
        mongoTemplate.save(user);
    }

    /**
     * 根据用户名查询对象
     * @param userName
     * @return
     */
    @Override
    public List<User> findUserByName(String userName) {
        Query query=new Query(Criteria.where("userName").regex(userName));//is:符合条件;in:匹配;regex:模糊查询
        List<User> list =  mongoTemplate.find(query , User.class);
        return list;
    }

    /**
     * 更新对象
     * @param user
     */
    @Override
    public void updateUser(User user) {
        Query query=new Query(Criteria.where("userId").is(user.getUserId()));
        Update update= new Update().set("loginName", user.getLoginName()).set("password", user.getPassword());
        //更新查询返回结果集的第一条
        mongoTemplate.updateFirst(query,update,User.class);
        //更新查询返回结果集的所有
        // mongoTemplate.updateMulti(query,update,UserEntity.class);
    }

    /**
     * 删除对象
     * @param id
     */
    @Override
    public void deleteUserById(Integer id) {
        Query query=new Query(Criteria.where("userId").is(id));
        mongoTemplate.remove(query,User.class);
    }

    /**
     * 分页查询
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public List<User> findAll(int pageNo, int pageSize) {
        Query query = new Query();
        query.skip((pageNo - 1) * pageSize);
        query.limit(pageSize);
        query.with(new Sort(Sort.Direction.DESC, "userId"));//按照userId排序
        List<User> users = mongoTemplate.find(query,User.class);
        return users;
    }
}
