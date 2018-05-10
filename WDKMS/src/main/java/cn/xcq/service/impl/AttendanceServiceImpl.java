package cn.xcq.service.impl;

import cn.xcq.dao.IAttendanceDAO;
import cn.xcq.dao.IDictionaryDAO;
import cn.xcq.entity.Attendance;
import cn.xcq.entity.ClassAttendance;
import cn.xcq.entity.Dictionary;
import cn.xcq.entity.UserInfo;
import cn.xcq.service.IAttendanceService;
import cn.xcq.service.IDictionaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/18.
 */
@Service("attendanceService")
public class AttendanceServiceImpl implements IAttendanceService {
    @Resource(name = "IAttendanceDAO")
    private IAttendanceDAO iAttendanceDAO;

    public IAttendanceDAO getiAttendanceDAO() {
        return iAttendanceDAO;
    }

    public void setiAttendanceDAO(IAttendanceDAO iAttendanceDAO) {
        this.iAttendanceDAO = iAttendanceDAO;
    }


    //查询指定学员出勤信息
    public List<Attendance> getAttendance(Integer uid,Integer selecttype) {
        Map<String,Object> maps=new HashMap<String, Object>();
        //填充数据
        maps.put("uid",uid);
        maps.put("selecttype",selecttype);

        return iAttendanceDAO.getAttendance(maps);
    }

    //查询指定班级出勤信息
    public ClassAttendance selectClassAttendance(Integer gradeid, Integer selecttype) {
        Map<String,Object> maps=new HashMap<String, Object>();
        //填充数据
        maps.put("gradeid",gradeid);
        maps.put("selecttype",selecttype);

        //获取数据
        List<Attendance> attendances = iAttendanceDAO.selectClassAttendance(maps);
        //创建实体类
        ClassAttendance classAttendance=new ClassAttendance();
        String [] uname=new String[attendances.size()];
        Integer [] chuqin=new Integer[attendances.size()];
        Integer [] chidao=new Integer[attendances.size()];
        Integer [] queqin=new Integer[attendances.size()];

        //循环为数组赋值
        for (int i = 0; i <attendances.size() ; i++) {
            uname[i]=attendances.get(i).getStudentid().getUname();
            chuqin[i]=attendances.get(i).getChuqin();
            chidao[i]=attendances.get(i).getChidao();
            queqin[i]=attendances.get(i).getQueqin();
        }

        classAttendance.setUname(uname);
        classAttendance.setChuqin(chuqin);
        classAttendance.setChidao(chidao);
        classAttendance.setQueqin(queqin);

        //返回实体类
        return classAttendance;
    }
}
