<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<div class="tools">
    <ul class="toolbar">
        <li>
            请输入学员编号<input id="uname" style="height: 28px;border:1px solid red;">
            <select id="attendanceid" style="height: 30px;">
                <option selected="selected" value="1">查询今天</option>
                <option value="2">查询最近1周</option>
                <option value="3">查询最近1个月</option>
            </select>
        </li>
        <li onclick="shua()"><span></span>搜索</li>
    </ul>
</div>
<%--查询--%>
<p>
</p>
<div id="main" class="main">
    <table class="tablelist">
        <thead>
        <tr>
            <th>学员姓名</th>
            <th>出勤次数</th>
            <th>迟到次数</th>
            <th>缺勤次数</th>
        </tr>
        </thead>
        <tbody id="userList">
        </tbody>
    </table>
</div>
<script type="text/javascript"src="${pageContext.request.contextPath}/background/jquery-1.8.3.min.js"></script>
<link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/background/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/background/echarts-2.2.7/build/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/js/codemirror.js"></script>
<script src="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/js/javascript.js"></script>
<script type="text/javascript">
    function shua() {

        /*发ajax获取数据*/
        var uname=$("#uname").val();
        var attendanceid=$("#attendanceid").val();
        alert(uname)
        if(uname==null||uname==""){
            alert("请输入学员编号");
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/getAttendanceInfo",
            type:"POST",
            data:{"uid":uname,"selecttype":attendanceid},
            success:function (data) {
                $("#userList").html('');
                $.each(data,function (i,item) {
                    $("#userList").append("<tr><td>"+item.studentid.uname+"</td><td>"+item.chuqin+"</td><td>"+item.queqin+"</td><td>"+item.chidao+"</td></tr>");
                })
            }
        })





    }

</script>



</body>
</html>
