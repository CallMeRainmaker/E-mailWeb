<%--
  Created by IntelliJ IDEA.
  User: huxudong
  Date: 18-10-25
  Time: 下午8:56
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
        $(function () {
            $("#datalist").datagrid({
                border:true,
                fit: true,//自动大小
                method: "post",
                url: "ContactorServlet?method=getUserList",
                sortOrder: 'DESC',
                columns:[[
                    {field: 'id', title: 'ID', width: 100, sortable: true},
                    {field: 'name',title: '邮箱', width: 300},
                    {field: 'mobile', title: '电话', width: 300}
                ]],
                toolbar:"#toolbar"
            })
        })
    </script>
</head>
<body>
<table id="datalist" cellspacing="0" cellpadding="0"></table>
<div id="toolbar">
    <div style="margin-left: 10px;margin-top:4px;" >邮箱：<input id="mailList" class="easyui-textbox" name="mail" />
        <a id="search-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
    </div>
</div>
</body>
</html>
