package cn.front.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/5/8.
 */
public class Order {
    private Integer id;
    private Integer uid;
    private Integer ordernumber;
    private Integer t_vid;
    private double price;
    private Integer type;
    private Date ordertime;

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

    public Integer getT_vid() {
        return t_vid;
    }

    public void setT_vid(Integer t_vid) {
        this.t_vid = t_vid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
