<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<base href="http://localhost:8080/Qams/">
<title>QACS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->

</head>
<body>
	<div class="container">
		
		<script>
			function edit() {
				$("#modal-content").click();
				$("#myModalLabel").text("编辑");
			};
			function add() {
				$("#modal-content").click();
				$("#myModalLabel").text("添加");
			};
			$('#table')
					.bootstrapTable(
							{
								url : 'data1.json',
								columns : [
										{
											field : 'id',
											title : 'Item ID'
										},
										{
											field : 'name',
											title : 'Item Name'
										},
										{
											field : 'price',
											title : 'Item Price'
										},
										{
											field : 'opt',
											title : '操作',
											formatter : function(value, row,
													index) {
												return [
														'<a href="javascript:void(0)"  onclick="edit()"><i class="glyphicon glyphicon-edit"></i></a>',
														'<a href="javascript:void(0)" onclick="add()"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
														.join('');
											},
										} ],
								sidePagination : "server", //设置在哪里进行分页，可选值为 'client' 或者 'server'。设置 'server'时，必须设置 服务器数据地址（url）或者重写ajax方法
								search : true, //是否启用查询  
								showColumns : true, //显示下拉框勾选要显示的列  
								showRefresh : true, //显示刷新按钮  
								pageList : [ 5, 10, 15, 20, 25 ], //记录数可选列表 
								striped : true, //表格显示条纹  
								pagination : true, //启动分页  
								pageSize : 10, //每页显示的记录数  
								pageNumber : 1, //当前第几页  
								responseHandler : function(data) {
									return {
										"total" : data.data.total,//总页数
										"rows" : data.data.rows
									//数据
									};
								}
							});
		</script>
	</div>
</body>
</html>