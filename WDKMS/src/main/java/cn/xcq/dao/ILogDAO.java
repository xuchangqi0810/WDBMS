package cn.xcq.dao;

import cn.xcq.entity.Log;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/16.
 */
public interface ILogDAO {
    //添加日志
    public int adduserLog(Log log)throws Exception;
    //查询日志+分页
    public List<Log> getAllLog(Map<String,Object> map);
    //获取所有记录数
    public int getCount(Map<String,Object> map);
}
