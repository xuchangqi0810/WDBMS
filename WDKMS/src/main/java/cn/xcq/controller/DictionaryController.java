package cn.xcq.controller;

import cn.xcq.annotation.BusinessAnnotation;
import cn.xcq.entity.Dictionary;
import cn.xcq.entity.UserInfo;
import cn.xcq.service.IDictionaryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/16.
 */
@Controller
public class DictionaryController {
    @Resource(name = "dicService")
    private IDictionaryService iDictionaryService;

    //获取所有班级
    @RequestMapping("/getClassAll")
    public String getClassAll(Model mv, HttpSession session){
        UserInfo user = (UserInfo)session.getAttribute("user");
        List<Dictionary> classAll = iDictionaryService.getClassAll(user.getUid());
        mv.addAttribute("getClassAll",classAll);
        //转发到页面
        return "/background/attendance";
    }

    //查询该班级下的所有学生
    @RequestMapping("/getUserAll")
    @ResponseBody
    public Object getUserAll(String ugradeid){
        List<UserInfo> userAll = iDictionaryService.getUserAll(Integer.parseInt(ugradeid));
        return userAll;
    }

    //添加出勤情况
    @RequestMapping("/addSign")
    @ResponseBody
    //将出勤情况保存到数组中
    @BusinessAnnotation(modelName = "系统管理",option = "添加出勤")
    public Object addSige(String[] stu,String ugradeid){
        //转换日期格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        int ifattendance = iDictionaryService.ifattendance(Integer.parseInt(ugradeid), sdf.format(new Date()));
        //如果保存失败则返回0
        if (ifattendance>0){
            return 0;
        }else{
            List<UserInfo> userAll = iDictionaryService.getUserAll(Integer.parseInt(ugradeid));
            int i=0;
            for (UserInfo item:userAll){
                iDictionaryService.addSign(item.getUid(),item.getUgradeid(),Integer.parseInt(stu[i]),new Date());
                i++;
            }
            return 1;
        }
    }


    public IDictionaryService getiDictionaryService() {
        return iDictionaryService;
    }

    public void setiDictionaryService(IDictionaryService iDictionaryService) {
        this.iDictionaryService = iDictionaryService;
    }
}
