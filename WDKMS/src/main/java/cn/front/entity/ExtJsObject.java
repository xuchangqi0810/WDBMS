package cn.front.entity;

/**
 * Created by 10218 on 2018/5/4.
 */
import java.io.Serializable;
@SuppressWarnings("serial")
public class ExtJsObject implements Serializable {
    private boolean success = false;
    private String msg = "";

    public ExtJsObject() {

    }

    public ExtJsObject(boolean success, String msg) {
        this(success, msg, null);
    }

    public ExtJsObject(boolean success, String msg, Object obj) {
        this.success = success;
        this.msg = msg;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
