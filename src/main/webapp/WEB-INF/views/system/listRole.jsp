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
		<div class="modal fade" id="roleModalEdit" tabindex="-1" role="dialog"
			aria-labelledby="roleModalEditLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="roleModalEditLabel">编辑</h4>
					</div>
					<div class="modal-body" id="roleModalEditBody">
						<form style="margin:auto 5px auto 5px" class="form-horizontal"
							role="form" onload="initDropzone()" id="createProjectForm">
							<div class="form-group">
								<input type="hidden" id="editRoleId" name="id" /> <label>角色名</label>
								<input class="form-control" type="text" name="name"
									placeholder="请输入角色名" id="editRoleName" />
							</div>
							<div class="form-group">
								<label for="example-getting-role">角色选择</label> <select
									id="example-getting-role" multiple="multiple">
								</select> <span class="help-block">请优先设置需要从已有角色中复制的权限，后续设置时会将已设置项覆盖为选择的角色项。</span>
							</div>
							<div class="form-group">
								<label for="example-getting-permission">权限选择</label> <select
									id="example-getting-permission" multiple="multiple">
								</select>
							</div>
							<div class="form-group">
								<label for="example-getting-project">负责项目</label> <select
									id="example-getting-project" multiple="multiple">
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="updateRoleConfirm(this.form);return false;">提交更改</button>
							</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		<!-- 删除 -->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="roleModalDel" tabindex="-1" role="dialog"
			aria-labelledby="roleModalDelLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="roleModalDelLabel">删除</h4>
					</div>
					<div class="modal-body" id="roleModalDelBody">
						<input type="hidden" value="" id="delRoleId"> 您确定要删除“<strong><span
							id="listRoleName"></span> </strong>”角色吗？
						<p class="text-danger">警告！删除该角色，该角色所对应的用户均会不可访问。</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary"
							onclick="delRoleConfirm();return false;">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
</body>
</html>


