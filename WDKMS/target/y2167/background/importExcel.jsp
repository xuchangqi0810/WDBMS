<%@page pageEncoding="utf-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>五道口平台</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/themes/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/background/pagenation/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

    </style>
    <script type="text/javascript">
        $(function () {
            $(".click").click(function(){
                $(".tip").fadeIn(200);
            });
            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function(){
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function(){
                $(".tip").fadeOut(100);
            });
        })
    </script>
</head>


<body>

<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar" style="">
            <li class="click"><span></span>导入学员信息</li>
        </ul>
    </div>
</div>

<div class="tip">
    <div class="tiptop"><span>提示信息</span><a></a></div>

    <div class="tipinfo">
        <form  action="${pageContext.request.contextPath}/importFile" method="post" enctype="multipart/form-data">
            <input type="file" name="file" style="font-size:15px; width: 100px;height: 30px;"/>
            <input type="submit" value="导入" style="font-size: 15px;width: 100px;height: 30px;"/>
        </form>
    </div>


    <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" style="width: 100px;" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" style="width: 100px;" />
    </div>

</div>
</body>
</html>