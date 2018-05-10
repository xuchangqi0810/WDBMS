package cn.front.controller;

import cn.front.entity.Course;
import cn.front.entity.Video;
import cn.front.service.ICourseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
@Controller
public class CourseController {
    @Resource(name = "courseService")
    private ICourseService iCourseService;


    //分类
    @RequestMapping("/getAllCourse")
    public String getAllCourse(Model mv){
        //精品视频
        List<Course> excellentVideo = iCourseService.getExcellentVideo();
        //新的容器 保存有父子关系的权限
        List<Course> rootMenus=new ArrayList<Course>();
        List<Course> privilegeList = iCourseService.getAllCourse();
        //将平级的权限  变成  有层级关系的权限集合
        for (Course item:privilegeList){
            Course childMenu=item;
            int pid = childMenu.getCparent();
            if (pid==0){
                rootMenus.add(item);
            }else{
                for (Course innerMenu:privilegeList){
                    Integer id = innerMenu.getId();
                    if (id==pid){
                        Course parentMenu=innerMenu;
                        parentMenu.getChildren().add(childMenu);
                        break;
                    }
                }
            }
        }
        mv.addAttribute("courses",rootMenus);
        mv.addAttribute("excellentVideo",excellentVideo);
        return "/front/index";
    }

    //精品课程分类
    @RequestMapping("/getDetailsVideo/{tcid}")
    public String getDetailsVideo(@PathVariable int tcid,Model mv){
        Course detailsVideo = iCourseService.getDetailsVideo(tcid);
        mv.addAttribute("detailsVideo",detailsVideo);
        return "/front/DetailVideo";
    }


    public ICourseService getiCourseService() {
        return iCourseService;
    }

    public void setiCourseService(ICourseService iCourseService) {
        this.iCourseService = iCourseService;
    }
}
