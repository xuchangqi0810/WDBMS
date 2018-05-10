<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<div class="w-all w-minw bg-c-e3e3e3 p-t-15 ovhidden">
    <!--link start-->
    <div class="w-main m-auto">
        <div class="fl w-65 fs-12 ftc-414141 line-h30 ft-w-b">友情链接：</div>
        <div class="fr">
            <ul class="ql_link">
                <li><a href="#">少儿英语外教</a></li>
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
    <div class="w-main m-auto text-c fs-12 ftc-414141 line-24"> Copyright 2017-2018   京ICP备17068209号-2（XCQ教育咨询有限公司） <br/>
        公司地址：北京海淀区（暂安处2号院北大青鸟楼） </div>
</div>
<!--web footer copyright end-->
<script type="text/javascript" src="${pageContext.request.contextPath}/background/layui/layui.all.js"></script>
<!--web footer end-->
<script>
    $(document).ready(function(){
        var w = parseInt(($(window).width()-1200)/2);
        $(".qlban_ad").css("right",w)
    });
</script>


</body>
</html>