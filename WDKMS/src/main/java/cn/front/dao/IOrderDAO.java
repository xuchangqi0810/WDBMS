package cn.front.dao;

import cn.front.entity.Course;
import cn.front.entity.Order;
import cn.front.entity.Video;

import java.util.List;

/**
 * Created by Administrator on 2018/4/27.
 */
public interface IOrderDAO {

    //添加订单
    public int addOrder(Order order);

    //修改订单状态
    public int updateOrder(Integer ordernumber);
}
