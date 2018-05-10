<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>微冷的雨训练营</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/bs/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/jsp/font/bs/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/jsp/font/bs/js/holder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/jquery-1.11.3.min.js"></script>
<body>


<div class="clear"></div>

<!--web logo and search start-->
<div class="w-main m-auto m-t-37 m-b-25 ovhidden">
    <!--web logo start-->
    <a href="index.html" class="logo fl"><!--<img src="pics/logo.png" width="243px" height="76px" alt="微冷的雨logo(图)"/>-->
        <img class="img-circle" data-src="holder.js/243x76?text=微冷的雨logo" title="微冷的雨logo">

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
<div class="w-all w-minw hg-60 bg-c-ffffff ql_webnav">
    <div class="w-main m-auto ps-r hg-60">
        <!--全部商品分类-->
        <div class="hc_lnav jslist">
            <div class="allbtn">
                <h2><a href="#">全部课程分类</a></h2>
                <ul style="width:250px" class="jspop box">
                    <!--导航-->
                    <%--  <li class="a1">
                          <div class="text-center"><a href="#" class="ftc-ffffff"><h1 style="font-family: Algerian">ACCP</h1></a> </div>

                          <div class="pop">
                              <dl>
                                  <dt><a href="#">S1 ></a></dt>
                                  <dd> <a class="ui-link" href="${pageContext.request.contextPath}/jsp/font/课程详情.html">Logic Java</a>
                                      <a class="ui-link" href="#">C#+SQL Server</a>
                                      <a class="ui-link" href="#">WinForms</a>
                                      <a class="ui-link" href="#">HTML+CSS</a>
                              </dl>
                              <dl>
                                  <dt><a href="#">S2 ></a></dt>
                                  <dd>
                                      <a class="ui-link" href="#">Java OOP</a>
                                      <a class="ui-link" href="#">Java+MySQL</a>
                                      <a class="ui-link" href="#">JSP+Ajax</a>
                                      <a class="ui-link" href="#">C# OOP</a>
                                      <a class="ui-link" href="#">JS+Jquery</a>
                                  </dd>
                              </dl>
                              <dl>
                                  <dt><a href="#">Y2 ></a></dt>
                                  <dd>
                                      <a class="ui-link" href="#">SSM</a>
                                      <a class="ui-link" href="#">SSH</a>
                                      <a class="ui-link" href="#">Hadoop</a>
                                      <a class="ui-link" href="#">Bootstrap+移动</a>
                                  </dd>
                              </dl>

                              <div class="clr"></div>
                          </div>
                      </li>--%>
                    <c:forEach var="rc" items="${rootCourse}">
                        <li class="a1">
                            <div class="text-center">
                                <a href="#" class="ftc-ffffff"><h1 style="font-family: Algerian">${rc.t_cname}</h1></a>
                            </div>
                            <div class="pop">
                                <c:forEach items="${rc.children}" var="crc">
                                    <dl>
                                        <dt><a href="#">${crc.t_cname} ></a></dt>
                                        <dd>
                                            <c:forEach var="ccrc" items="${crc.children}">
                                                <a class="ui-link" href="${pageContext.request.contextPath}/QueryVideo?cid=${ccrc.t_cid}">${ccrc.t_cname}</a>
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
            <li><a href="index.html" class="cur">首页</a></li>
            <!--        <li><a href="课程列表页面.html">小学</a></li>
                    <li><a href="双师单页.html">双师课堂</a></li>
                    <li><a href="考试日历.html">考试日历</a></li>
                    <li><a href="讲师.html">名师</a></li>
                    <li><a href="招商单页.html" class="ql_navhot">招商加盟</a></li>
                    <li><a href="分校列表.html">分校</a></li>
                    <li><a href="资讯列表.html">资讯</a></li>-->
            <li><a href="#">关于我们</a></li>
        </ul>
    </div>
</div>
<!--网站导航 end-->
<!--web banner start-->
<div class="w-all w-minw banner ps-r">
    <div id="full-screen-slider">
        <ul id="slides">
            <li style="background:url('${pageContext.request.contextPath}/jsp/font/pics/ban1.jpg') center top no-repeat;"><a
                    href="javascript:void(0)"></a></li>
            <li style="background:url('${pageContext.request.contextPath}/jsp/font/pics/ban2.jpg') center top no-repeat;"><a
                    href="javascript:void(0)"></a></li>
            <li style="background:url('${pageContext.request.contextPath}/jsp/font/pics/ban3.jpg') center top no-repeat;"><a
                    href="javascript:void(0)"></a></li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/banner.index.js"></script>
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
            <h3 class="fl fs-20 ft-w-b line-h50"><span class="dsblock ql_icon ql_h_class tx-ind m-r-15 fl">精选课程</span>精选课程
            </h3>
            <a href="课程列表页面.html" class="fr fs-14 ftc-000000 line-h50">查看更多></a></div>
        <!--title end-->
    </div>
    <div class="w-main m-auto">
        <ul class="home_calss w-1224 ovhidden">
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <li class="w-280 m-l-13 m-r-13 bg-c-ffffff m-t-8 m-b-23 fl"><a href="课程详情.html"
                                                                           class="dsblock w-280 hg-200 ovhidden ps-r">
                <img src="pics/12.jpg" alt=""/> </a>
                <div class="w-255 p-l-10 p-r-15 fl">
                    <div class="home_calsstxt w-155 fl">
                        <h3 class="w-all fs-16 ftc-000000 line-h32  one_hidden  m-t-6 fl">高中数学提高班高中数学提高班</h3>
                        <span class="dsblock w-all fs-14 ftc-ff0000 line-h32 fl">班   容：3人开班</span></div>
                    <a href="课程详情.html"
                       class="dsblock ql_icon hg-34 line-h34 fs-14 ftc-ffffff m-t-22 ql_h_btnfr w-86 text-c fr">免费体验</a>
                </div>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
</div>
<!--web home main-body end-->

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
        公司地址：北京
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