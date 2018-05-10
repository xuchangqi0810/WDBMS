package cn.xcq.service.impl;

import cn.xcq.dao.ILogDAO;
import cn.xcq.entity.Log;
import cn.xcq.entity.Page;
import cn.xcq.service.ILogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/16.
 */
@Service("logService")
public class LogServiceImpl implements ILogService {
    @Resource(name = "ILogDAO")
    private ILogDAO iLogDAO;

    //添加日志
    @Transactional
    public int adduserLog(Log log) throws Exception {
        return iLogDAO.adduserLog(log);
    }

    //查询所有日志记录
    public Page<Log> getAllLog(String unickname, Date opentime, Date lasttime,Integer pageIndex,Integer pageSize) {
        Page<Log> page=new Page<Log>();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("username",unickname);
        map.put("opentime",opentime);
        map.put("lasttime",lasttime);
        map.put("pageIndex",pageIndex);
        map.put("pageSize",pageSize);

        List<Log> allLog = iLogDAO.getAllLog(map);
        page.setLists(allLog);
        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalSize(getCount(map));
        return page;
    }

    //查询所有日志记录
    public int getCount(Map<String,Object> map) {
        return iLogDAO.getCount(map);
    }

    public ILogDAO getiLogDAO() {
        return iLogDAO;
    }

    public void setiLogDAO(ILogDAO iLogDAO) {
        this.iLogDAO = iLogDAO;
    }
}
