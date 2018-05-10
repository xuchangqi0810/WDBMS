<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>课程列表页面_老原教育</title>
<meta name="keywords" content="老原教育">
<meta name="description" content="老原教育">
<meta name="author" content="www.cnblos.com/weilengdeyu">
<link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/bs/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/front/bs/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/front/bs/js/holder.min.js"></script>
    <link href="${pageContext.request.contextPath}/background/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .zfb{
            border:3px solid #F9640A;
            width:124px;
            cursor:pointer;
            padding:5px;
            float: left;
            margin-left: 20px;
        }
       /* .layui-timeline li div div{
            float:left;
        }*/
       .layui-timeline li div{
            height:40px;
            line-height: 40px;
            margin-top:-10px;
        }
        .layui-timeline li{
            border-top:1px solid white;
        }


        .layui-timeline li div:hover
        {

         /*  background: #FEF3F3;*/
            background: #F3FEE8;
            cursor: pointer;

        }
    </style>
<!--共有样式-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/js/jquery-migrate-1.2.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/front/js/qlclass.pl.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".layui-timeline li div").mouseover(function () {
                    $(this).find("p").css("display","block");
            }).mouseout(function () {
                $(this).find("p").css("display","none");
            });

        })
    </script>
<body>
<!--web-top start-->

<!--web-top end-->
<div class="clear"></div>
<!--web logo and search start-->

<jsp:include page="top.jsp"></jsp:include>
<!--web logo and search end-->
<!--web main body start-->
<div class="w-all w-minw bg-c-fcfcfc ovhidden">

    <!--web main body start--> 
    
    <!--web main bogy top start-->
    <div class="w-main m-auto ovhidden">
        <div class="w-main m-auto bg-c-ffffff ovhidden"> 
            <!--left img start-->
            <div class="w-450 hg-338 fl"> <img src="${pageContext.request.contextPath}/front/images/details-01.png" width="450" height="338" alt=""/> </div>
            <!--left img end--> 
            <!--right info start-->
            <div class="w-680 hg-338 m-l-40 ovhidden ps-r fl">
                <h3 class="w-all fs-24 ftc-000000 m-t-5 m-b-10 line-h36 fl">${detailsVideo.cname}</h3>
                <!--info right start-->
                <div class="w-all fl">
                    <ul class="con_rig_class">
                        <li class="w-all fs-14 ftc-000000 line-h40 m-b-10 fl">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<span class="fs-24 ftc-e9511b">¥${detailsVideo.price}</span></li>
                        <div class="claer"></div>
                    </ul>
                </div>
                <!--info right end-->
                <div class="standard ps-a pa-b-22">
                    <a class="dsblock w-140 hg-46 text-c line-h46 bg-c-e9511b ftc-ffffff fs-18 bd-rd-6 m-r-28 fl"id="mybtnBuy" onclick="showPayLayer(${detailsVideo.price},'${detailsVideo.cname}',${detailsVideo.id});">立即购买</a>
              <%--      <a class="dsblock w-170 hg-42 text-c line-h42 ftc-e9511b fs-18 bd-rd-6 bd-2s-e9511b m-r-28 fl" href="javascript:;" onclick="">加入购物车</a>
                    <a class="dsblock w-140 hg-46 text-c line-h46 bg-c-6595e4 ftc-ffffff fs-18 bd-rd-6 m-r-28 fl" href="javascript:;" onclick="">免费试听</a>--%>
                </div>
            </div>
            <!--right info end--> 
        </div>
        <!--web main bogy top end--> 
        <!--分割线-->
        <div class="w-amin hg-30 ovhidden"></div>
        <!--分割线-->
        <div class="w-main ovhidden">
            <ul class="w-1140 p-l-30 p-r-30 p-t-13 p-b-13 ovhidden bg-c-ffffff ql_classtab m-b-2">
                <li class="fl"> <a href="javascript:;" class="w-110 fs-16 ftc-000000 line-h30 hg-30 text-c ft-w-b m-r-20 tabcur">课程总览</a> </li>
                <span class="fl m-r-20 fs-18 line-h30 ftc-bbbbbb">|</span>
                <li class="fl" name="ql_plistcon"> <a href="#ql_plistcon" class="w-110 fs-16 ftc-000000 line-h30 hg-30 text-c ft-w-b m-r-20 fl">课程评论</a></li>
            </ul>
            <!--课程总览 start-->
            <div class="w-1140 p-l-30 p-r-30 bg-c-ffffff p-b-30 ovhidden">
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">课程介绍</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">
                    ${detailsVideo.courseintroduction}
                </div>
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">教学目标</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">${detailsVideo.courseTarget}<br/>
                    <br/>
                </div>
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">适合人群</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">
                    ${detailsVideo.compatiblepeople}
                     </div>
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">课程目录</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>视频目录</legend>
                    </fieldset>
                    <ul class="layui-timeline">
                        <c:forEach items="${detailsVideo.videoList}" var="item">
                            <li class="layui-timeline-item">
                                <i class="layui-icon layui-timeline-axis"></i>
                                <div class="layui-timeline-content layui-text">
                                    <div class="layui-timeline-title">${item.t_vname}
                                        <p style="background: #02B980;float:right;margin-right:20px;border-radius: 15px;display: none;width:100px;text-align: center" >开始学习</p>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
            <!--课程总览 end--> 
            <!--分割线-->
            <div class="w-amin hg-30 ovhidden"></div>
            <!--分割线-->
            <div class="w-main m-auto" id="ql_plistcon">
                <div class="w-1140 p-l-30 p-r-30 bg-c-ffffff ovhidden">
                    <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">课程评论</h3>
                    <ul class="w-all ql_plist ovhidden fl">
                        <li class="w-all fl bd-bs-f8f8f8 p-b-13 m-b-25"> <a href="#" class="dsblock w-72 hg-72 m-r-30 fl"><img src="${pageContext.request.contextPath}/front/pics/xue.jpg" class="bd-rd-36" width="72" height="72" alt="" /></a>
                            <div class="w-1028 ql_pltxt fl">
                                <h4 class="w-all fs-16 line-22 m-b-8 ftc-4c4c4c fl">小飞飞<i class="dsblock w-18 hg-22 ql_zan fr"></i></h4>
                                <span class="dsblock w-all fs-14 line-h24 ftc-9a9a9a fl">2017-08-10     15:38</span>
                                <p class="w-all fs-14 line-h22 hg-44 ovhidden ps-r fl">针对初一年级学生，根据英语课程，同步并强化提升重要知识点和常见典型题目，做到及时复习，有效的夯实基础。youwin独特方法，帮学员扫清学习障碍。1.帮助学生构建属于自己的个性化学习方案 2.课前精细备课，制定完整教学计划 3.我们承诺当堂课满分过关，做到及时复习，有效的夯实基础。youwin独特方法针对初一年级学生，根据英语课程，同步并强化提升重要知识点和常见典型题目，做到及时复习，有效的夯实基础。youwin独特方法，帮学员扫清学习障碍。1.帮助学生构建属于自己的个性化学习方案 2.课前精细备课，制定完整教学计划 3.我们承诺当堂课满分过关，做到及时复习，有效的夯实基础。youwin独特方法 <a href="javascript:;" class="fs-14 ftc-ff0000 p-l-10 p-r-10 bg-c-ffffff ps-a pa-b-0 pa-r-0 pl_btn_down dsblock">【展开全文】</a> <a href="javascript:;" class="ps-a fs-14 ftc-ff0000 p-l-10 p-r-10 bg-c-ffffff pa-b-0 pa-r-0 pl_btn_up dsbnone">【收缩全文】</a> </p>
                            </div>
                        </li>
                        <div class="clear"></div>
                    </ul>
                    <script type="text/javascript" src="${pageContext.request.contextPath}/front/js/qlclass.pl.js"></script>
                    <div class="w-all hg-30 fl"></div>

                    <div class="w-all hg-30 fl"></div>
                </div>
            </div>
        </div>
        <div class="w-all hg-60 fl"></div>
        <!--web main body end--> 
    </div>
</div>

<!--web footer start-->
<jsp:include page="footer.jsp"></jsp:include>

<!--web footer copyright end--> 
<!--web footer end-->
<script type="text/javascript" src="${pageContext.request.contextPath}/background/layui/layui.all.js"></script>
<script type="text/javascript">

    function showPayLayer(price,name,id){
        alert(price)
        var ordernumber=112231;
        //示范一个公告层
            layer.open({
            type: 1
            ,title: '温馨提示' //标题栏
            ,closeBtn: 2
            ,area: '500px;'
            ,shade: 0.6
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,btn: ['确认']
            ,btnAlign: 'c'
            ,moveType: 1 //拖拽模式，0或者1
            ,content: '<div style="padding: 50px; line-height: 22px; background-color: #FFFFFF;' +
                ' color: black; font-weight: 300;">课程价格：<span style="color:red"> ¥'+price+'</span><hr/>请选择支付方式<br/><br/><div style="border:3px solid #F9640A;width:130px;cursor:pointer;padding:5px;"><img src="${pageContext.request.contextPath}/front/images/alipay.png"></div></div>'
                ,success: function(layero){
                    //添加
                    $.ajax({
                        url:"${pageContext.request.contextPath}/addOrder",
                        method:"POST",
                        data:{"id":id,"price":price,"ordernumber":ordernumber},
                        success:function () {
                            var btn = layero.find('.layui-layer-btn');
                            btn.find('.layui-layer-btn0').attr({
                                href:'${pageContext.request.contextPath}/WebContent/alipay.trade.page.pay.jsp?WIDout_trade_no='+ordernumber+'&WIDtotal_amount='+price+'&WIDsubject='+name+"&WIDbody="+id,
                                target: '_blank'
                            });
                        }
                    });
                }
            });
    }
</script>
</body>
</html>