package cn.front.service;

import cn.front.entity.Course;
import cn.front.entity.Video;

import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
public interface ICourseService {
    //分类
    public List<Course> getAllCourse();

    //精品课程
    public List<Course> getExcellentVideo();

    //精品课程分类
    public Course getDetailsVideo(int t_cid);
}
