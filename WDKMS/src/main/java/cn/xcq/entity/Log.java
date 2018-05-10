package cn.xcq.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/16.
 */
public class Log {
    private Integer id;
    private String usercode;
    private String username;
    private String operateinfo;
    private Date operatedatetime;
    private String strTime;

    public String getStrTime() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(getOperatedatetime());
        return format;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOperateinfo() {
        return operateinfo;
    }

    public void setOperateinfo(String operateinfo) {
        this.operateinfo = operateinfo;
    }

    public Date getOperatedatetime() {
        return operatedatetime;
    }

    public void setOperatedatetime(Date operatedatetime) {
        this.operatedatetime = operatedatetime;
    }
}
