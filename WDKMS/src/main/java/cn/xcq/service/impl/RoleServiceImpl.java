package cn.xcq.service.impl;

import cn.xcq.dao.IRoleDAO;
import cn.xcq.entity.Privilege;
import cn.xcq.entity.Role;
import cn.xcq.service.IRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/4/9.
 */
@Service("roleService")
public class RoleServiceImpl implements IRoleService {
    //注入DAO层对象
    @Resource(name = "IRoleDAO")
    private IRoleDAO iRoleDAO;

    public List<Role> getAllRole() throws Exception {
        return iRoleDAO.getAllRole();
    }

    //获取角色所拥有的权限
    public List<Privilege> getRolePrivilege(int rid) {
        return iRoleDAO.getRolePrivilege(rid);
    }

    //添加角色权限
    public void addRolePrivilege(Integer roleId,Integer[] privilegeId) throws Exception {
        iRoleDAO.DeleteRolePrivilege(roleId);
        for (Integer i:privilegeId) {
            iRoleDAO.addRolePrivilege(roleId,i);
        }

    }


    public IRoleDAO getiRoleDAO() {
        return iRoleDAO;
    }

    public void setiRoleDAO(IRoleDAO iRoleDAO) {
        this.iRoleDAO = iRoleDAO;
    }
}
