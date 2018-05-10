package cn.xcq.dao;

import cn.xcq.entity.Attendance;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/20.
 */
public interface IAttendanceDAO {
    //查询指定学员出勤信息
    public List<Attendance> getAttendance(Map<String,Object> map);
    //查询指定班级的出勤信息
    public List<Attendance> selectClassAttendance(Map<String,Object> map);
}
