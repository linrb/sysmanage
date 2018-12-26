package com.lin.sysmanage.service.Impl;

import com.lin.sysmanage.dao.SysLogMapper;
import com.lin.sysmanage.entity.SysLogEntity;
import com.lin.sysmanage.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Autowired
    MongoTemplate mongoTemplate;

    @Override
    public void saveSysLog(SysLogEntity sysLog) {
        sysLogMapper.saveSysLog( sysLog );
    }

    @Override
    public List<SysLogEntity> listSysLog(Map<String, Object> params) {
        //使用分页插件,核心代码就这一行
        SysLogEntity sysLog = new SysLogEntity();
        String ordeyBy = "create_time DESC";

        int pageSize = (int) params.get( "pageSize" );
        int currentPage = (int) params.get( "pageNum" );
        sysLog = (SysLogEntity) params.get( "sysLog" );
        // PageHelper.startPage(currentPage, pageSize, ordeyBy);
        List<SysLogEntity> sysLogList = sysLogMapper.listSysLog( sysLog );

        //查询MongoDB中的日志
       /* Query query = new Query();
        query.skip((currentPage - 1) * pageSize);
        query.limit(pageSize);
        query.with(new Sort(Sort.Direction.DESC, "create_time"));//按照userId排序
        List<SysLogEntity> mondbList = mongoTemplate.find(query,SysLogEntity.class);
        if(mondbList!=null)
        {
            sysLogList.addAll(mondbList);
        }

        sysLogList.sort( new Comparator<SysLogEntity>() {
            @Override
            public int compare(SysLogEntity sysLogEntity, SysLogEntity t1) {
                return t1.getCreateTime().compareTo( sysLogEntity.getCreateTime());
            }
        } );*/
        return sysLogList;
    }

    @Override
    public List<SysLogEntity> getSysLogListPage(SysLogEntity sysLog) {
        return sysLogMapper.getSysLogListPage(sysLog );
    }

    @Override
    public int getTotal(SysLogEntity sysLog) {
        return sysLogMapper.getTotal( sysLog );
    }

    @Override
    public int batchRemove(Long[] id) {
        return sysLogMapper.batchRemove(id);
    }

    @Override
    public void svaeSysLogToMongoDB(SysLogEntity sysLog) {
        mongoTemplate.save( sysLog );
    }
}
