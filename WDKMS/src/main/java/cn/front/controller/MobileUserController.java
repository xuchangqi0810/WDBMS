package cn.front.controller;

import cn.front.entity.ExtJsObject;
import cn.front.entity.MobileUser;
import cn.front.service.IMobileUserService;
import cn.front.util.sms.CheckSumBuilder;
import cn.front.util.sms.ShortMessageService;
import com.alibaba.druid.util.StringUtils;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/5.
 */
@Controller
public class MobileUserController {
    private static Map<String, Integer> sendNumMap = new HashMap<String, Integer>();

    public static Map<String, String> mobilevcodeMap = new HashMap<String, String>();

    private static int sentTime = 3; // 短信限制的次数
    @Resource(name="mobileService")
    private IMobileUserService iMobileUserService;


    //登录
    @RequestMapping("/islogin")
    @ResponseBody
    public Object isLogin(MobileUser user, HttpSession session) throws Exception {
        //获取对象
        MobileUser login = iMobileUserService.login(user);
        if(login!=null&&login.getUsername()!=null){
            //保存到session作用域中
            session.setAttribute("muser",login);
            //登录成功
            return 1;
        }
        //登录失败
        return 0;
    }


    //注册
    @RequestMapping("/insertUser")
    @ResponseBody
    public Object insertUser(MobileUser user,HttpSession session) throws Exception {
        int register = iMobileUserService.register(user);
        if(register>0){
            //将注册成功的数据保存到session中
            session.setAttribute("muser",user);
            return 1;
        }
        return 0;
    }



    /**
     *
     * sendMobileCode: 发送手机验证码. <br/>
     *
     * @author qiyongkang
     * @param request
     * @return
     * @since JDK 1.6
     */
    @RequestMapping("/sendSms")
    @ResponseBody
    public ExtJsObject sendMobileCode(HttpServletRequest request) throws Exception {
        ExtJsObject extJsObject = new ExtJsObject();
        // session
        HttpSession session = request.getSession();
        // 获取手机号
        String mobile = request.getParameter("mobile");
        // 验证是否重复发送
        if (sendNumMap.size() > 0 && sendNumMap.get(mobile) != null) {
            // 当天发送短信条数的限制
            int number = sendNumMap.get(mobile);
            if (number == sentTime) {
                extJsObject.setSuccess(false);
                extJsObject.setMsg("每个号码每天只能获取" + sentTime + "次注册验证码");
                return extJsObject;
            }
        }
        String code= CheckSumBuilder.getCheckSum();
        System.out.println(code);

        //发送验证码
        boolean result = sendMessage(mobile, code);

        if (result) {

            // 把验证码和手机号，生成时间绑定
            session.setAttribute("@vcode", mobile + "|" + code + "|");
            //Cookie cookie = new Cookie("code",code);
            session.setMaxInactiveInterval(60);
            // 记录短信验证码
            mobilevcodeMap.put(mobile, code);

            // 记录同一号码发送次数
            Integer num = sendNumMap.get(mobile);
            if (num == null) {
                sendNumMap.put(mobile, 1);
            } else {
                sendNumMap.put(mobile, ++num);
            }

            extJsObject.setSuccess(true);
            extJsObject.setMsg("发送成功!");
            return extJsObject;
        } else {
            session.removeAttribute("@vcode");
            extJsObject.setSuccess(false);
            extJsObject.setMsg("发送失败!");
            return extJsObject;
        }
    }

    /**
     *
     * sendMessage: 发送短信的逻辑. <br/>
     *
     * @author qiyongkang
     * @param mobile
     * @param code
     * @return
     * @since JDK 1.6
     */
    private boolean sendMessage(String mobile,String code) throws Exception {
        //2.调用接口，发短信
        SendSmsResponse response = ShortMessageService.sendSms(mobile, code);

        //3.获取发送结果
        System.out.println("短信接口返回的数据----------------");
        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());

        Thread.sleep(3000L);

        //查明细
        if (response.getCode() != null && response.getCode().equals("OK")) {
            QuerySendDetailsResponse querySendDetailsResponse = ShortMessageService.querySendDetails(response.getBizId(), mobile);
            System.out.println("短信明细查询接口返回数据----------------");
            System.out.println("Code=" + querySendDetailsResponse.getCode());
            System.out.println("Message=" + querySendDetailsResponse.getMessage());
            int i = 0;
            for (QuerySendDetailsResponse.SmsSendDetailDTO smsSendDetailDTO : querySendDetailsResponse.getSmsSendDetailDTOs()) {
                System.out.println("SmsSendDetailDTO[" + i + "]:");
                System.out.println("Content=" + smsSendDetailDTO.getContent());
                System.out.println("ErrCode=" + smsSendDetailDTO.getErrCode());
                System.out.println("OutId=" + smsSendDetailDTO.getOutId());
                System.out.println("PhoneNum=" + smsSendDetailDTO.getPhoneNum());
                System.out.println("ReceiveDate=" + smsSendDetailDTO.getReceiveDate());
                System.out.println("SendDate=" + smsSendDetailDTO.getSendDate());
                System.out.println("SendStatus=" + smsSendDetailDTO.getSendStatus());
                System.out.println("Template=" + smsSendDetailDTO.getTemplateCode());
            }
            System.out.println("TotalCount=" + querySendDetailsResponse.getTotalCount());
            System.out.println("RequestId=" + querySendDetailsResponse.getRequestId());
        }
        return true;
    }

    /**
     *
     * validateMobileCode: 校验手机验证码. <br/>
     *
     * @author qiyongkang
     * @param request
     * @return
     * @since JDK 1.6
     */
    @RequestMapping("/checkSms")
    @ResponseBody
    public ExtJsObject validateMobileCode(HttpServletRequest request) {
        ExtJsObject extJsObject = new ExtJsObject();
        // 获取手机号 和验证码
        String mobile = request.getParameter("mobile");
        String userCode = request.getParameter("vCode");
        // 从session获取验证信息
        HttpSession session = request.getSession();
        String codeAndMobile = (String) session.getAttribute("@vcode");
        if (StringUtils.isEmpty(codeAndMobile)) {
            extJsObject.setSuccess(false);
            extJsObject.setMsg("验证码已失效");
            return extJsObject;
        }
        String sessionMobile = codeAndMobile.split("\\|")[0];
        String vcode = mobilevcodeMap.get(mobile);
        // 判断输入手机号码和获取验证码手机号码是否一致
        if (!sessionMobile.equals(mobile)) {
            extJsObject.setSuccess(false);
            extJsObject.setMsg("手机号码修改后,请重新获取短信验证码");
            return extJsObject;
        } else if(sessionMobile.equals(mobile)&&vcode.equals(userCode.trim())) {
            extJsObject.setSuccess(true);
            extJsObject.setMsg("验证成功!");
            return extJsObject;
        } else if(!vcode.equals(userCode.trim())){
            extJsObject.setSuccess(false);
            extJsObject.setMsg("验证码输入错误，请重新输入");
            return extJsObject;
        }else{
            extJsObject.setSuccess(false);
            extJsObject.setMsg("出现了意外");
            return extJsObject ;
        }
    }




    public IMobileUserService getiMobileUserService() {
        return iMobileUserService;
    }

    public void setiMobileUserService(IMobileUserService iMobileUserService) {
        this.iMobileUserService = iMobileUserService;
    }
}
