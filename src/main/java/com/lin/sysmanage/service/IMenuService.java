package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.Menu;

import java.util.List;

public interface IMenuService {
    /**
     * 查询菜单集合
     *
     * @return 所有菜单信息
     */
     List<Menu> selectMenuAll();

    /**
     * 查询系统正常显示菜单（不含按钮）
     *
     * @return 菜单列表
     */
     List<Menu> selectMenuNormalAll();

    /**
     * 根据菜单ID查询信息
     *
     * @param menuId 菜单ID
     * @return 菜单信息
     */
     Menu selectMenuById(Long menuId);


    /**
     * 查询系统菜单列表
     *
     * @param menu 菜单信息
     * @return 菜单列表
     */
     List<Menu> selectMenuList(Menu menu);

     List<Menu> findMenuListByPage(int currentPage, int pageSize);


}
