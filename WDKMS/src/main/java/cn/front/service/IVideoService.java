package cn.front.service;

import cn.front.entity.Course;
import cn.front.entity.Video;

import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
public interface IVideoService {
    //精品课程分类
    public Video getDetailsVideo(int t_vid);
}
