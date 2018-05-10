package cn.xcq.util;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
/**
 * Created by Administrator on 2018/4/6.
 */

public class MD5 {
    private static final Md5PasswordEncoder md5PasswordEncoder=new Md5PasswordEncoder();

    public static String getMd5(String str){
        return md5PasswordEncoder.encodePassword(str,null);
    }
}
