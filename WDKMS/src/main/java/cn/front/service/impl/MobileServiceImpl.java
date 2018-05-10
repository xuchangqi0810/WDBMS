package cn.front.service.impl;

import cn.front.dao.IMobileUserDAO;
import cn.front.dao.IVideoDAO;
import cn.front.entity.MobileUser;
import cn.front.entity.Video;
import cn.front.service.IMobileUserService;
import cn.front.service.IVideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/4/27.
 */
@Service("mobileService")
public class MobileServiceImpl implements IMobileUserService {
    @Resource(name = "IMobileUserDAO")
    public IMobileUserDAO iMobileUserDAO;


    @Override
    public MobileUser login(MobileUser user) throws Exception {
        return iMobileUserDAO.login(user);
    }

    @Override
    public int register(MobileUser user) throws Exception {
        return iMobileUserDAO.register(user);
    }
}
