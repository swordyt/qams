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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="container" style="padding:0px" id="container">
		<table id="table"></table>
		<button id="projectModalEditContent" data-toggle="modal"
			data-target="#projectModalEdit" style="display:none"></button>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="projectModalEdit" tabindex="-1"
			role="dialog" aria-labelledby="projectModalEditLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="projectModalEditLabel">编辑</h4>
					</div>
					<div class="modal-body" id="projectModalEditBody">
						在这里添加文本
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" >提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
</body>
</html>


