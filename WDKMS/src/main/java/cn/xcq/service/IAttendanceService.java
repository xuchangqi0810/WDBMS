package cn.xcq.service;

import cn.xcq.entity.Attendance;
import cn.xcq.entity.ClassAttendance;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/20.
 */
public interface IAttendanceService {
    //查询指定学员当天出勤信息
    public List<Attendance> getAttendance(Integer uid,Integer selecttype);
    //查询指定班级的出勤信息
    public ClassAttendance selectClassAttendance(Integer gradeid, Integer selecttype);
}
