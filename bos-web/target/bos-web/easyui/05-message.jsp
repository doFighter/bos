<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>layout</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>

    <script type="text/javascript">
        $(function () {
            // alert 方法-----提示框
            // $.messager.alert("标题","内容","info");

            // confirm 方法----确认框
            /*
            $.messager.confirm("提示信息","是否确认删除当前信息",function (r) {
                alert(r);
            });*/

            // show 方法-------欢迎框
            $.messager.show({
                title:'欢迎框',
                msg:'欢迎【admin】登录该系统',
                timeout:5000,
                showType:'slide'
            });
        });
    </script>
</head>

</html>