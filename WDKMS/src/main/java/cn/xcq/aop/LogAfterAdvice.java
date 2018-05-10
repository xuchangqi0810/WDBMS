package cn.xcq.aop;

import cn.xcq.annotation.BusinessAnnotation;
import cn.xcq.entity.Log;
import cn.xcq.entity.UserInfo;
import cn.xcq.service.ILogService;
import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/16.
 */
public class LogAfterAdvice implements AfterReturningAdvice,ApplicationContextAware {
    ApplicationContext act;
    private static final Logger logger=Logger.getLogger(LogAfterAdvice.class);

    //后置增强
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        BusinessAnnotation annotation = method.getAnnotation(BusinessAnnotation.class);
        Log log=new Log();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = sdf.parse(sdf.format(new Date()));

        ILogService service=(ILogService) act.getBean("logService");
        //获取session
        HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        UserInfo user=(UserInfo)session.getAttribute("user");
        if(user!=null){
            log.setUsercode(user.getUid().toString());
            log.setUsername(user.getUnickname());
            if(annotation!=null){
                log.setOperatedatetime(date);
                log.setOperateinfo(annotation.option());
                //添加记录到数据表
                service.adduserLog(log);
                //生成日志在本地硬盘中
                logger.info(annotation.option());
                logger.info(date);
                logger.info(user.getUnickname());
            }
        }

    }

    public void setApplicationContext(ApplicationContext act) throws BeansException {
        this.act=act;
    }
}
