package cn.front.entity;

import java.util.ArrayList;
import java.util.List;


public class Course {
    private Integer id;
    private String  cimage;
    private String  cname;
    private Integer cparent;
    private Integer comment;
    private Integer type;
    private List<Course> children=new ArrayList<Course>();
    private  String courseintroduction;
    private  String courseTarget;
    private  String compatiblepeople;
    private  double price;
    private List<Video> videoList=new ArrayList<Video>();


    public Integer getType() {
        return type;
    }

    public void setType(Integer t_type) {
        this.type = t_type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCimage() {
        return cimage;
    }

    public void setCimage(String cimage) {
        this.cimage = cimage;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getCparent() {
        return cparent;
    }

    public void setCparent(Integer cparent) {
        this.cparent = cparent;
    }

    public Integer getComment() {
        return comment;
    }

    public void setComment(Integer comment) {
        this.comment = comment;
    }

    public List<Course> getChildren() {
        return children;
    }

    public void setChildren(List<Course> children) {
        this.children = children;
    }


    public String getCourseintroduction() {
        return courseintroduction;
    }

    public void setCourseintroduction(String courseintroduction) {
        this.courseintroduction = courseintroduction;
    }

    public String getCourseTarget() {
        return courseTarget;
    }

    public void setCourseTarget(String courseTarget) {
        this.courseTarget = courseTarget;
    }

    public String getCompatiblepeople() {
        return compatiblepeople;
    }

    public void setCompatiblepeople(String compatiblepeople) {
        this.compatiblepeople = compatiblepeople;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }
}
