<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-10-23
  Time: 下午5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyui/css/demo.css">
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/js/validateExtends.js"></script>
    <script type="text/javascript">
        $(function() {
            //datagrid初始化
            $('#dataList').datagrid({
                border: true,
                collapsible: false,//是否可折叠的
                fit: true,//自动大小
                method: "post",
                url: "",
                idField: 'id',
                singleSelect: false,//是否单选
                pagination: false,//分页控件
                rownumbers: true,//行号
                sortName: 'id',
                sortOrder: 'DESC',
                remoteSort: false,
                columns: [[
                    {field: 'chk', checkbox: true, width: 50},
                    {field: 'id', title: 'ID', width: 50, sortable: true},
                    {field: 'sendid', title: '发件人', width: 200, sortable: true},
                    {field: 'theme', title: '主题', width: 1200},
                    {field: 'time', title: '时间', width: 250}
                ]],
                toolbar: "#toolbar"
            });
        })
    </script>
</head>
<body>
<table id="dataList" cellspacing="0" cellpadding="0">

</table>
<div id="toolbar">
    <div style="float: left;"><a id="delete" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">删除</a></div>
    <div style="float: left;" class="datagrid-btn-separator"></div>
    <div style="float: left;"><a id="read" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-some-delete',plain:true">标为已读</a></div>
    </div>

</div>
</body>
</html>
