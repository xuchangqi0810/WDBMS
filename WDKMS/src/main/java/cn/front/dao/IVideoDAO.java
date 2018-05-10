package cn.front.dao;

import cn.front.entity.Video;


/**
 * Created by Administrator on 2018/4/27.
 */
public interface IVideoDAO {
   //视频详情
    public Video getDetailsVideo(int t_vid);
}
