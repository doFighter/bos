<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>highcharts</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>

    <script src="${pageContext.request.contextPath }/js/highchart/highcharts.js"></script>
    <script src="${pageContext.request.contextPath }/js/highchart/modules/exporting.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#test').highcharts({
                title: {
                    text: '这是一个柱状图'
                },
                subtitle:{text:'这是副标题'},
                xAxis: {
                    categories: ['苹果', ' 香蕉', '梨', '橙', '李']
                },
                series: [{
                    type: 'column',
                    name: 'Jane',
                    data: [3, 2, 1, 3, 4]
                }, {
                    type: 'column',
                    name: 'John',
                    data: [2, 3, 5, 7, 6]
                }, {
                    type: 'column',
                    name: 'Joe',
                    data: [4, 3, 3, 9, 0]
                }]
            });
        });
    </script>
</head>
<body>
    <div id="test"></div>
</body>
</html>