<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<meta charset="UTF-8">
<title>课程列表</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/css/base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/font/bs/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/jsp/font/bs/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/font/js/qlclass.pl.js"></script>
<script src="${pageContext.request.contextPath}/jsp/font/bs/js/holder.min.js"></script>
<body>
<!--web-top start-->

<!--web-top end-->
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
<div class="w-all w-minw hg-60 bd-bs-e9511b bg-c-ffffff ql_webnav">
    <!--网站导航 start-->
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
                                        <dt>
                                            <a href="#">${crc.t_cname}
                                                ></a></dt>
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
        <!--全部商品分类-->
        <ul class="w-950 hg-60 ql_nav">
            <li><a href="index.html" class="cur">首页</a></li>
            <li><a href="联系我们.html">关于我们</a></li>
        </ul>
    </div>
</div>
<!--网站导航 end-->

<!--web main body start-->
<div class="w-all w-minw bg-c-fcfcfc ovhidden">
    <div class="w-main m-auto ovhidden">
        <!--面包屑 start-->
        <div class="w-main fs-14 ftc-7a7a7a line-h45 m-t-18 m-b-18 fl"> 网站位置：首页 > 课程列表</div>
        <!--面包屑 end-->
    </div>
    <!--web main body start-->

    <!--web main bogy top start-->
    <c:if test="${rootvideo!= null}">
    <div class="w-main m-auto ovhidden">
        <c:forEach items="${rootvideo}" var="vi">
            <div class="w-main m-auto bg-c-ffffff ovhidden">
                <!--left img start-->
                <div class="w-450 hg-338 fl"><img src="${pageContext.request.contextPath}/jsp/font/pics/calsscon.jpg" width="450" height="338" alt=""/></div>
                <!--left img end-->
                <!--right info start-->
                <div class="w-680 hg-338 m-l-40 ovhidden ps-r fl">
                    <h3 class="w-all fs-24 ftc-000000 m-t-15 m-b-10 line-h36 fl">${vi.t_vname}</h3>
                    <!--info right start-->
                    <div class="w-all fl">
                        <ul class="con_rig_class">
                            <li class="w-all fs-14 ftc-000000 line-h40 m-b-10 fl">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<span
                                    class="fs-24 ftc-e9511b">￥${vi.t_vprice}</span>
                               <%-- <del class="fs-14 ftc-000000 line-h40 m-l-24">原价：￥1580</del>--%>
                            </li>
                            <li class="w-all fs-14 ftc-000000 line-h28 fl">课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次：32
                            </li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容：3人开班</li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">适用学员：初中一年级</li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">开班规律：循环开班</li>
                            <div class="claer"></div>
                        </ul>
                    </div>
                    <!--info right end-->
                    <div class="standard ps-a pa-b-22">
                        <a class="dsblock w-140 hg-46 text-c line-h46 bg-c-e9511b ftc-ffffff fs-18 bd-rd-6 m-r-28 fl"
                            href="javascript:;" onclick="">立即购买</a>
                        <a class="dsblock w-170 hg-42 text-c line-h42 ftc-e9511b fs-18 bd-rd-6 bd-2s-e9511b m-r-28 fl"
                            href="javascript:;" onclick="">加入购物车</a>
                        <a class="dsblock w-140 hg-46 text-c line-h46 bg-c-6595e4 ftc-ffffff fs-18 bd-rd-6 m-r-28 fl"
                            href="javascript:;" onclick="">课程目录</a>
                    </div>
                </div>
                <!--right info end-->
            </div>
           <%-- <div class="w-main m-auto bg-c-ffffff ovhidden">
                <!--left img start-->
                <div class="w-450 hg-338 fl"><img src="pics/calsscon.jpg" width="450" height="338" alt=""/></div>
                <!--left img end-->
                <!--right info start-->
                <div class="w-680 hg-338 m-l-40 ovhidden ps-r fl">
                    <h3 class="w-all fs-24 ftc-000000 m-t-15 m-b-10 line-h36 fl">中小学金牌新概念英语1、2册连读【升级版】</h3>
                    <!--info right start-->
                    <div class="w-all fl">
                        <ul class="con_rig_class">
                            <li class="w-all fs-14 ftc-000000 line-h40 m-b-10 fl">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<span
                                    class="fs-24 ftc-e9511b">￥1300</span>
                                <del class="fs-14 ftc-000000 line-h40 m-l-24">原价：￥1580</del>
                            </li>
                            <li class="w-all fs-14 ftc-000000 line-h28 fl">课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次：32
                            </li>
                                &lt;%&ndash;    <li class="w-all fs-14 ftc-000000 line-h28 fl">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容：3人开班</li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">适用学员：初中一年级</li>
                                    <li class="w-all fs-14 ftc-000000 line-h28 fl">开班规律：循环开班</li>&ndash;%&gt;
                            <div class="claer"></div>
                        </ul>
                    </div>
                    <!--info right end-->
                    <div class="standard ps-a pa-b-22"><a
                            class="dsblock w-140 hg-46 text-c line-h46 bg-c-e9511b ftc-ffffff fs-18 bd-rd-6 m-r-28 fl"
                            href="javascript:;" onclick="">立即购买</a> <a
                            class="dsblock w-170 hg-42 text-c line-h42 ftc-e9511b fs-18 bd-rd-6 bd-2s-e9511b m-r-28 fl"
                            href="javascript:;" onclick="">加入购物车</a> <a
                            class="dsblock w-140 hg-46 text-c line-h46 bg-c-6595e4 ftc-ffffff fs-18 bd-rd-6 m-r-28 fl"
                            href="javascript:;" onclick="">免费试听</a></div>
                </div>
                <!--right info end-->
            </div>--%>
            <div class="w-main hg-12"></div>
        </c:forEach>
        <!--web main bogy top end-->
        <!--分割线-->
        <div class="w-amin hg-30 ovhidden"></div>
        <!--分割线-->
       <%-- <div class="w-main ovhidden">
            <ul class="w-1140 p-l-30 p-r-30 p-t-13 p-b-13 ovhidden bg-c-ffffff ql_classtab m-b-2">
                <li class="fl"><a href="javascript:;"
                                  class="w-110 fs-16 ftc-000000 line-h30 hg-30 text-c ft-w-b m-r-20 tabcur">课程总览</a>
                </li>
                <span class="fl m-r-20 fs-18 line-h30 ftc-bbbbbb">|</span>
                <li class="fl" name="ql_plistcon"><a href="#ql_plistcon"
                                                     class="w-110 fs-16 ftc-000000 line-h30 hg-30 text-c ft-w-b m-r-20 fl">课程评论</a>
                </li>
                <span class="fl m-r-20 fs-18 line-h30 ftc-bbbbbb">|</span>
                <li class="fl" name="ql_plistcon"><a href="#ql_plistcon"
                                                     class="w-110 fs-16 ftc-000000 line-h30 hg-30 text-c ft-w-b m-r-20 fl">课程目录</a>
                </li>
            </ul>
            <!--课程总览 start-->
            <div class="w-1140 p-l-30 p-r-30 bg-c-ffffff p-b-30 ovhidden">
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">课程介绍</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">
                    针对初一年级学生，根据英语课程，同步并强化提升重要知识点和常见典型题目，做到及时复习，有效的夯实基础。youwin独特方法，帮学员扫清学习障碍。1.帮助学生构建属于自己的个性化学习方案
                    2.课前精细备课，制定完整教学计划 3.我们承诺当堂课满分过关，不满意不计费 4.每次课结束后会有作业，帮助巩固吸收学习内容。每月进行月考，检测知识学习情况 。 <br/>
                    <br/>
                </div>
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">教学目标</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">根据基础知识的理解加深对题目的理解，达到理解题型和题干信息相匹配。<br/>
                    <br/>
                </div>
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">授课特点</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl"><br/>
                    题型和提干信息的比对；特殊疑问句表达和书写；句子结构书写；
                </div>
                <h3 class="fs-16 ft-w-b ftc-e9511b line-26 p-l-15 m-t-15 m-b-15 line_h3 fl">授课内容</h3>
                <div class="w-1115 p-l-15 fs-16 line-h26 ftc-636363 fl">
                    1.精编教材，适度定制VIP教案-全国专家智慧的结晶，学科教学前沿的精华；2.先进的教学理念-能力与成绩兼得，成长和成绩并重；3.人性化的教学方法-情景、体验式快乐教学，构建以学生为中心的课堂；4.VIP高端小课教学-给孩子提供大量运用语言的机会，了解每个孩子的个性特点，核心学习力，帮助他们运用的优劣去学习；5.精细的作业批改-让每个孩子体会属于自己的点滴成长。
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
                        <li class="w-all fl bd-bs-f8f8f8 p-b-13 m-b-25"><a href="#"
                                                                           class="dsblock w-72 hg-72 m-r-30 fl"><img
                                src="pics/xue.jpg" class="bd-rd-36" width="72" height="72" alt=""/></a>
                            <div class="w-1028 ql_pltxt fl">
                                <h4 class="w-all fs-16 line-22 m-b-8 ftc-4c4c4c fl">小飞飞<i
                                        class="dsblock w-18 hg-22 ql_zan fr"></i></h4>
                                <span class="dsblock w-all fs-14 line-h24 ftc-9a9a9a fl">2017-08-10     15:38</span>
                                <p class="w-all fs-14 line-h22 hg-44 ovhidden ps-r fl">
                                    针对初一年级学生，根据英语课程，同步并强化提升重要知识点和常见典型题目，做到及时复习，有效的夯实基础。youwin独特方法，帮学员扫清学习障碍。1.帮助学生构建属于自己的个性化学习方案
                                    2.课前精细备课，制定完整教学计划
                                    3.我们承诺当堂课满分过关，做到及时复习，有效的夯实基础。youwin独特方法针对初一年级学生，根据英语课程，同步并强化提升重要知识点和常见典型题目，做到及时复习，有效的夯实基础。youwin独特方法，帮学员扫清学习障碍。1.帮助学生构建属于自己的个性化学习方案
                                    2.课前精细备课，制定完整教学计划 3.我们承诺当堂课满分过关，做到及时复习，有效的夯实基础。youwin独特方法 <a href="javascript:;"
                                                                                                 class="fs-14 ftc-ff0000 p-l-10 p-r-10 bg-c-ffffff ps-a pa-b-0 pa-r-0 pl_btn_down dsblock">【展开全文】</a>
                                    <a href="javascript:;"
                                       class="ps-a fs-14 ftc-ff0000 p-l-10 p-r-10 bg-c-ffffff pa-b-0 pa-r-0 pl_btn_up dsbnone">【收缩全文】</a>
                                </p>
                            </div>
                        </li>

                        <div class="clear"></div>
                    </ul>

                    <div class="w-all hg-30 fl"></div>
                    <!--pages start-->
                    <ul class="w-560 hg-36 ql_pages m-auto">
                        <li class="fl"><a class="" href="#">&lt;</a></li>
                        <li class="fl"><a class="cur" href="#">1</a></li>
                        <li class="fl"><a class="" href="#">2</a></li>
                        <li class="fl"><a class="" href="#">3</a></li>
                        <li class="fl"><a class="" href="#">...</a></li>
                        <li class="fl"><a class="" href="#">12</a></li>
                        <li class="fl"><a class="" href="#">&gt;</a></li>
                    </ul>
                    <!--pages end-->
                    <div class="w-all hg-30 fl"></div>
                </div>
            </div>
        </div>--%>
        <div class="w-all hg-60 fl"></div>
        <!--web main body end-->
    </div>
    </c:if>
    <c:if test="${rootvideo == null}">
        <h1 class="text-center">暂时没有相关的课程，下次再来！</h1>
        <div class="w-main hg-12"></div>
    </c:if>
</div>


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
    <!--分割线 start-->
    <div class="w-main m-auto m-b-23 ovhidden">
        <div class="m-t-12 fl"><a href="#" class="m-t-25 fl"><img src="pics/footer_logo.png" width="235" height="70"
                                                                  alt=""/></a>
            <div class="qlfooter_nav m-l-45 fl">
                <dl class="ql_f_nav fl">
                    <dt><a href="#">关于我们</a></dt>
                    <dd><a href="#"><i></i>齐峰介绍</a></dd>
                    <dd><a href="#"><i></i>加盟齐峰</a></dd>
                    <dd><a href="#"><i></i>帮助中心</a></dd>
                    <dd><a href="#"><i></i>招贤纳士</a></dd>
                </dl>
                <dl class="ql_f_nav ql_f_navzp fl">
                    <dt><a href="#">课程分类</a></dt>
                    <dd><a href="#"><i></i>小学阶段</a></dd>
                    <dd><a href="#"><i></i>初中阶段</a></dd>
                    <dd><a href="#"><i></i>高中阶段</a></dd>
                    <dd><a href="#"><i></i>家庭教育</a></dd>
                </dl>
                <div class="ql_f_infp w-200 m-l-15 fl">
                    <h3>联系我们</h3>
                    <p><i></i>电话：0531-81768062</p>
                    <p><i></i>邮箱：qifengedu@yeah.net</p>
                </div>
            </div>
        </div>
        <div class="w-244 fr">
            <div class="w-112 m-l-10 fl"><img src="pics/f_ewm1.gif" width="112" height="112" alt=""/>
                <p class="w-all fs-12 ftc-000000 text-c line-h25 fl">手机端</p>
            </div>
            <div class="w-112 m-l-10 fl"><img src="pics/f_ewm1.gif" width="112" height="112" alt=""/>
                <p class="w-all fs-12 ftc-000000 text-c line-h25 fl">手机端</p>
            </div>
        </div>
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
</body>
</html>