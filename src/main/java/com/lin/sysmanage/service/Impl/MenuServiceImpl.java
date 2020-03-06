package com.lin.sysmanage.service.Impl;

import com.github.pagehelper.PageHelper;
import com.lin.sysmanage.dao.MenuMapper;
import com.lin.sysmanage.entity.Menu;
import com.lin.sysmanage.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@CacheConfig(cacheNames={"menu"})
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Cacheable(keyGenerator = "keyGenerator",unless = "#result eq null")
    @Override
    public List<Menu> selectMenuAll()
    {
        System.out.println("无缓存的时候调用数据库读取");
        return menuMapper.selectMenuAll();
    }

    @Override
    public List<Menu> selectMenuNormalAll() {
        return menuMapper.selectMenuNormalAll();
    }

    @Cacheable(key = "#root.args[0]", unless = "#result eq null ")
    @Override
    public Menu selectMenuById(Long menuId) {
        return menuMapper.selectMenuById(menuId);
    }
    
    @Override
    public List<Menu> selectMenuList(Menu menu) {
      
        return menuMapper.selectMenuList(menu);
    }

    @Override
    public List<Menu> findMenuListByPage(int currentPage, int pageSize) {
        //使用分页插件,核心代码就这一行
        String ordeyBy = "menu_id DESC";
       
        PageHelper.startPage(currentPage, pageSize, ordeyBy);
        // 获取
        return menuMapper.selectMenuAll();
    }

}
