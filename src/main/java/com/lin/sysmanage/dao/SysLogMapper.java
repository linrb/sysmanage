package com.lin.sysmanage.dao;

import com.lin.sysmanage.entity.SysLogEntity;

import java.util.List;

public interface SysLogMapper {
    /**
     * 保存
     * @param sysLog
     * @return
     */
    int saveSysLog(SysLogEntity sysLog);

    /**
     * 查询
     * @param sysLog
     * @return
     */
    List<SysLogEntity> listSysLog(SysLogEntity sysLog);

    /**
     * 分页
     * @param sysLog    
     * @return
     */
    List<SysLogEntity> getSysLogListPage(SysLogEntity sysLog);

    /**
     * 获取总数
     * @param sysLog
     * @return
     */
    int getTotal(SysLogEntity sysLog);

    /**
     * 删除
     * @param id
     * @return
     */
    int batchRemove(Long[] id);
}
