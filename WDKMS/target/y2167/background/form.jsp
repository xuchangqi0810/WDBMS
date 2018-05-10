<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div class="formtitle"><span>基本信息</span></div>

        <form action="${pageContext.request.contextPath}/Validator" method="post">
            <ul class="forminfo">
                <%--用户ID--%>
            <li><input name="uid" type="hidden" value="${getUserInfo.uid}" /><label>
                请输入真实姓名</label><input name="uname" placeholder="真实姓名" required type="text" value="${getUserInfo.uname}" class="dfinput" /><i style="color: red">${unamemsg}</i></li>
            <li><label>请输入用户名</label><input name="unickname" placeholder="用户名" required type="text" value="${getUserInfo.unickname}" class="dfinput" /><i style="color: red">${unicknamemsg}</i></li>
                    <%--证明为新增--%>
             <c:if test="${getUserInfo.uid==null}">
                <li><label>请输入密码</label><input name="upwd" placeholder="密码" required type="text"  class="dfinput" /><i style="color: red">${upwdmsg}</i></li>
            </c:if>
                    <%--证明为修改--%>
                   <%-- <c:if test="${getUserInfo.uid!=null}">
                        <input name="upwd" placeholder="密码" required type="hidden" value="0" class="dfinput" />
                    </c:if>--%>
                <li><label>性别</label>
                    <c:if test="${getUserInfo.uid==null}">
                        男&nbsp;<input name="ugender" type="radio"   value="1"
                            checked="checked">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        女&nbsp;<input name="ugender" type="radio"   value="0">
                        <i style="color: red">${ugendermsg}</i>
                    </c:if>
                    <c:if test="${getUserInfo.uid!=null}">
                   男&nbsp;<input name="ugender" type="radio"   value="1"
                            <c:if test="${getUserInfo.ugender==1}">
                            checked="checked" </c:if>/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    女&nbsp;<input name="ugender" type="radio"   value="0"
                    <c:if test="${getUserInfo.ugender==0}">
                        checked="checked" </c:if>/>
                    <i style="color: red">${ugendermsg}</i>
                    </c:if>
                </li>
            <li><label>请选择邮箱</label><input name="uemail" placeholder="邮箱格式,例:xxxxx@qq.com" required type="text" value="${getUserInfo.uemail}" class="dfinput" /><i style="color: red">${uemailmsg}</i></li>
            <li><label>请输入手机号</label><input name="uphone" placeholder="手机号" type="text" required value="${getUserInfo.uphone}" class="dfinput" /><i style="color: red">${uphonemsg}</i></li>
            <li><label>请输入身份证号</label><input name="uidentityid" placeholder="身份证号" required type="text" value="${getUserInfo.uidentityid}" class="dfinput" /><i style="color: red">${uidentityidmsg}</i></li>
            <li><label>出生日期</label><input name="ubirthday" type="date" value="${getUserInfo.strbirthday}"  class="dfinput" /><i style="color: red">${ubirhtdaymsg}</i></li>
           <%-- <li><label>所属年级</label>
                &lt;%&ndash;<input name="ugradeid"  type="text" value="${getUserInfo.ugradeid}" required class="dfinput" />&ndash;%&gt;
                <select name="ugradeid" style="height: 30px">
                    <c:forEach var="item" items="${getRole}">
                            <option
                                    <c:if test="${user.ugradeid==item.rid}">selected="selected" </c:if>
                                    value="${item.rid}" >${item.roleName}
                            </option>
                    </c:forEach>
                </select>
                <i style="color: red">${ugradeidmsg}</i></li>--%>
            <li><label>&nbsp;</label><input  type="submit" class="btn" value="确认保存"/></li>
            </ul>
        </form>
    
    </div>
</body>
</html>
