package com.lin.sysmanage.controller;

import com.lin.sysmanage.entity.PageHelper;
import com.lin.sysmanage.entity.ResultEntity;
import com.lin.sysmanage.entity.SysLogEntity;
import com.lin.sysmanage.service.ISysLogService;
import com.lin.sysmanage.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;

    @RequestMapping(value = "/sysLogList")
    public String sysLogList() {
        return "sysLog/sysLogList";
    }

    /**
     * 取出所有数据，由BootStrap Table分页
     *
     * @param pageNum
     * @param pageSize
     * @param sysLogEntity
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public List<SysLogEntity> list(Integer pageNum, Integer pageSize, SysLogEntity sysLogEntity) {
        Map<String, Object> params = new HashMap<>();
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 10 : pageSize;
        params.put( "pageNum", pageNum );
        params.put( "pageSize", pageSize );
        params.put( "sysLog", sysLogEntity );
        List<SysLogEntity> menuList = sysLogService.listSysLog( params );
        return menuList;
    }

    /**
     * 数据库分页
     *
     * @param sysLogEntity
     * @return
     */
    @RequestMapping("/getLogListPage")
    @ResponseBody
    public PageHelper<SysLogEntity> getLogListPage(SysLogEntity sysLogEntity) {
        PageHelper<SysLogEntity> pageHelper = new PageHelper<>();
        // 统计总记录数
        Integer total = sysLogService.getTotal( sysLogEntity );
        pageHelper.setTotal( total );

        int pageNumber = sysLogEntity.getPageNumber();
        int pageSize = sysLogEntity.getPageSize();
        //重新计算页索引
        int currPageIndex = (pageNumber - 1) * pageSize;
        System.out.println( "页码1：" + currPageIndex );
        //sysLogEntity.setPageNumber( currPageIndex );
        System.out.println( "页码2：" + sysLogEntity.getPageNumber() );
        // 查询当前页实体对象
        List<SysLogEntity> list = sysLogService.getSysLogListPage( sysLogEntity );
        pageHelper.setRows( list );

        return pageHelper;
    }

    /**
     * 删除
     *
     * @param ids
     * @return
     */
    @RequestMapping("/batchRemove")
    @ResponseBody
    public ResultEntity batchRemove(String ids) {
        String[] strArr = ids.split( "," );
        Long[] idsArr = new Long[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            idsArr[i] = Long.parseLong( strArr[i] );
        }
        int count = sysLogService.batchRemove(idsArr);
        return CommonUtils.msg(idsArr, count);       
    }
}
