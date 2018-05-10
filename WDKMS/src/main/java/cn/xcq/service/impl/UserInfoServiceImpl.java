package cn.xcq.service.impl;

import cn.xcq.dao.IUserInfoDAO;
import cn.xcq.entity.Log;
import cn.xcq.entity.Page;
import cn.xcq.entity.UserInfo;
import cn.xcq.service.IUserInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/4.
 */
@Service("userInfoService")
public class UserInfoServiceImpl implements IUserInfoService {

    @Resource(name = "IUserInfoDAO")
    private IUserInfoDAO userInfoDao;

    //登录
    public UserInfo isLogin(UserInfo info) throws Exception {
        return userInfoDao.isLogin(info);
    }
    //查询全部
    public Page<UserInfo> getAll(String unickname,int pageIndex, int pageSize) throws Exception {
        //创建对象
        Page<UserInfo> page=new Page<UserInfo>();
        //获取分页数据
        List<UserInfo> all = userInfoDao.getAll(unickname,pageIndex * pageSize, pageSize);
        //保存当前分页用户
        page.setLists(all);
        //当前页数
        page.setPageIndex(pageIndex);
        //本页记录数
        page.setPageSize(pageSize);
        //总记录数
        int count = userInfoDao.getCount(unickname);
        page.setTotalSize(count);
        return page;
    }

    public List<UserInfo> getUserInfoExcel() throws Exception {
        return userInfoDao.getUserInfoExcel();
    }

    //根据id修改
    @Transactional
    public int UpdateUser(UserInfo userInfo) throws Exception {
        return userInfoDao.UpdateUser(userInfo);
    }
    //根据id获取UserInfo对象
    public UserInfo getUserInfo(int uid) {
        return userInfoDao.getUserInfo(uid);
    }

    //添加用户
    @Transactional
    public int addUser(UserInfo userInfo) throws Exception {
        return userInfoDao.addUser(userInfo);
    }

    //删除用户
    @Transactional
    public int deleteUser(int uid) throws Exception {
        return userInfoDao.deleteUser(uid);
    }

    //修改上次登录时间和ip
    @Transactional
    public int updateLastlogintime(Date lastlogintime,int uid ,String lastAddress) throws Exception {
        return userInfoDao.updateLastlogintime(lastlogintime,uid,lastAddress);
    }

    public int getCount(String unickname) throws Exception {
        return userInfoDao.getCount(unickname);
    }

    public IUserInfoDAO getUserInfoDao() {
        return userInfoDao;
    }

    public void setUserInfoDao(IUserInfoDAO userInfoDao) {
        this.userInfoDao = userInfoDao;
    }
}
