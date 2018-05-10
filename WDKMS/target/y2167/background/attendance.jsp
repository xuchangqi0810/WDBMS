<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/themes/icon.css">

    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>--%>
    <link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/background/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {


            $("#tnGen").click(function () {
                generateStudents();
            });

        });
        function generateStudents() {
            $("#tbStuList").html('');
            //生成学员名称列表
            $.ajax({
                url:"${pageContext.request.contextPath}/getUserAll",
                type:"POST",
                data:{"ugradeid":$("[name=interest]").val()},
                success:function (data) {
                    $.each(eval("("+data+")"),function (i,dom) {
                        if(i%5==4){
                            var div="<div style='width: 130px;' class='layui-btn layui-btn-radius'>"+dom.uname+"</div><br/><br/><br/><br/>";
                        }else{
                            var div="<div style='width: 130px;' class='layui-btn layui-btn-radius'>"+dom.uname+"</div>";
                        }

                        $("#tbStuList").append(div);
                    });

                    $("#tbStuList div").toggle(function (i) {
                        $(this).addClass("layui-btn-warm");
                    },function (i) {
                        $(this).addClass("layui-btn-danger");
                    },function (i) {
                        $(this).removeClass("layui-btn-warm layui-btn-danger");
                    });
                }

            });
        }
        function addAtt() {
            var student=[];
            $.each($("#tbStuList div"), function (i, item) {
                if(item.className=="layui-btn layui-btn-radius"){
                    student[i]=1;
                }else if(item.className=="layui-btn layui-btn-radius layui-btn-warm"){
                    student[i]=2;
                }else if(item.className=="layui-btn layui-btn-radius layui-btn-warm layui-btn-danger"){
                    student[i]=3;
                }
            });
            $.ajax({
                url:"${pageContext.request.contextPath}/addSign",
                type:"POST",
                data:{"ugradeid":$("[name=interest]").val(),"stu":student},
                success:function (data) {
                    if(data==1){
                        layer.alert('添加成功', {
                            skin: 'layui-layer-molv',
                            closeBtn: 0
                        });
                    }else{
                        layer.alert('添加考勤失败,今日已添加', {
                            skin: 'layui-layer-molv',//样式类名
                            closeBtn: 0
                        });
                    }
                }
            });

        }
    </script>


</head>


<body>

<div>
    <div style="float: left">
        <form class="layui-form" action="">
            <div class="layui-form-item" style="margin-top: 20px;">
                <label class="layui-form-label">所教班级:</label>
                <div class="layui-input-block" style="width: 250px">
                    <select name="interest" lay-filter="aihao">
                        <c:forEach items="${getClassAll}" var="item">
                            <option value="${item.dicval}">${item.dicdescribe}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </form>
    </div>
    <div>
        <button id="tnGen" class="layui-btn layui-btn-radius"  style="margin-left:50px;margin-top: 20px">生成班级成员</button>
        <button id="tnAdd" class="layui-btn layui-btn-radius" onclick="addAtt()" style="margin-left:50px;margin-top: 20px">添加考勤</button>
    </div>
    <div style="float: right;">颜色含义说明：
        <button class="layui-btn layui-btn-radius">出勤</button>
        <button class="layui-btn layui-btn-warm layui-btn-radius">迟到</button>
        <button class="layui-btn layui-btn-danger layui-btn-radius">缺勤</button>
    </div>
</div>
<div id="tbStuList" style="margin-top: 50px;margin-left: 160px">

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/background/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form
    });
</script>
</body>
</html>
