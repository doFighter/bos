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
    <!-- 方式三：使用 easyui 提供的 API 动态创建 datagrid 表格  -->
    <table id="mytable"></table>
    <script type="text/javascript">
        $(function () {
            var myindex = -1;
            // 页面加载完成后，加载 datagrid 表格
            $("#mytable").datagrid({
                // 定义标题行所有的列
                columns:[[
                    {title:'编号',field:'id',checkbox:true},
                    {width:150,title:'姓名',field:'name',editor:{
                            type:'validatebox',
                            options:{}
                        }},
                    {width:150,title:'年龄',field:'age',editor:{
                            type:'numberbox',
                            options:{}
                        }},
                    {width:150,title:'日期',field:'address',editor:{
                            type:'datebox',
                            options:{}
                        }}
                ]],
                // 指定表格发送 Ajax 的请求地址
                url:'${pageContext.request.contextPath}/json/datagrid_data.json',
                rownumbers:true,
                toolbar:[
                    {text:'添加',iconCls:'icon-add',
                        // 为该按钮绑定单击事件
                        handler:function () {
                            $("#mytable").datagrid("insertRow",{
                                index:0,// 在第一行插入数据
                                row:{}// 空行
                            });
                            $("#mytable").datagrid("beginEdit",0);
                            myindex = 0;
                        }
                    },
                    {text:'修改',iconCls:'icon-edit',handler:function () {
                            // 获取选中的对象
                            var rows = $("#mytable").datagrid("getSelections");
                            if (rows.length == 1){
                                var row = rows[0];
                                // 获得指定对象的索引
                                myindex = $("#mytable").datagrid("getRowIndex",row);
                            }
                            $("#mytable").datagrid("beginEdit",myindex);
                        }},
                    {text:'删除',iconCls:'icon-remove',handler:function () {
                            $("#mytable").datagrid("deleteRow",myindex);
                        }},
                    {text:'保存',iconCls:'icon-search',handler:function () {
                            $("#mytable").datagrid("endEdit",myindex);
                        }}
                ],
                // 进行分页
                pagination:true,

                // 数据表格用于监听结束编辑事件
                onAfterEdit:function (index,data,changes) {
                    alert("编辑结束"+data.name);
                }
            });
        });
    </script>
</body>
</html>