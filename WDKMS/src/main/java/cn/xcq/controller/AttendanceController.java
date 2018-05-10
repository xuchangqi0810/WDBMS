package cn.xcq.controller;

import cn.xcq.annotation.BusinessAnnotation;
import cn.xcq.entity.Attendance;
import cn.xcq.entity.ClassAttendance;
import cn.xcq.entity.Dictionary;
import cn.xcq.entity.UserInfo;
import cn.xcq.service.IAttendanceService;
import cn.xcq.service.IDictionaryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/4/20.
 */
@Controller
public class AttendanceController {
    @Resource(name = "dicService")
    private IDictionaryService iDictionaryService;

    @Resource(name = "attendanceService")
    private IAttendanceService iAttendanceService;


    //加载页面
    @RequestMapping("/getAttendance")
    public String getAttendance(){
        return "/background/attenceByOneUser";
    }

    @RequestMapping("/getAttendanceInfo")
    @ResponseBody
    @BusinessAnnotation(modelName = "系统管理",option = "查看个人考勤")
    public Object getAttendanceInfo(String uid,String selecttype){
        //根据用户id和查询方法获取当前对象的出勤情况
        List<Attendance> attendance = iAttendanceService.getAttendance(Integer.parseInt(uid), Integer.parseInt(selecttype));
        //返回数据
        return attendance;
    }


    //获取所有班级
    @RequestMapping("/getClass")
    public String getClass(HttpSession session, Model mv){
        //获取当前登录对象id
        UserInfo user=(UserInfo) session.getAttribute("user");
        //根据当前登录对象id获取其班级
        List<Dictionary> classAll = iDictionaryService.getClassAll(user.getUid());
        //保存数据
        mv.addAttribute("dictionaryList",classAll);
        //转发到页面
        return "/background/SelectClassAttence";
    }

    //查询该班级下的所有出勤情况
    @RequestMapping("/selectClassList")
    @ResponseBody
    @BusinessAnnotation(modelName = "系统管理",option = "查看班级考勤")
    public Object selectClassList(int gradeid,int selecttype){
        System.out.println(gradeid+"------"+selecttype);
        //根据班级id和查询方法获取该班级下的出勤情况
        ClassAttendance attendances = iAttendanceService.selectClassAttendance(gradeid,selecttype);
        //返回数据
        return attendances;
    }

    public IAttendanceService getiAttendanceService() {
        return iAttendanceService;
    }

    public void setiAttendanceService(IAttendanceService iAttendanceService) {
        this.iAttendanceService = iAttendanceService;
    }

    public IDictionaryService getiDictionaryService() {
        return iDictionaryService;
    }

    public void setiDictionaryService(IDictionaryService iDictionaryService) {
        this.iDictionaryService = iDictionaryService;
    }
}
