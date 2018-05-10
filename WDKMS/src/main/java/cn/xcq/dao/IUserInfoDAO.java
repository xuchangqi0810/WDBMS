package cn.xcq.dao;

import cn.xcq.entity.Log;
import cn.xcq.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/4.
 */
public interface IUserInfoDAO {
    //登录
    public UserInfo isLogin(UserInfo info)throws Exception;
    //查询所有用户分页
    public List<UserInfo> getAll(@Param("unickname") String unickname, int pageIndex, int pageSize)throws Exception;
    //查询所有用户
    public List<UserInfo> getUserInfoExcel()throws Exception;
    //修改  根据id修改
    public int UpdateUser(UserInfo userInfo)throws Exception;
    //根据id获取UserInfo对象
    public UserInfo getUserInfo(int uid);
    //添加用户
    public int addUser(UserInfo userInfo)throws Exception;
    //删除用户
    public int deleteUser(int uid)throws Exception;
    //修改上次登录时间和登录ip
    public int updateLastlogintime(Date lastlogintime, int uid,String lastAddress)throws Exception;
    //查询所有记录数
    public int getCount(@Param("unickname") String unickname)throws Exception;


}
