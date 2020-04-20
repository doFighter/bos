<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>datagrid</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>

</head>
<body>
    <!-- 方法一：将静态HTML渲染为datagrid样式 -->
    <table class="easyui-datagrid">
        <thead>
            <tr>
                <th data-options="field:'id'">编号</th>
                <th data-options="field:'name'">姓名</th>
                <th data-options="field:'age'">年龄</th>

            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1001</td>
                <td>小王</td>
                <td>26</td>
            </tr>
            <tr>
                <td>1002</td>
                <td>小明</td>
                <td>32</td>
            </tr>
            <tr>
                <td>1003</td>
                <td>小亮</td>
                <td>22</td>
            </tr>
        </tbody>
    </table>
    <hr>
    <!-- 方法二：发送Ajax请求获取json数据创建dadagrid -->
    <table data-options="url:'${pageContext.request.contextPath}/json/datagrid_data.json'" class="easyui-datagrid">
        <thead>
        <tr>
            <th data-options="field:'id'">编号</th>
            <th data-options="field:'name'">姓名</th>
            <th data-options="field:'age'">年龄</th>

        </tr>
        </thead>

    </table>
    <hr>
    <!-- 方式三：使用 easyui 提供的 API 动态创建 datagrid 表格  -->
    <table id="mytable">

    </table>
    <script type="text/javascript">
        $(function () {
            // 页面加载完成后，加载 datagrid 表格
            $("#mytable").datagrid({
                // 定义标题行所有的列
                columns:[[
                    {title:'编号',field:'id',checkbox:true},
                    {title:'姓名',field:'name'},
                    {title:'年龄',field:'age'},
                    {title:'地址',field:'address'}
                ]],
                // 指定表格发送 Ajax 的请求地址
                url:'${pageContext.request.contextPath}/json/datagrid_data.json',
                rownumbers:true,
                toolbar:[
                    {text:'添加',iconCls:'icon-add',
                        // 为该按钮绑定单击事件
                        handler:function () {
                            alert("add.....");
                        }
                    },
                    {text:'修改',iconCls:'icon-edit'},
                    {text:'删除',iconCls:'icon-remove'},
                    {text:'查询',iconCls:'icon-search'}
                ],
                // 进行分页
                pagination:true
            });
        });
    </script>
</body>
</html>