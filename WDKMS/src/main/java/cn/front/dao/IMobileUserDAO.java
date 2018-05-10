package cn.front.dao;

import cn.front.entity.MobileUser;

/**
 * Created by Administrator on 2018/5/4.
 */
public interface IMobileUserDAO {
    //登录
    public MobileUser login(MobileUser user)throws Exception;
    //注册
    public int register(MobileUser user)throws Exception;

}
