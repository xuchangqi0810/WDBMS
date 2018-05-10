package cn.front.service;

import cn.front.entity.Course;
import cn.front.entity.MobileUser;
import cn.front.entity.Video;

import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
public interface IMobileUserService {

    //登录
    public MobileUser login(MobileUser user)throws Exception;

    //注册
    public int register(MobileUser user)throws Exception;
}
