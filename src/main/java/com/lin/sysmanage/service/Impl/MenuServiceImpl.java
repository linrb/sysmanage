package com.lin.sysmanage.service.Impl;

import com.github.pagehelper.PageHelper;
import com.lin.sysmanage.dao.MenuMapper;
import com.lin.sysmanage.entity.Menu;
import com.lin.sysmanage.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> selectMenuAll() {
        return menuMapper.selectMenuAll();
    }

    @Override
    public List<Menu> selectMenuNormalAll() {
        return menuMapper.selectMenuNormalAll();
    }

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
