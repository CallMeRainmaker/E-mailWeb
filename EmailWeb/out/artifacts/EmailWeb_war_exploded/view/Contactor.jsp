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
                singleSelect: true,//是否单选
                border:true,
                fit: true,//自动大小
                method: "post",
                url: "ContactorServlet?method=getUserList",
                sortOrder: 'DESC',
                columns:[[
                    {field: 'chk', checkbox: true, width: 50},
                    {field: 'id', title: 'ID', width: 100, sortable: true},
                    {field: 'name',title: '邮箱', width: 300},
                    {field: 'mobile', title: '电话', width: 300}
                ]],
                toolbar:"#toolbar"
            })

            $("#search-btn").click(function () {
                $('#datalist').datagrid('load',{
                    name:$('#name').val(),
                    mobile:$('#mobile').val()
                })
            })

            $("#send-btn").click(function () {
                var selectRow = $("#datalist").datagrid("getSelected");
                if(selectRow == null){
                    $.messager.alert("消息提醒","请选择联系人","warning");
                }else {
                    var name = selectRow.name;
                    $.ajax({
                        url:$(window).attr({
                            'location':'SendMailServlet?method=SendMailView&name='+name
                        })
                    })
                }
            })
        })
    </script>
</head>
<body>
<table id="datalist" cellspacing="0" cellpadding="0"></table>
<div id="toolbar">
    <div style="float: left;margin-top:4px;" class="datagrid-btn-separator" >&nbsp;&nbsp;邮箱：<input id="name" class="easyui-textbox" name="name" /></div>
    <div style="margin-left: 10px;margin-top:4px;" >电话：<input id="mobile" class="easyui-textbox" name="mobile" />
        <a id="search-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
        <a id="send-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-Send',plain:true">发送</a>
    </div>
</div>
</body>
</html>
