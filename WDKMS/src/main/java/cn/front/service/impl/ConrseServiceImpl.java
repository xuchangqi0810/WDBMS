package cn.front.service.impl;

import cn.front.dao.ICourseDAO;
import cn.front.entity.Course;
import cn.front.entity.Video;
import cn.front.service.ICourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
@Service("courseService")
public class ConrseServiceImpl implements ICourseService {
    @Resource(name = "ICourseDAO")
    public ICourseDAO iCourseDAO;

    public List<Course> getAllCourse() {
        return iCourseDAO.getAllCourse();
    }

    @Override
    public List<Course> getExcellentVideo() {
        return iCourseDAO.getExcellentVideo();
    }

    @Override
    public Course getDetailsVideo(int t_cid) {
        return iCourseDAO.getDetailsVideo(t_cid);
    }


    public ICourseDAO getiCourseDAO() {
        return iCourseDAO;
    }

    public void setiCourseDAO(ICourseDAO iCourseDAO) {
        this.iCourseDAO = iCourseDAO;
    }
}
