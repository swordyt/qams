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
							role="form">
							<div class="form-group">
								<input type="hidden" id="editUserId" name="id"> <label>名字</label>
								<input class="form-control" type="text" name="name"
									required="required" id="editUserName" />
							</div>
							<div class="form-group">
								<label>邮箱账号</label> <input class="form-control" type="email"
									id="editUserEmail" name="email" placeholder="请输入有效邮箱账号"
									required="required" readonly />
							</div>

							<div class="form-group">
								<label>所属角色</label> <select class="form-control" name="roleid"
									id="editUserRoleid">
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="return updateUserConfirm(this.form);return false;">提交更改</button>
							</div>
						</form>
					</div>
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


