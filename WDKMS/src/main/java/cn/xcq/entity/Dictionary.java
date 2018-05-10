package cn.xcq.entity;

/**
 * Created by Administrator on 2018/4/18.
 */
//字典表
public class Dictionary {
    private int dicid;
    private String dictype;
    private String dicval;
    private String dicdescribe;

    public int getDicid() {
        return dicid;
    }

    public void setDicid(int dicid) {
        this.dicid = dicid;
    }

    public String getDictype() {
        return dictype;
    }

    public void setDictype(String dictype) {
        this.dictype = dictype;
    }

    public String getDicval() {
        return dicval;
    }

    public void setDicval(String dicval) {
        this.dicval = dicval;
    }

    public String getDicdescribe() {
        return dicdescribe;
    }

    public void setDicdescribe(String dicdescribe) {
        this.dicdescribe = dicdescribe;
    }
}
