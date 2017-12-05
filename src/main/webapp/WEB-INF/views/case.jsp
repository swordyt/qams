<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

<!-- Latest compiled and minified Locales -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>
	<div class="container">
		<table id="table"></table>
		<button id="modal-content" data-toggle="modal" data-target="#myModal"
			style="display:none"></button>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
					</div>
					<div class="modal-body">在这里添加一些文本</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<script>
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
														'<a href="javascript:void(0)"  onclick="edit("编辑")><i class="glyphicon glyphicon-edit"></i></a>',
														'<a href="javascript:void(0)"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
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
								pageSize : 1, //每页显示的记录数  
								pageNumber : 1, //当前第几页  
							});
			function edit(title) {
				$("#modal-content").click();
				$("#myModalLabel").text(title);
			};
		</script>
	</div>
</body>
</html>