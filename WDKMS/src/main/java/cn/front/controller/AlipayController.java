package cn.front.controller;

import cn.front.entity.MobileUser;
import cn.front.entity.Order;
import cn.front.service.IOrderService;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by Administrator on 2018/5/8.
 */
@Controller
public class AlipayController {

    @Resource(name = "orderService")
    private IOrderService iOrderService;


    //点击确认生成订单
    @RequestMapping("/addOrder")
    @ResponseBody
    public Object addOrder(Integer id,Double price,Integer ordernumber,HttpServletRequest request){
        //获取当前登录用户id
        MobileUser user=(MobileUser) request.getSession().getAttribute("muser");

        //创建Order对象
        Order order=new Order();
        order.setUid(user.getId());
        order.setOrdernumber(ordernumber);
        order.setT_vid(id);
        order.setPrice(price);

        iOrderService.addOrder(order);

        return 1;
    }

    //支付完成后
    @RequestMapping("/return")
    public String returnTest(HttpServletRequest request) throws Exception {
        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            iOrderService.updateOrder(Integer.parseInt(out_trade_no));
        }
        return "forward:getVideo/";
    }




    public IOrderService getiOrderService() {
        return iOrderService;
    }

    public void setiOrderService(IOrderService iOrderService) {
        this.iOrderService = iOrderService;
    }
}
