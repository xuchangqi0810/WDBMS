package cn.xcq.entity;/**
 * Created by Happy on 2018-03-30.
 */

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserInfo {
    public UserInfo() {
    }

    public UserInfo(Integer uid, String uname, String unickname, String upwd, String uemail, String uphone, String uidentityid, Date ubirthday, String ugradeid, String ugender, Date lastlogintime, String lastAddress) {
        this.uid = uid;
        this.uname = uname;
        this.unickname = unickname;
        this.upwd = upwd;
        this.uemail = uemail;
        this.uphone = uphone;
        this.uidentityid = uidentityid;
        this.ubirthday = ubirthday;
        this.ugradeid = ugradeid;
        this.ugender = ugender;
        this.lastlogintime = lastlogintime;
        this.lastAddress = lastAddress;
    }

    private Integer      uid  ;

    @NotEmpty(message = "真实姓名不能为空")
    @Size(max = 6,min = 2,message = "真实性名必须在2-6位之间")
    private String   	 uname  ;

    @NotEmpty(message = "用户名不能为空")
    @Size(max = 16,min = 1,message = "用户名必须在1-16位之间")
    private String   	 unickname  ;

    @Size(max = 16,min = 6,message = "密码必须在1-16位之间")
    private String   	 upwd  ;


    @NotEmpty(message = "邮箱不能为空")
    @Pattern(regexp = "^\\w+@\\w+\\.\\w+$",message = "邮箱格式不正确")
    private String   	 uemail  ;

    @NotEmpty(message = "手机号不能为空")
    @Pattern(regexp = "^(\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$",message = "联系电话格式不正确")
    private String   	 uphone  ;

    @NotEmpty(message = "身份证号不能为空")
    @Pattern(regexp = "^\\d{17}[0-9,x,X]{1}$",message = "身份证号格式不正确")
    private String   	 uidentityid  ;


    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ubirthday  ;  //出生日期
    private String strbirthday;

    //@NotEmpty(message = "年级不能为空")
    private String   	 ugradeid  ; //年级编号

    @NotEmpty(message = "请选择性别")
    private String  ugender ; //性别

    //最后登录时间
    private Date lastlogintime;

    private String lastlogin;

    //最后登录地点
    private String lastAddress;

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getLastAddress() {
        return lastAddress;
    }

    public void setLastAddress(String lastAddress) {
        this.lastAddress = lastAddress;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", unickname='" + unickname + '\'' +
                ", upwd='" + upwd + '\'' +
                ", uemail='" + uemail + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uidentityid='" + uidentityid + '\'' +
                ", ubirthday=" + ubirthday +
                ", strbirthday='" + strbirthday + '\'' +
                ", ugender='" + ugender + '\'' +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUnickname() {
        return unickname;
    }

    public void setUnickname(String unickname) {
        this.unickname = unickname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getUidentityid() {
        return uidentityid;
    }

    public void setUidentityid(String uidentityid) {
        this.uidentityid = uidentityid;
    }

    public Date getUbirthday() {
        return ubirthday;
    }

    public String getLastlogin(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
        String format = sdf.format(getLastlogintime());
        return format;
    }

    public String getStrbirthday(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(getUbirthday());
        return format;
    }

    public void setUbirthday(Date ubirthday) {
        this.ubirthday = ubirthday;
    }

    public String getUgradeid() {
        return ugradeid;
    }

    public void setUgradeid(String ugradeid) {
        this.ugradeid = ugradeid;
    }
    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }
}

