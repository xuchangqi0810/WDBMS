package cn.xcq.dao;

import cn.xcq.entity.Privilege;

import java.util.List;

/**
 * Created by Administrator on 2018/4/7.
 */
public interface IPrivilegeDAO {
    //获取当前用户绑定权限
    public List<Privilege> getAllPrivilege(Integer uid);
    //获取所有权限
    public List<Privilege> getPrivilege()throws Exception;
}
