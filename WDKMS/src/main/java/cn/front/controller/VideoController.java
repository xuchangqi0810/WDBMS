package cn.front.controller;

import cn.front.entity.Course;
import cn.front.entity.Video;
import cn.front.service.ICourseService;
import cn.front.service.IVideoService;
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
public class VideoController {
    @Resource(name = "videoService")
    private IVideoService iVideoService;

    @RequestMapping("/getVideo/{t_vid}")
    public String getVideo(@PathVariable int t_vid,Model mv){
        Video detailsVideo = iVideoService.getDetailsVideo(t_vid);
        mv.addAttribute("detailsVideo",detailsVideo);
        return "/front/DetailVideo";
    }


    public IVideoService getiVideoService() {
        return iVideoService;
    }

    public void setiVideoService(IVideoService iVideoService) {
        this.iVideoService = iVideoService;
    }
}
