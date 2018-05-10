<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统HTML模板--模板之家 www.cssmoban.com</title>
    <link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/background/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/bootstrap/js/jquery.pagination.js"></script>


<script type="text/javascript">
    


    function getData(index) {
        //获取用户输入的值
        var unickname=$("#unickname").val();
        var opentime=$("#opentime").val();
        var lasttime=$("#lasttime").val();
        $.ajax({
            //发送请求
            url:"${pageContext.request.contextPath}/getAllLogJSON" ,
            //请求方式
            type:"POST",
            //请求参数
            data:{
                "unickname":unickname,
                "opentime":opentime,
                "lasttime":lasttime,
                "pageIndex":index,
                "pageSize":3
            },
            //回调函数
            success:function (data) {
                //将此标签置空
                $("#userList").html('');
                //渲染数据
                $.each(data.lists,function (i,item) {
                    $("#userList").append("<tr><td><input name='' type='checkbox' value="+item.id+" /></td><td>"+item.usercode+"</td><td>"+item.username+"</td><td>"+item.operateinfo+"</td><td>"+item.strTime+"</td></tr>");
                });
                //渲染分页
                $('#pagination').pagination(data.totalSize, {
                    //当前页码
                    current_page : index,
                    //显示记录数
                    items_per_page : data.pageSize,
                    //显示页码数
                    num_display_entries : 2,
                    callback:getData,
                    load_first_page : true,
                    prev_text : '上一页',
                    next_text : '下一页'
                });
                $(".message").html("共<i class='blue'>"+data.totalSize+"</i>条记录，总页数<i class='blue'>"+data.totalPage+"</i>，当前显示第&nbsp;<i class='blue'>"+(index+1)+"&nbsp;</i>页");
            }
        });
    }


$(document).ready(function(){

    getData(0);

  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);

});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});

</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
        <ul class="toolbar">
            <li>
                用户名查询：<input type="text" id="unickname" style="height:23px;"/>
                开始时间：<input type="date" id="opentime" style="height:23px;"/>
                结束时间：<input type="date" id="lasttime" style="height:23px;"/>
                <input type="button"  value="查询" style="margin: auto; width: 90px;height: 28px;background:#9b9b9b" onclick="getData(0)"/></li>
        </ul>
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
            <th></th>
            <th>用户编号<i class="sort"><img src="${pageContext.request.contextPath}/background/images/px.gif" /></i></th>
            <th>用户名称</th>
            <th>操作</th>
            <th>操作时间</th>
        </tr>
        </thead>
        <tbody id="userList">
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message"></div>
        <div class="pagination" id="pagination"></div>
    </div>

    </div>

    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
