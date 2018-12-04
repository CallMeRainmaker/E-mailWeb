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
                fit: true,//自动大小
                method: "post",
                url: "SendMailServlet?method=getMailList",
                singleSelect: false,//是否单选
                sortOrder: 'DESC',
                columns: [[
                    {field: 'chk', checkbox: true, width: 50},
                    {field: 'id', title: 'ID', width: 50, sortable: true},
                    {field: 'accept_name', title: '收件人', width: 200, sortable: true},
                    {field: 'theme', title: '主题', width: 1200},
                    {field: 'time', title: '时间', width: 250}
                ]],
                toolbar: "#toolbar"
            });

            $("#delete").click(function () {
                var selectRows = $("#dataList").datagrid("getSelections");
                var selectLength = selectRows.length;
                if(selectLength == 0){
                    $.messager.alert("消息提醒","请选择数据","warning")
                }else{
                    var ids = [];
                    $(selectRows).each(function (i,row) {
                        ids[i] = row.id;
                    })
                    $.ajax({
                        type:"post",
                        url:"AcceptMailServlet?method=deleteMail&from=send",
                        data:{ids:ids},
                        success:function (msg) {
                            if(msg == "success"){
                                $.messager.alert("消息提醒","删除成功");
                                $("#dataList").datagrid("reload");
                                $("#dataList").datagrid("uncheckAll");
                            }else{
                                $.messager.alert("消息提醒","删除失败");
                                return;
                            }
                        }
                    })
                }
            })

            $("#view").click(function () {
                var selectrow = $("#dataList").datagrid("getSelections");
                var length = selectrow.length;
                if(length == 1){
                    var id = selectrow[0].id;
                    $.ajax({
                        url:$(window).attr({
                            'location':'SendMailServlet?method=MailContentView&id='+id
                        })
                    })
                }else{
                    $.messager.alert("消息提醒","请选择一封邮件","warning")
                }
            })
        })
    </script>
</head>
<body>
<table id="dataList" cellspacing="0" cellpadding="0">

</table>
<div id="toolbar">
    <div style="float: left;"><a id="delete" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true">删除</a></div>
    <div style="float: left;" class="datagrid-btn-separator"></div>
    <div style="float: left;"><a id="readed" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-readed',plain:true">标为已读</a></div>
    <div style="float: left;" class="datagrid-btn-separator"></div>
    <div style="float: left;"><a id="view" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-view',plain:true">查看</a></div>
</div>

</div>
</body>
</html>
