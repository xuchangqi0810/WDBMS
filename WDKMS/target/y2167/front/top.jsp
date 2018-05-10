<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>微冷的雨训练营</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/base.css">
    <!--样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/bs/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/background/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/background/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/front/bs/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/front/bs/js/holder.min.js"></script>
    <style type="text/css">
    </style>
    <!--首页banner样式-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".exit").click(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/logoutFront",
                    type:"post",
                    success:function () {
                        location.href="${pageContext.request.contextPath}/getCourseData";
                    }
                });
            });
        });
    </script>

<body>
<div class="clear"></div>
<!--web logo and search start-->
<div class="w-main m-auto m-t-20 m-b-25 ovhidden">
    <!--web logo start-->
    <a href="${pageContext.request.contextPath}/getAllCourse"class="logo fl" >
        <img src="${pageContext.request.contextPath}/front/images/logo1 (1).png"/>
        <%-- <img class="img-circle" data-src="holder.js/243x76?text=微冷的雨logo" title="微冷的雨logo">--%>
    </a>
    <!--web logo end-->
    <!--web search start-->
    <div class="search w-540 m-l-115 m-t-15 fl">
        <form action="#" method="get" id="searchform" name="searchform" onSubmit="return checkSearchForm()" class="w-540 search-form">
            <input class="p-l-15 bd-bs-d8d8d8 w-435 line-h35 hg-35 fs-12 ftc-a9a9a9 fl" type="text" name="keywords" id="keyword" value="搜索：java入门" onfocus="if(this.value == '搜索：java入门')this.value = ''" onblur="if(this.value == '')this.value='搜索：java入门'" autocomplete="off">
            <button type="submit" class="btn btn-default">搜索</button>
        </form>

    </div>
    <!--web search end-->
    <div style="width: 222px;height: 10px;"></div>
    <%--    <div style="width: 222px;height: 40px;" class="pull-right text-center"><a  class="btn btn-link" href="#">登陆</a>/
            <a class="btn btn-link" href="#">注册</a>
        </div>--%>

    <c:if test="${muser==null}">
        <div  style="width: 222px;height: 40px;" class="pull-right text-center"><a  class="btn btn-link" href="#" onclick="showLogin()" style="text-decoration: none;}">登陆&nbsp;&nbsp;/&nbsp;&nbsp;注册</a>
        </div>
    </c:if>


    <c:if test="${muser!=null}">
        <div  style="width:262px;height: 40px;margin-top: -5px;" class="pull-right text-center">
            <dl style="cursor:pointer;float: left;margin-right: 22px;margin-top: -10px;">
                <dd><i class="layui-icon " style="font-size: 30px; color: #1E9FFF;">&#xe705;</i></dd>
                <dd>课程</dd>
            </dl>
            <dl style="cursor:pointer;float: left;margin-right: 22px;margin-top: -10px;">
                <dd><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe61d;</i></dd>
                <dd>私信</dd>
            </dl>
            <dl style="cursor:pointer;float: left;margin-right: -20px;margin-top: -10px;">
                <dd><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe645;</i></dd>
                <dd>通知</dd>
            </dl>
            <dl style="cursor:pointer;margin-top: -10px;" class="exit">
                <dd><i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe609;退出</i></dd>
                <dd>${muser.username}</dd>
            </dl>
        </div>
    </c:if>

</div>
</body>
<script>
    $(function () {
        //alert(1);
        /* $("[name=userpwd]")[0].onkeydown=function (event) {
         alert(1);
         };*/
    });
    //1.登录操作
    function islogin() {
        //获取输入的值
        var username=$("[name=username]").val();
        var userpwd=$("[name=userpwd]").val();
        if(username==""||username==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入用户名哦，~~~', {
                time: 2000, //2s后自动关闭
            });
            return;
        }else if(userpwd==""||userpwd==null){
            //配置一个透明的询问框
            layer.msg('您还没有输入密码哦，~~~', {
                time: 2000, //2s后自动关闭
            });
            return;
        }
        //uname和upwd均 认证通过，向后台发送ajax
        $.ajax({
            url:"${pageContext.request.contextPath}/islogin", //?returnurl="+window.location.href
            method:"POST",
            data:{"username":username,"userpwd":userpwd},
            success:function (data) { //data就是从哪个页面过来的
                if(data!="0"){
                    //配置一个透明的询问框
                    layer.msg('登录成功', {
                        time: 1000, //2s后自动关闭
                        end:function () {
                            //关闭窗体
                            layer.close(index);
                            location.reload();
                            //跳转
                            //location.href=data;
                            /* var index = parent.layer.getFrameIndex(window.name);
                             parent.layer.close(index);*/
                            //更改登录文本
                            //$("#box").html($("#box2").html());
                            /* $("#box").hide();
                             $("#box2").show();*/
                        }
                    });
                }else{
                    $("#login").val('登录');
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
    var index;
    //显示登录和注册的弹层
    function showLogin() {
        index=layer.open({
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
            '<li class="layui-this" id="mylogin">登录</li>'+
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
                /* var btn = layero.find('.layui-layer-btn');
                 btn.find('.layui-layer-btn0').attr({
                 href: 'http://www.layui.com/'
                 ,target: '_blank'
                 });*/
                $("[name=userpwd]")[0].onkeydown=function (event) {
                    if(event.keyCode==13){
                        $("#login").val('正在登录.............');
                        islogin();
                    }
                };
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
    //真正的注册操作
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
</html>