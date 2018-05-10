package cn.front.util.sms;

/**
 * Created by 10218 on 2018/5/4.
 */
public class Env {
    //1. 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    public static final String ACCESSKEY_ID = "LTAI3wxbygAFZPHR";
    public static final String ACCESSKEY_SECRET = "kqROCNqbnjKtUsqhohkbRp5cGuh3Ha";


    //2.产品名称:云通信短信API产品,开发者无需替换
    public static final String PRODUCT = "Dysmsapi";
    //产品域名,开发者无需替换
    public static final String DOMAIN = "dysmsapi.aliyuncs.com";


    //3.短信签名和模板,替换成自己的
    public static final String SIGN_NAME  = "校区管理平台";
    public static final String TEMPLATE_CODE  = "SMS_132985163";
}
