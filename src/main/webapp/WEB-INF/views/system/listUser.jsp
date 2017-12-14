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
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="userModalEdit" tabindex="-1" role="dialog"
			aria-labelledby="userModalEditLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="userModalEditLabel">编辑</h4>
					</div>
					<div class="modal-body" id="userModalEditBody">
						<form style="margin:auto 5px auto 5px" class="form-horizontal"
							role="form" onload="initDropzone()" id="createUserForm">
							<div>
								<div class="form-group">
									<label>项目名</label> <input type="text" class="form-control"
										name="name" required="required" />
								</div>
								<div class="form-group">
									<label>描述</label>
									<textarea rows="4" cols="60" class="form-control"
										name="description"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="dropdown">
									<button type="button" class="btn dropdown-toggle"
										id="dropdownMenu1" data-toggle="dropdown">
										点击查看已上传附件 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="dropdownMenu1" id="dropdownMenu1-ul">
									</ul>
								</div>
							</div>
							<div class="form-group">
								<label>附件</label>
								<div id="dropzone" class="dropzone needsclick dz-clickable"></div>
							</div>
							<div class="form-group">
								<label>用例主目录名</label> <input type="text" name="rootTree"
									class="form-control" required="required" />
							</div>
							<div class="form-group">
								<button class="btn btn-success form-control"
									onclick="createUser_submit(this.form);return false;">提交</button>
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- 删除 -->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="userModalDel" tabindex="-1" role="dialog"
			aria-labelledby="userModalDelLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="userModalDelLabel">删除</h4>
					</div>
					<div class="modal-body" id="userModalDelBody">
						<input type="hidden" value="" id="delUserId"> 您确定要删除“<strong><span
							id="listUserName"></span> </strong>”用户吗？
						<p class="text-danger">警告！删除该用户，该用户将不能登录该系统。</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary"
							onclick="delUserConfirm();return false;">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>




	</div>
</body>
</html>


