package cn.xcq.dao;

import cn.xcq.entity.Dictionary;
import cn.xcq.entity.UserInfo;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/18.
 */
public interface IDictionaryDAO {
    //获取所有班级
    public List<Dictionary> getDictionary();

    //获取当前老师的所有班级
    public List<Dictionary> getClassAll(int uid);
    //获取班级下的所有学生
    public List<UserInfo> getUserAll(int dicval);
    //添加出勤信息
    public int addSign(Map<String,Object>map);
    //判断当天是否已经保存考勤，如果已保存则不能添加
    public int ifattendance(int gradeid, String datetime);
}
