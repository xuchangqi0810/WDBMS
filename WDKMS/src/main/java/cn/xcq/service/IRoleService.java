package cn.xcq.service;

import cn.xcq.entity.Privilege;
import cn.xcq.entity.Role;

import java.util.List;

/**
 * Created by Administrator on 2018/4/9.
 */
public interface IRoleService {
    //查询所有角色
    public List<Role> getAllRole()throws Exception;
    //获取角色所拥有的权限
    public List<Privilege> getRolePrivilege(int rid);
    //添加角色权限
    public void addRolePrivilege(Integer roleId,Integer[] privilegeId)throws Exception;
}
