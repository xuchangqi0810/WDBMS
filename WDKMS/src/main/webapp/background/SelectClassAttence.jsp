<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--查询--%>

<div class="tools">

    <ul class="toolbar">
        <li>
            请选择要查询的班级名
            <select id="gradeid">
                <c:forEach items="${dictionaryList}" var="item">
                    <option value="${item.dicval}">${item.dicdescribe}</option>
                </c:forEach>
            </select>
        </li>
        <li>
            <select id="attendanceid" style="height: 30px;">
                <option selected="selected" value="1">查询今天</option>
                <option value="2">查询最近1周</option>
                <option value="3">查询最近1个月</option>
            </select>
        </li>
        <li onclick="shua()"><span></span>搜索</li>
    </ul>
</div>
<div id="main" class="main"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/background/jquery-1.8.3.min.js"></script>
<link href="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/css/font-awesome.min.css"
      rel="stylesheet">
<link href="${pageContext.request.contextPath}/background/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/css/carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/css/echartsHome.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/background/echarts-2.2.7/build/dist/echarts.js"></script>
<script src="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/js/codemirror.js"></script>
<script src="${pageContext.request.contextPath}/background/echarts-2.2.7/doc/asset/js/javascript.js"></script>
<script type="text/javascript">
    function shua() {

        /*发ajax获取数据*/
        var gradeid = $("#gradeid").val();
        if (gradeid == null || gradeid == "") {
            alert("请选择要查询的班级");
            return;
        }
        alert($("#attendanceid").val())
        $.ajax({
            url: "${pageContext.request.contextPath}/selectClassList",
            type: "POST",
            data: {"gradeid": gradeid, "selecttype": $("#attendanceid").val()},
            success: function (data) {
                require.config({
                    paths: {
                        echarts: '${pageContext.request.contextPath}/background/echarts-2.2.7/build/dist'
                    }
                });

// 使用
                require(
                    [
                        'echarts',
                        'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
                    ],

                    function (ec) {
// 基于准备好的dom，初始化echarts图表
                        var myChart = ec.init(document.getElementById('main'));
                        var option = {
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            legend: {
                                data: ['出勤', '迟到', '缺勤']
                            },
                            toolbox: {
                                show: true,
                                feature: {
                                    mark: {show: true},
                                    dataView: {show: true, readOnly: false},
                                    magicType: {show: true, type: ['line', 'bar', 'tiled']},
                                    restore: {show: true},
                                    saveAsImage: {show: true}
                                }
                            },
                            calculable: true,
                            xAxis: [
                                {
                                    type: 'value'
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'category',
                                    data: data.uname
                                }
                            ],
                            series: [
                                {
                                    name: '出勤',
                                    type: 'bar',
                                    stack: '总量',
                                    itemStyle: {normal: {label: {show: true, position: 'insideRight'}}},
                                    data: data.chuqin
                                },
                                {
                                    name: '迟到',
                                    type: 'bar',
                                    stack: '总量',
                                    itemStyle: {normal: {label: {show: true, position: 'insideRight'}}},
                                    data: data.chidao
                                },
                                {
                                    name: '缺勤',
                                    type: 'bar',
                                    stack: '总量',
                                    itemStyle: {normal: {label: {show: true, position: 'insideRight'}}},
                                    data: data.queqin
                                }
                            ]
                        };


// 为echarts对象加载数据
                        myChart.setOption(option);
                    }
                );
            }
        })


    }




</script>
</body>
</html>