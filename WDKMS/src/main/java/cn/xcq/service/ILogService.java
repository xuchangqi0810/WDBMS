package cn.xcq.service;

import cn.xcq.entity.Log;
import cn.xcq.entity.Page;

import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/16.
 */
public interface ILogService {

    //添加日志
    public int adduserLog(Log log)throws Exception;
    //查询所有日志+分页
    public Page<Log> getAllLog(String unickname, Date opentime, Date lasttime,Integer pageIndex,Integer pageSize);
    //获取所有记录数
    public int getCount(Map<String,Object> map);
}
