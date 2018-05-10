package cn.xcq.controller;

import cn.xcq.annotation.BusinessAnnotation;
import cn.xcq.entity.Log;
import cn.xcq.entity.Page;
import cn.xcq.service.ILogService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/16.
 */
@Controller
public class LogController {
    @Resource(name = "logService")
    private ILogService iLogService;

    //加载页面
    @RequestMapping("/getAllLog")
    public String getAllLog(){
        return "/background/LogList";
    }

    @InitBinder
    public void resolveException(WebDataBinder webDataBinder) {
        //设置转换格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        //参数一:转换格式      参数二:是否允许为空字符串
        webDataBinder.registerCustomEditor(Date.class,new CustomDateEditor(sdf,true));
    }


    @RequestMapping("/getAllLogJSON")
    @ResponseBody
    public Object getAllLogJSON(String unickname,  Date opentime, Date lasttime, @RequestParam(defaultValue = "1")int pageIndex, @RequestParam(defaultValue = "2")int pageSize) throws Exception {
        Page<Log> allLog = iLogService.getAllLog(unickname, opentime, lasttime, pageIndex, pageSize);
        return allLog;
}


    public ILogService getiLogService() {
        return iLogService;
    }

    public void setiLogService(ILogService iLogService) {
        this.iLogService = iLogService;
    }
}
