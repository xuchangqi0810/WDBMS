package cn.xcq.controller;

import cn.xcq.annotation.BusinessAnnotation;
import cn.xcq.entity.Role;
import cn.xcq.service.IRoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2018/4/9.
 */
//角色
@Controller
public class RoleController {
    //注入Service层对象
    @Resource(name = "roleService")
    private IRoleService iRoleService;

    //查询所有角色
    @RequestMapping("/getAllRole")
    @BusinessAnnotation(modelName = "系统管理",option = "角色列表")
    public String getAllRole(HttpServletRequest request) throws Exception {
        //获取所有角色
        List<Role> allRole = iRoleService.getAllRole();
        request.setAttribute("getRole",allRole);
        return "/background/RoleList";
    }

    //修改角色权限
    @RequestMapping("/updatePrivilegeRoleid")
    @ResponseBody
    @BusinessAnnotation(modelName = "系统管理",option = "修改权限")
    public Object updatePrivilegeRoleid(int roleId,Integer[] privilegeId){

        try {
            iRoleService.addRolePrivilege(roleId,privilegeId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 1;
    }


    public IRoleService getiRoleService() {
        return iRoleService;
    }

    public void setiRoleService(IRoleService iRoleService) {
        this.iRoleService = iRoleService;
    }
}
