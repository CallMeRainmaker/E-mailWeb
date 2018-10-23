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
                title: '收件箱',
                iconCls: 'icon-more',//图标
                border: true,
                collapsible: false,//是否可折叠的
                fit: true,//自动大小
                method: "post",
                url: "",
                idField: 'id',
                singleSelect: false,//是否单选
                pagination: true,//分页控件
                rownumbers: true,//行号
                sortName: 'id',
                sortOrder: 'DESC',
                remoteSort: false,
                columns: [[
                    {field: 'chk', checkbox: true, width: 50},
                    {field: 'id', title: 'ID', width: 50, sortable: true},
                    {field: 'sn', title: '学号', width: 200, sortable: true},
                    {field: 'name', title: '姓名', width: 200},
                    {field: 'sex', title: '性别', width: 100},
                    {field: 'mobile', title: '电话', width: 150},
                    {field: 'qq', title: 'QQ', width: 150},
                    {
                        field: 'clazz_id', title: '班级', width: 150,
                        formatter: function (value, row, index) {
                            if (row.clazzId) {
                                var clazzList = $("#clazzList").combobox("getData");
                                for (var i = 0; i < clazzList.length; i++) {
                                    //console.log(clazzList[i]);
                                    if (row.clazzId == clazzList[i].id) return clazzList[i].name;
                                }
                                return row.clazzId;
                            } else {
                                return 'not found';
                            }
                        }
                    },

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
    <div style="float: left;"><a id="add" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a></div>
    <div style="float: left;" class="datagrid-btn-separator"></div>
    <div style="float: left;"><a id="edit" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a></div>
    <div style="float: left;" class="datagrid-btn-separator"></div>
    <div style="float: left;"><a id="delete" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-some-delete',plain:true">删除</a></div>
    <div style="float: left;margin-top:4px;" class="datagrid-btn-separator" >&nbsp;&nbsp;姓名：<input id="search_student_name" class="easyui-textbox" name="search_student_name" /></div>
    <div style="margin-left: 10px;margin-top:4px;" >班级：<input id="clazzList" class="easyui-textbox" name="clazz" />
        <a id="search-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
    </div>

</div>
</body>
</html>
