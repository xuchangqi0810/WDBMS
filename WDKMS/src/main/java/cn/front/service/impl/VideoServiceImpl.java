package cn.front.service.impl;

import cn.front.dao.ICourseDAO;
import cn.front.dao.IVideoDAO;
import cn.front.entity.Course;
import cn.front.entity.Video;
import cn.front.service.ICourseService;
import cn.front.service.IVideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
@Service("videoService")
public class VideoServiceImpl implements IVideoService {
    @Resource(name = "IVideoDAO")
    public IVideoDAO iVideoDAO;

    public IVideoDAO getiVideoDAO() {
        return iVideoDAO;
    }

    public void setiVideoDAO(IVideoDAO iVideoDAO) {
        this.iVideoDAO = iVideoDAO;
    }

    @Override
    public Video getDetailsVideo(int t_vid) {
        return iVideoDAO.getDetailsVideo(t_vid);
    }
}
