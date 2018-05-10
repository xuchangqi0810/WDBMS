<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>微冷的雨训练营</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/background/layui/css/layui.css">
<!--样式-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/bs/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/front/bs/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/front/bs/js/holder.min.js"></script>
<!--首页banner样式-->
<script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery-1.11.3.min.js"></script>
<body>
<div class="clear"></div>

<!--web logo and search start-->
<jsp:include page="top.jsp"></jsp:include>
<!--web logo and search end-->
<!--网站导航 start-->
<div class="w-all w-minw hg-60 bg-c-ffffff ql_webnav">
    <div class="w-main m-auto ps-r hg-60">
        <!--全部商品分类-->
        <div class="hc_lnav jslist">
            <div class="allbtn">
                <h2><a href="#">全部课程分类</a></h2>
                <ul style="width:250px" class="jspop box">
                    <!--导航-->
                  <c:forEach items="${courses}" var="item">
                      <li class="a1" style="font-size: 15px;">
                          <div class="text-center">
                              <a href="#" class="ftc-ffffff">
                                  <h1 style="font-family: Algerian">${item.cname}</h1>
                              </a>
                          </div>

                          <div class="pop">
                              <c:forEach items="${item.children}" var="crc">
                                  <dl>
                                      <dt><a href="#">${crc.cname} ></a></dt>
                                      <dd>
                                          <c:forEach var="ccrc" items="${crc.children}">
                                              <a class="ui-link" href="${pageContext.request.contextPath}/QueryVideo?cid=${ccrc.id}">${ccrc.cname}</a>
                                              <span>|</span>
                                          </c:forEach>
                                      </dd>
                                  </dl>

                                  <div class="clr"></div>
                              </c:forEach>
                          </div>
                      </li>
                  </c:forEach>

                </ul>
            </div>
        </div>
        <!--导航栏-->
        <ul class="w-950 hg-60 ql_nav">
            <li><a href="index.html" class="cur">精品视频</a></li>
            <li><a href="connect.html">笔记分享</a></li>
            <li><a href="connect.html">好书推介</a></li>
            <li><a href="connect.html">开智文章</a></li>
            <li><a href="connect.html">关于我们</a></li>
        </ul>
    </div>
</div>
<!--网站导航 end-->
<!--web banner start-->
<div class="w-all w-minw banner ps-r">
    <div id="full-screen-slider">
        <ul id="slides">
            <li style="background:url('${pageContext.request.contextPath}front/images/banner1.jpg') 65% top no-repeat;"><a href="javascript:void(0)"></a></li>
            <li style="background:url('${pageContext.request.contextPath}/front/images/banner.jpg') 65% top no-repeat;"><a href="javascript:void(0)"></a></li>
            <li style="background:url('${pageContext.request.contextPath}/front/images/banner3.jpg') 65% top no-repeat;"><a href="javascript:void(0)"></a></li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/front/js/banner.index.js"></script>
<!--web banner end-->
<!--web home main-body start-->
<div class="w-all w-minw bg-c-fcfcfc ovhidden">

    <div class="w-main m-auto">
        <div class="w-main fl hg-40"></div>
        <div class="w-main fl hg-1 bg-c-e5e5e5"></div>
        <div class="w-main fl hg-8"></div>
    </div>
    <!--分割线 start-->
    <!--精选课程 start-->
    <div class="w-main m-auto">
        <!--title start-->
        <div class="w-main m-t-15 ovhidden fl">
            <h3 class="fl fs-20 ft-w-b line-h50"><span class="dsblock ql_icon ql_h_class tx-ind m-r-15 fl">精选视频</span>精选视频</h3>
            <a href="课程列表页面.html" class="fr fs-14 ftc-000000 line-h50">查看更多></a> </div>
        <!--title end-->
    </div>
    <div class="w-main m-auto">
        <ul class="home_calss w-1224 ovhidden">
            <c:forEach items="${excellentVideo}" var="item">
                <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"> <a href="${pageContext.request.contextPath}/getDetailsVideo/${item.id}" class="dsblock w-280 hg-200 ovhidden ps-r"> <img src="${pageContext.request.contextPath}/front/pics/12.jpg" alt=""/> </a>
                    <div class="w-255 p-l-10 p-r-15 fl">
                        <div class="home_calsstxt w-155 fl">
                            <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">${item.cname}</h3>
                            <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span> </div>
                        <a href="${pageContext.request.contextPath}/getDetailsVideo/${item.id}" class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a> </div>
                </li>
            </c:forEach>

            <div class="clear"></div>
        </ul>
    </div>
    <%--笔记分享--%>

    <div class="w-main m-auto">
        <!--title start-->
        <div class="w-main m-t-15 ovhidden fl">
            <h3 class="fl fs-20 ft-w-b line-h50"><span class="dsblock ql_icon login_icon tx-ind m-r-15 fl">笔记分享</span>笔记分享</h3>
        </div>
    </div>

    <div class="w-main m-auto">
        <ul class="home_calss w-1224 ovhidden">
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/my.png" alt="C#本质论"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">C#本质论</span> </div>
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>

    <%--好书推介--%>

    <div class="w-main m-auto">
        <!--title start-->
        <div class="w-main m-t-15 ovhidden fl">
            <h3 class="fl fs-20 ft-w-b line-h50"><span class="dsblock ql_icon ql_like tx-ind m-r-15 fl">好书推介</span>好书推介</h3>
        </div>
    </div>
    <div class="w-main m-auto">
        <ul class="home_calss w-1224 ovhidden">
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/c.jpg" alt="C#本质论"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">C#本质论</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/via.jpg" alt="via"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">via</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/my.png" alt="my"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">未来已来</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/javaweb.png" alt="javaWeb"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">javaWeb</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/jvm.png" alt="jvm"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">jvm</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/http.png" alt="http"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">HTTP</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/springboot.png" alt="springboot"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">springboot</span> </div>
                </div>
            </li>
            <li class="w-280  m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a class="dsblock w-280 hg-200 ovhidden ps-r"><img src="${pageContext.request.contextPath}/front/images/Oracle.png" alt="Oracle"/></a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <%-- <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">C#本质论</h3>--%>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">Oracle工作笔记</span> </div>
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
</div>
<!--web home main-body end-->


<!--web footer copyright start-->

<jsp:include page="footer.jsp"></jsp:include>
<!--web footer copyright end-->

<!--web footer end-->
<script>
    $(document).ready(function(){
        var w = parseInt(($(window).width()-1200)/2);
        $(".qlban_ad").css("right",w)
    });

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/background/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.min.js"></script>
<script>

    //登录
    function islogin() {
        //获取输入的值
        var username=$("[name=username]").val();
        var userpwd=$("[name=userpwd]").val();
        if(username==""||username==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入用户名哦，亲', {
                time: 2000, //20s后自动关闭
            });
            return;
        }else if(userpwd==""||userpwd==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入密码哦，亲', {
                time: 2000, //20s后自动关闭
            });
            return;
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/islogin",
            method:"POST",
            data:{"username":username,"userpwd":userpwd},
            success:function (data) {
                if(data=="1"){
                    //配置一个透明的询问框
                    layer.msg('登录成功', {
                        time: 2000, //2s后自动关闭
                        end:function () {
                            location.reload();
                        }
                    });

                }else{
                    //配置一个透明的询问框
                    layer.msg('用户名或密码错误', {
                        time: 2000, //2s后自动关闭
                    });
                }
            }
        });

    }


    function sendSms(val) {
        //发送验证码
        var phone=$("#phone").val();
        var param = {
            mobile: phone
        }
        settime(val);
        $.post('${pageContext.request.contextPath}/sendSms', param, function(data) {
            //配置一个透明的询问框
            layer.msg(data.msg, {
                time: 2000, //2s后自动关闭
            });
        });
    }


    function send(val) {
        var phone=$("#phone").val();
        if(!(/^1([34578][0-9]|5[189]|8[6789])[0-9]{8}$/).test(phone)){
            $("#phone").val("请输入正确的手机号")
            $("#phone").css("color","red");
            $("#phone").click(function () {
                phone=$(this).val();
                if(phone=="请输入正确的手机号") {
                    $(this).val("");
                    $(this).css("color", "");
                }
            })
        }else{
            sendSms(val);
        }

    }

    //定时器
    var countdown=60;
    function settime(val) {
        if (countdown == 0) {
            val.removeAttribute("disabled");
            val.innerHTML = "获取验证码";
            countdown = 60;
            return;
        } else {
            val.setAttribute("disabled", true);
            val.innerHTML = "重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function () {
            settime(val)
        }, 1000)
    };

    function showLogin() {
        layer.open({
            type: 1
            ,title: false //不显示标题栏
            ,closeBtn: 2
            ,area: ['410px','270px']
            ,shade: [0.8, '#ADADAD']
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,btnAlign: 'c'
            ,moveType: 1 //拖拽模式，0或者1
            ,content:
            '<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">'+
            '<ul class="layui-tab-title">'+
            '<li class="layui-this">登录</li>'+
            '<li>注册</li>'+
            '</ul>'+
            '<div class="layui-tab-content" style="height: 100px;">'+
            '<div class="layui-tab-item layui-show">' +
            '<form class="layui-form" action="${pageContext.request.contextPath}/islogin">'+
            '<div class="layui-form-item">'+
            '<label class="layui-form-label">用户名</label>'+
            '<div class="layui-input-block" style="width: 220px">'+
            '<input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">'+
            '</div><br>'+
            '<div class="layui-form-item">'+
            '<label class="layui-form-label">密码</label>'+
            '<div class="layui-input-block" style="width: 220px">'+
            '<input type="password" name="userpwd" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">'+
            '</div><br><br>'+
            '<input type="button" onclick="islogin()" id="login" class="layui-btn layui-btn-normal" value="登录" style="width: 390px"/>'+
            '</div>' +
            '</from>'+
            '</div>'+
            '</div>'+
        '<div class="layui-tab-item" id="register">' +
            '<form class="layui-form" action="">'+
            '<div class="layui-form-item">'+
                '<label class="layui-form-label">手机号</label>'+
            '<div class="layui-input-block" style="width: 220px">'+
            '<input id="phone" id="mobile" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入手机号" class="layui-input">'+
            '</div><br>'+
            '<div class="layui-form-item">'+
            '<label class="layui-form-label">验证码</label>'+
            '<div class="layui-input-block" style="width: 240px;">'+
            '<input type="text" id="vCode" name="yanzheng" lay-verify="title" autocomplete="off" placeholder="请输入验证码" class="layui-input" style="width: 100px"><button class="layui-btn layui-btn-normal" onclick="send(this)"  style="width: 110px;position: absolute;right: 20px;bottom: 0px;">获取验证码</button>'+
            '</div><br><br>'+
            '<button onclick="register()" class="layui-btn layui-btn-normal"  style="width: 390px">确认</button>'+
            '</div>' +
            '</form>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'
            ,success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').attr({
                    href: 'http://www.layui.com/'
                    ,target: '_blank'
                });
            }
        });
    }


    //注册
    function inserUser() {
        //获取用户输入的值
        var username=$("#username").val();
        var userpwd=$("#userpwd").val();
        var phone=$("[name=phone]").val();
        alert(userpwd)
        if(username==""||username==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入用户名哦，亲', {
                time: 2000, //2s后自动关闭
            });
            return;
        }else if(userpwd==""||userpwd==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入密码哦，亲', {
                time: 2000, //2s后自动关闭
            });
            return;
        }else{
            $.ajax({
                url:"${pageContext.request.contextPath}/insertUser",
                method:"POST",
                data:{"username":username,"userpwd":userpwd,"userphone":phone},
                success:function (data) {
                    if(data=="1"){
                        //配置一个透明的询问框
                        layer.msg('注册成功', {
                            time: 3000, //3s后自动关闭
                            end:function () {
                                location.href="${pageContext.request.contextPath}/getAllCourse";
                            }
                        });
                    }else if(data=="0"){
                        //配置一个透明的询问框
                        layer.msg('注册失败', {
                            time: 3000, //2s后自动关闭
                        });
                    }
                }
            });
        }


    }

    function register() {
        var phone=$("#phone").val();
        var yanz=$("[name=yanzheng]").val();
        if(yanz==""||yanz==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入验证码哦。', {
                time: 20000, //20s后自动关闭
                btn: ['明白了', '哦']
            });
            return;
        }else{
            $.post('${pageContext.request.contextPath}/checkSms', {"mobile":phone, "vCode":yanz},function (data) {
                alert(data.msg)
                if(data.success){
                    $("#register").empty();
                    $("#register").html('' +
                        '<form class="layui-form" action="">'+
                        '<div class="layui-form-item">'+
                        '<label class="layui-form-label">用户名</label>'+
                        '<div class="layui-input-block">'+
                        '<input type="hidden" name="phone" value='+phone+' /><input type="text" id="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input" style="width: 220px">'+
                        '</div>'+
                        '</div>'+
                        '<div class="layui-form-item">'+
                        '<label class="layui-form-label">密码</label>'+
                        '<div class="layui-input-block">'+
                        '<input type="password" id="userpwd" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input" style="width: 220px">'+
                        '</div>'+
                        '</div>'+
                        '<button onclick="inserUser()" class="layui-btn layui-btn-normal" style="width: 390px">注册</button>'+
                        '</form>'
                    );
                }
            });


        }
    }


</script>


</body>
</html>