package cn.xcq.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/4/20.
 */
public class Attendance {
    private Integer id;
    private UserInfo studentid;
    private Integer gradeid;
    private Integer attendanceid;
    private Date attendancetime;
    private Integer attendanceCount;
    //自定义状态
    private Integer chuqin;
    private Integer chidao;
    private Integer queqin;

    public Integer getChuqin() {
        return chuqin;
    }

    public void setChuqin(Integer chuqin) {
        this.chuqin = chuqin;
    }

    public Integer getChidao() {
        return chidao;
    }

    public void setChidao(Integer chidao) {
        this.chidao = chidao;
    }

    public Integer getQueqin() {
        return queqin;
    }

    public void setQueqin(Integer queqin) {
        this.queqin = queqin;
    }




    public Integer getAttendanceCount() {
        return attendanceCount;
    }

    public void setAttendanceCount(Integer attendanceCount) {
        this.attendanceCount = attendanceCount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserInfo getStudentid() {
        return studentid;
    }

    public void setStudentid(UserInfo studentid) {
        this.studentid = studentid;
    }

    public Integer getGradeid() {
        return gradeid;
    }

    public void setGradeid(Integer gradeid) {
        this.gradeid = gradeid;
    }

    public Integer getAttendanceid() {
        return attendanceid;
    }

    public void setAttendanceid(Integer attendanceid) {
        this.attendanceid = attendanceid;
    }

    public Date getAttendancetime() {
        return attendancetime;
    }

    public void setAttendancetime(Date attendancetime) {
        this.attendancetime = attendancetime;
    }
}
