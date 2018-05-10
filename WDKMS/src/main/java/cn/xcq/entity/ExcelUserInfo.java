package cn.xcq.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/4/25.
 */
public class ExcelUserInfo {
    private String ugradename;
    private String uname;
    private String unickname;
    private String uphone;
    private String ugender;
    private String uemail;
    private Date ubirthday;
    private String uidentityid;

    public String getUgradename() {
        return ugradename;
    }

    public void setUgradename(String ugradename) {
        this.ugradename = ugradename;
    }

    public String getUidentityid() {
        return uidentityid;
    }

    public void setUidentityid(String uidentityid) {
        this.uidentityid = uidentityid;
    }

    @Override
    public String toString() {
        return "ExcelUserInfo{" +
                "uname='" + uname + '\'' +
                ", unickname='" + unickname + '\'' +
                ", ugradename='" + ugradename + '\'' +
                ", ugender='" + ugender + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uemail='" + uemail + '\'' +
                ", ubirthday=" + ubirthday +
                ", uidentityid='" + uidentityid + '\'' +
                '}';
    }

    public Date getUbirthday() {
        return ubirthday;
    }

    public void setUbirthday(Date ubirthday) {
        this.ubirthday = ubirthday;
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

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }
}
