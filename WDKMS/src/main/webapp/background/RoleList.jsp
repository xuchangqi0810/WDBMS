<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="utf-8" language="java" isELIgnored="false" %>
<%@taglib prefix="Authorize" uri="http://www.springsecurity.org/jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网站后台管理系统HTML模板--模板之家 www.cssmoban.com</title>
    <link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/js/jquery.js"></script>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript">

        var roleid;
        //工具类
        function change(data) {
            if (!data.length) {
                data.text = data.name;
                if (data.children) {
                    change(data.children);
                }
            } else {
                $.each(data, function (i, v) {
                    change(v);
                });
            }
        }

        function openListActionDialog(rid) {
            roleid=rid;
            //设置标题
            $("#dlg3").dialog("open").dialog("setTitle", "分配权限");
            //设置树状图
            $("#tt").tree({
                //请求地址
                url: "${pageContext.request.contextPath}/getPrivilege?rid=" + rid,
                //设置按钮显示
                checkbox: true,
                //设置按钮联动
                cascadeCheck: false,
                //设置动画
                animate: true,
                loadFilter://过滤数据
                    function (data) {
                        change(data);
                        //设置图标
                        $.each(data, function (i, v) {
                            v.iconCls = "icon-folder";
                        });
                        return data;
                    }
            });
        }

        function deletechecked() {
            check = [];
            $.each($("input:checkbox:checked"), function (i, item) {
                check[i] = $(this).val();
            });
            $.ajax({
                traditional: true,
                url: "${pageContext.request.contextPath}/deleteUser",
                method: "POST",
                data: {"check": check},
                success: function (data) {
                    window.location.href = "${pageContext.request.contextPath}/UserList";
                }
            });
        }

        //修改权限方法
        function  getChecked() {
            //保存id
            var privilege=[];
            //获取所有选中的复选框
            var check=$("#tt").tree("getChecked","checked");
            //获取选中的id
            for (var i=0;check.length>i;i++){
                privilege[i]=check[i].id;
            }

            alert(privilege);
           $.ajax({
               traditional: true,
               //请求地址
               url:"${pageContext.request.contextPath}/updatePrivilegeRoleid",
               method:"POST",
               data:{"roleId":roleid,"privilegeId":privilege},
               success:function (data) {
                   window.location.href="${pageContext.request.contextPath}/getAllRole";
               }
           });
        }

        $(document).ready(function () {
            $(".click").click(function () {
                $(location).attr('href', '${pageContext.request.contextPath}/background/form.jsp');
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);

            });

            $(".cancel").click(function () {
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
            <li class="click"><span><img src="${pageContext.request.contextPath}/background/images/t01.png"/></span>添加
            </li>
            <li class="declick" onclick="deletechecked()"><span><img
                    src="${pageContext.request.contextPath}/background/images/t03.png"/></span>删除
            </li>
        </ul>


        <ul class="toolbar1">
            <li><span><img src="${pageContext.request.contextPath}/background/images/t05.png"/></span>设置</li>
        </ul>

    </div>


    <table class="tablelist">
        <thead>
        <tr>
            <th></th>
            <th>角色编号<i class="sort"><img src="${pageContext.request.contextPath}/background/images/px.gif"/></i></th>
            <th>角色名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${getRole}">
        <tr>
            <td><input name="" type="checkbox" value="${item.rid}"/></td>
            <td>${item.rid}</td>
            <td>${item.roleName}</td>
            <td><a href="javascript:openListActionDialog(${item.rid})" class="tablelink"> 分配权限</a></td>
            </c:forEach>
        </tr>
        </tbody>
        <Authorize:authorize URL="/role/addRole">
            <a href="/role/addRole">添加角色</a>
        </Authorize:authorize>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


    <div id="dlg3" class="easyui-dialog" style="width: 350px;height: 500px;padding: 10px 20px;" closed="true">
        分配权限:
        <ul id="tt">

        </ul>
        <a href="#" class="easyui-linkbutton" onclick="getChecked()">保存权限</a>
    </div>


</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
