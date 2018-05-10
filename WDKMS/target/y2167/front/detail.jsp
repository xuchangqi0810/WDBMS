<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>微冷的雨训练营</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/bs/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/font/bs/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/qlclass.pl.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/font/bs/js/holder.min.js"></script>
<body>

<div class="clear"></div>

<!--web logo and search start-->
<div class="w-main m-auto m-t-37 m-b-25 ovhidden">
    <!--web logo start-->
    <a href="index.html" class="logo fl"><!--<img src="pics/logo.png" width="243px" height="76px" alt="微冷的雨logo(图)"/>-->
        <img class="${pageContext.request.contextPath}/front/img-circle" data-src="holder.js/243x76?text=微冷的雨logo" title="微冷的雨logo">

    </a>
    <!--web logo end-->
    <!--web search start-->
    <div class="search w-540 m-l-115 m-t-15 fl">
        <form action="#" method="get" id="searchform" name="searchform" onSubmit="return checkSearchForm()"
              class="w-540 search-form">
            <input class="p-l-15 bd-bs-d8d8d8 w-435 line-h35 hg-35 fs-12 ftc-a9a9a9 fl" type="text" name="keywords"
                   id="keyword" value="搜索：java入门" onfocus="if(this.value == '搜索：java入门')this.value = ''"
                   onblur="if(this.value == '')this.value='搜索：java入门'" autocomplete="off">
            <button type="submit" class="btn btn-default">搜索</button>

        </form>

    </div>
    <!--web search end-->
    <div style="width: 222px;height: 10px;"></div>
    <div style="width: 222px;height: 40px;" class="pull-right text-center"><a class="btn btn-link" href="#">登陆</a>/
        <a class="btn btn-link" href="#">注册</a></div>

</div>
<!--web logo and search end-->
<!--网站导航 start-->
<%--<div class="w-all w-minw hg-60 bd-bs-e9511b bg-c-ffffff ql_webnav">
    <!--网站导航 start-->
    <div class="w-main m-auto ps-r hg-60">
        <!--全部商品分类-->
        <div class="hc_lnav jslist">
            <div class="allbtn">
                <h2><a href="#">全部商品分类</a></h2>
                <ul style="width:250px" class="jspop box">
                    <!--导航-->
                    <li class="a1">
                        <div class="tx"><a href="#">小学</a> </div>
                        <dl>
                            <dd> <a href="#">一年级</a><span>/</span> <a href="#">二年级</a><span>/</span> <a href="#">三年级</a> <a href="#">四年级</a><span>/</span> <a href="#">五年级</a><span>/</span> <a href="#">六年级</a> <a href="#">特色课程</a> </dd>
                        </dl>
                        <div class="pop">
                            <dl>
                                <dt><a href="#">一年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">二年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">三年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a><span>|</span> <a class="ui-link" href="#">化学</a><span>|</span> <a class="ui-link" href="#">全日制托管</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">特色课程 ></a></dt>
                                <dd> <a class="ui-link" href="#">双师课堂</a><span>|</span> <a class="ui-link" href="#">名师精讲班</a><span>|</span> <a class="ui-link" href="#">学霸进阶精英班</a> </dd>
                            </dl>
                            <div class="clr"></div>
                        </div>
                    </li>
                    <!--导航-->
                    <!--导航-->
                    <li class="a1">
                        <div class="tx"><a href="#">小学</a> </div>
                        <dl>
                            <dd> <a href="#">一年级</a><span>/</span> <a href="#">二年级</a><span>/</span> <a href="#">三年级</a> <a href="#">四年级</a><span>/</span> <a href="#">五年级</a><span>/</span> <a href="#">六年级</a> <a href="#">特色课程</a> </dd>
                        </dl>
                        <div class="pop">
                            <dl>
                                <dt><a href="#">一年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">二年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">三年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a><span>|</span> <a class="ui-link" href="#">化学</a><span>|</span> <a class="ui-link" href="#">全日制托管</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">特色课程 ></a></dt>
                                <dd> <a class="ui-link" href="#">双师课堂</a><span>|</span> <a class="ui-link" href="#">名师精讲班</a><span>|</span> <a class="ui-link" href="#">学霸进阶精英班</a> </dd>
                            </dl>
                            <div class="clr"></div>
                        </div>
                    </li>
                    <!--导航-->
                    <!--导航-->
                    <li class="a1">
                        <div class="tx"><a href="#">小学</a> </div>
                        <dl>
                            <dd> <a href="#">一年级</a><span>/</span> <a href="#">二年级</a><span>/</span> <a href="#">三年级</a> <a href="#">四年级</a><span>/</span> <a href="#">五年级</a><span>/</span> <a href="#">六年级</a> <a href="#">特色课程</a> </dd>
                        </dl>
                        <div class="pop">
                            <dl>
                                <dt><a href="#">一年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">二年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">三年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a><span>|</span> <a class="ui-link" href="#">化学</a><span>|</span> <a class="ui-link" href="#">全日制托管</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">特色课程 ></a></dt>
                                <dd> <a class="ui-link" href="#">双师课堂</a><span>|</span> <a class="ui-link" href="#">名师精讲班</a><span>|</span> <a class="ui-link" href="#">学霸进阶精英班</a> </dd>
                            </dl>
                            <div class="clr"></div>
                        </div>
                    </li>
                    <!--导航-->
                    <!--导航-->
                    <li class="a1">
                        <div class="tx"><a href="#">小学</a> </div>
                        <dl>
                            <dd> <a href="#">一年级</a><span>/</span> <a href="#">二年级</a><span>/</span> <a href="#">三年级</a> <a href="#">四年级</a><span>/</span> <a href="#">五年级</a><span>/</span> <a href="#">六年级</a> <a href="#">特色课程</a> </dd>
                        </dl>
                        <div class="pop">
                            <dl>
                                <dt><a href="#">一年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">二年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">三年级 ></a></dt>
                                <dd> <a class="ui-link" href="#">数学</a><span>|</span> <a class="ui-link" href="#">语文</a><span>|</span> <a class="ui-link" href="#">英语</a><span>|</span> <a class="ui-link" href="#">地理</a><span>|</span> <a class="ui-link" href="#">政治</a> <a class="ui-link" href="#">生物</a><span>|</span> <a class="ui-link" href="#">历史</a><span>|</span> <a class="ui-link" href="#">物理</a><span>|</span> <a class="ui-link" href="#">化学</a><span>|</span> <a class="ui-link" href="#">全日制托管</a> </dd>
                            </dl>
                            <dl>
                                <dt><a href="#">特色课程 ></a></dt>
                                <dd> <a class="ui-link" href="#">双师课堂</a><span>|</span> <a class="ui-link" href="#">名师精讲班</a><span>|</span> <a class="ui-link" href="#">学霸进阶精英班</a> </dd>
                            </dl>
                            <div class="clr"></div>
                        </div>
                    </li>
                    <!--导航-->
                </ul>
            </div>
        </div>
        <!--全部商品分类-->
        <ul class="w-950 hg-60 ql_nav">
            <li><a href="index.html" class="cur">首页</a></li>
            <li><a href="课程列表页面.html">小学</a></li>
            <li><a href="双师单页.html">双师课堂</a></li>
            <li><a href="考试日历.html">考试日历</a></li>
            <li><a href="讲师.html">名师</a></li>
            <li><a href="招商单页.html" class="ql_navhot">招商加盟</a></li>
            <li><a href="分校列表.html">分校</a></li>
            <li><a href="资讯列表.html">资讯</a></li>
            <li><a href="联系我们.html">联系我们</a></li>
        </ul>
    </div>
</div>--%>
<!--网站导航 end-->
<!--web banner start-->
<div class="w-all w-minw banner ps-r">
    <div id="full-screen-slider">
        <ul id="slides">
            <li style="background:url('/jsp/font/pics/ban1.jpg') center top no-repeat;"><a
                    href="javascript:void(0)"></a></li>
            <li style="background:url('/jsp/font/pics/ban2.jpg') center top no-repeat;"><a
                    href="javascript:void(0)"></a></li>
            <li style="background:url('/jsp/font/pics/ban3.jpg') center top no-repeat;"><a
                    href="javascript:void(0)"></a></li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/banner.index.js"></script>


<!--web footer start-->
<div class="w-all w-minw bg-c-e3e3e3 p-t-15 ovhidden">
    <!--link start-->
    <div class="w-main m-auto">
        <div class="fl w-65 fs-12 ftc-414141 line-h30 ft-w-b">友情链接：</div>
        <div class="fr">
            <ul class="ql_link">
                <li><a href="#">决胜教育网</a></li>
                <li><a href="#">优米网</a></li>
                <li><a href="#">八维教育</a></li>
                <li><a href="#">雅思培训</a></li>
                <li><a href="#">中国夏令营</a></li>
                <li><a href="#">英语口语培训</a></li>
                <li><a href="#">英语培训</a></li>
                <li><a href="#">高考试题库</a></li>
                <li><a href="#">留学监理网</a></li>
                <li><a href="#">上海雅思培训</a></li>
                <li><a href="#">幼儿英语培训</a></li>
                <li><a href="#">广州机构总汇</a></li>
                <li><a href="#">吉林教育信息网</a></li>
                <li><a href="#">少儿英语外教</a></li>
                <li><a href="#">在职研究生</a></li>
                <li><a href="#">一级建造师</a></li>
                <li><a href="#">创客教育</a></li>
                <li><a href="#">百科知识</a></li>
                <li><a href="#">新航道</a></li>
                <li><a href="#">顺顺留学</a></li>
                <li><a href="#">国际学校</a></li>
                <li><a href="#">成人高考</a></li>
                <div class="clear"></div>
            </ul>
        </div>
    </div>
    <!--link end-->
    <!--分割线 start-->
    <div class="w-main m-auto">
        <div class="w-main fl hg-12"></div>
        <div class="w-main fl hg-1 bg-c-d2d2d2"></div>
        <div class="w-main fl hg-24"></div>
    </div>

</div>
<!--web footer copyright start-->
<div class="w-all w-minw bg-c-cccccc p-t-6 p-b-6 ovhidden">
    <div class="w-main m-auto text-c fs-12 ftc-414141 line-24"> Copyright 2010-2017 鲁ICP备88888888号-1（济南齐峰教育咨询有限公司） <br/>
        公司地址：济南市市中区社会组织创新园307（二环南路6086号）
    </div>
</div>
<!--web footer copyright end-->

<!--web footer end-->
<script>
    $(document).ready(function () {
        var w = parseInt(($(window).width() - 1200) / 2);
        $(".qlban_ad").css("right", w)
    });

</script>
</body>
</html>