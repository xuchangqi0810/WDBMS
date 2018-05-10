package cn.xcq.dao;

import cn.xcq.entity.Privilege;
import cn.xcq.entity.Role;

import java.util.List;

/**
 * Created by Administrator on 2018/4/9.
 */
public interface IRoleDAO {
    //查询所有角色
    public List<Role> getAllRole()throws Exception;
    //获取角色所拥有的权限
    public List<Privilege> getRolePrivilege(int rid);
    //添加角色权限
    public void addRolePrivilege(Integer roleId,Integer privilegeId)throws Exception;
    //删除角色权限
    public int DeleteRolePrivilege(Integer roleId)throws Exception;
}
