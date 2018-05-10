package cn.front.service.impl;

import cn.front.dao.ICourseDAO;
import cn.front.dao.IOrderDAO;
import cn.front.entity.Course;
import cn.front.entity.Order;
import cn.front.entity.Video;
import cn.front.service.ICourseService;
import cn.front.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Resource(name = "IOrderDAO")
    public IOrderDAO iOrderDAO;

    public IOrderDAO getiOrderDAO() {
        return iOrderDAO;
    }

    public void setiOrderDAO(IOrderDAO iOrderDAO) {
        this.iOrderDAO = iOrderDAO;
    }

    @Override
    public int addOrder(Order order) {
        return iOrderDAO.addOrder(order);
    }

    @Override
    public int updateOrder(Integer ordernumber) {
        return iOrderDAO.updateOrder(ordernumber);
    }
}
