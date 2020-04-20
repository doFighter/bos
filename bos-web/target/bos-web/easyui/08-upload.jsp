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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ocupload/jquery.ocupload-1.1.2.js"></script>
    <script type="text/javascript">
        $(function () {
            // 页面加载完成后，调用插件的 upload 方法，动态修改了 HTML 页面元素
            $("#myButton").upload({
                action:'xxx.action',
                name:'myFile'
            });
        });
    </script>
</head>
<body>
    <input id="myButton" type="button" value="上传">

<%--    <iframe name="abc" style="display: none"></iframe>--%>
<%--    <form target="abc" action="xxxx" method="post" enctype="multipart/form-data">--%>
<%--        <input type="file" name="myFile">--%>
<%--        <input type="submit" value="upload">--%>
<%--    </form>--%>

</body>
</html>