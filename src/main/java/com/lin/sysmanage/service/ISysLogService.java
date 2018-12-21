package com.lin.sysmanage.service;

import com.lin.sysmanage.entity.SysLogEntity;

import java.util.List;
import java.util.Map;

public interface ISysLogService {
    /**
     * 新增
     * @param sysLog
     */
    void  saveSysLog(SysLogEntity sysLog);

    /**
     * 查询
     * @param params
     * @return
     */
    List<SysLogEntity> listSysLog(Map<String, Object> params);

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
