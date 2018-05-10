package cn.xcq.service;

import cn.xcq.entity.Privilege;

import java.util.List;

/**
 * Created by Administrator on 2018/4/7.
 */
public interface IPrivilegeService {
    //获取当前用户权限
    public List<Privilege> getAllPrivilege(Integer uid);
    //获取所有用户权限
    public List<Privilege> getPrivilege()throws Exception;
}
