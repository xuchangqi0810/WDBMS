package cn.xcq.service.impl;

import cn.xcq.dao.IPrivilegeDAO;
import cn.xcq.entity.Privilege;
import cn.xcq.service.IPrivilegeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/4/7.
 */
@Service("privilegeService")
public class PrivilegeServiceImpl implements IPrivilegeService {
    @Resource(name = "IPrivilegeDAO")
    private IPrivilegeDAO iPrivilegeDAO;
    //获取当前用户权限
    public List<Privilege> getAllPrivilege(Integer uid) {
        return iPrivilegeDAO.getAllPrivilege(uid);
    }

    //获取所有用户权限
    public List<Privilege> getPrivilege() throws Exception {
        return iPrivilegeDAO.getPrivilege();
    }


    public IPrivilegeDAO getiPrivilegeDAO() {
        return iPrivilegeDAO;
    }

    public void setiPrivilegeDAO(IPrivilegeDAO iPrivilegeDAO) {
        this.iPrivilegeDAO = iPrivilegeDAO;
    }
}
