package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016091400512817";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCbaI9YFj8GwRfJxNe9Zd3bDjY1mI4AmJhEkV4i9eDnWf5S2O1Lk/b64lPufOWz1d8PGqHiaX9cEH7CupKlI4osngmZUVs+TBosqdMxC8MEkE/rpgrVG3qwiHhpEUvI/zdAYxjxVvc7PHKcpmprX3EefzebnPIbW4MKp67ZlAKv8mEX6NeFXn4GocsD/+uJ1GTr9k9CeySR8okNWvP+rMBRYNMucKDp8rWXfpN0+UUmG5CdiRh/4okYaJ4PAAi++ipXtAT6Q3nLABp89wWErfC5Qbv7EK57VOkMXHYAUZ1+0tbqKCa+zTkZHHQJg851kKYWToqsk31jOOy8xFzwj/G3AgMBAAECggEAK728SuDIEJCcr2+2AVsAnL1dSKyNm2FXykTYKCLokHVl/c+Myq703xyA3ylMRde2lru6QM3MyQ7jfs+gotZj97broLmjYt9sppGOHcnftBMiS4NKnTzExZdDvN7fY81hsb+yr4r4vzV+VNUKMvqEDj9kWWpNQqH5OjCEKD1enEK71YqcOsD3oBnOT534ok7jkO0RSlyhg2wCyM3JGY39ywvZdPbiBLtId22cXF2ecmbSFk2ckJqnlKLMrV9OzN8Wj0LgXJtArtimZOBonEm0sLMVvIDAZCbpnITU60V6VdeMIMRBsVsa5Qgje8X1ZITOOhgDm8tUZBK+VyP7uL82UQKBgQDy5LyYuHDsddRoSVE+Z0hIhMkbARUwCOMFBYM8qJ699qT48fJxIwSMmUZ8/7JIFkpzVfcXZWX/9NhGdGIpiZMMwQwKpMgVWIWWo/rZYD5w1NDzVPfOYM/HzNqxyoi00IlHWvZCblkfFBQL2UObOEzEh+Qb2S2Db9YylZJ1EB/R8wKBgQCjy1QwvJcoIYF+Pn61kbEVqSU8JXLH0ZFUuM+5O5ZjC1rHxE086U2D+Dj6lzlZROzykv1Mta9bC35Wb5D2cD+gLcyYHDKRlASWXi2kWM7bpn2hC7UpM8Kyj/CNHJOCrzR3Usp95b7nB1mdrUZRdbEX5DVWpwCbObSTbyLEMwBOLQKBgQCjrkj5kbFnZ7AP5vh82RT46aKsM/qXOCXkSGa8BdWTphZePI1oeHSkWtYJfjYiJgNd3dx5Q7eM2O6169AKtc8GlUEMGydKWzEK5s4wlo79ciytDeFAjjT3K7FkhlvBnZYlI8M32SztqJYpteu9Oh9hgUHTEnN9U2xBAlKD2K3YyQKBgFKbsNlntCCkTWf7YvJ2CUbwaPwdsvb+RfrhvrogSGepiV5pLb9DtzmQzkPsUxsnvQ1WfvPaShd0A4Laf9UapaxGjQJGbmanrWydEQ3rUGDNZlz7x6GBHnfqSpsQx4DIloB7u+6lGZPxTAxPIMDix69SBGiwj4i6IM2e5nzncAb9AoGAa6KNWvHj8FJFKCGSU0zibKjPQnJ0Z08LjKlEO4CQJg//8oS3Qt6tLewIzvaxX98n3qRNO0nGulaQcIDcDt723cp8RdK5FI4CxJMaPCPgiDN76R4DLt6vrtiMSigFc5WOiu6Q1uONGw+Tzf0z5pXl0acMEuHOK/F2Plv+28wDgCs=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2ViNaT2AMI6hFGIkTTTcMTjxBNAqtjDc2BS0Kpjd1USjXLUmDKitF3EzQtLb4rPV/kuhFJ9edUY0Pe3mzjJLV2P95aVSI83J+JX2LmtFwU+8kSezdZnH1ZTIMHk2IpgBiVH4Q0IRZBKLYOK3ugBpnfivYvjZnP50KGQKLmWnwVybkXVHFSKd5DO0Og5JKcBpYloQoMi+392LeiyV6myjlBSTY7DJAJdX5XqQ20WYAEoZY4JLn9F9fHoVNDBi5Ia76OTDyjXunQFDgig9KW4tDKYn+l4tgTDOTa8ie3fojf/eCDcFPvRNTgXSH0XV3RM4+Xgvfj12l/kqpRRVorMxfQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/WebContent/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/return";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


