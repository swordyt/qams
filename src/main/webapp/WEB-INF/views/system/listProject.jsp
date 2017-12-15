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
		<div class="modal fade" id="projectModalEdit" tabindex="-1"
			role="dialog" aria-labelledby="projectModalEditLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="projectModalEditLabel">编辑</h4>
					</div>
					<div class="modal-body" id="projectModalEditBody">
						<form style="margin:auto 5px auto 5px" class="form-horizontal"
							role="form" onload="initDropzone()" id="createProjectForm">
							<div>
								<div class="form-group">
									<input type="hidden" name="id" value="" id="editProjectId" />
									<label>项目名</label> <input type="text" class="form-control"
										name="name" required="required" id="editProjectName" />
								</div>
								<div class="form-group">
									<label>描述</label>
									<textarea rows="4" cols="60" class="form-control"
										name="description" id="editProjectDescription"></textarea>
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
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="updateProject_submit(this.form);return false;">提交更改</button>
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
		<div class="modal fade" id="projectModalDel" tabindex="-1"
			role="dialog" aria-labelledby="projectModalDelLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="projectModalDelLabel">删除</h4>
					</div>
					<div class="modal-body" id="projectModalDelBody">
						<input type="hidden" value="" id="delProjectId"> 您确定要删除“<strong><span
							id="listProjectName"></span> </strong>”项目吗？
						<p class="text-danger">警告！删除该项目，该项目将对拥有该项目的所有用户不可见。</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary"
							onclick="delProjectConfirm();return false;">确定</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
</body>
</html>


