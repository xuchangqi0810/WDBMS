package cn.xcq.service;

import cn.xcq.entity.Dictionary;
import cn.xcq.entity.UserInfo;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/18.
 */
public interface IDictionaryService {

    //获取所有班级
    public List<Dictionary> getDictionary();
    //查询所有班级
    public List<Dictionary> getClassAll(int uid);
    //获取班级下的所有学生
    public List<UserInfo> getUserAll(int dicval);
    //添加出勤信息
    public int addSign(Integer studentid, String gradeid, Integer attendanceid, Date attendancetime);
    //判断当天是否已经保存考勤，如果已保存则不能添加
    public int ifattendance(int gradeid, String datetime);
}
