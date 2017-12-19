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
		<div class="modal fade" id="mockProjectModalEdit" tabindex="-1"
			role="dialog" aria-labelledby="mockProjectModalEditLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="mockProjectModalEditLabel">编辑</h4>
					</div>
					<div class="modal-body" id="mockProjectModalEditBody">
						<form style="margin:auto 5px auto 5px" class="form-inline"
							role="form">
							<div style="margin-bottom: 5px;">
							<input type="hidden" name="id" id="editMockProjectId"/>
								<div class="form-group">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;启用：</label>
									<input type="checkbox" name="enabled" class="form-control"
										value="1" id="editMockProjectEnabled"> <span
										class="help-block">当勾选上启用时，保存项目后将立即创建mock服务。</span>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;项目名称：</label> <input type="text"
										class="form-control" placeholder="请尽量使用英文名称。"
										required="required" name="name" id="editMockProjectName">
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;项目描述：</label>
									<textarea class="form-control" rows="3" cols="35"
										name="description" id="editMockProjectDescription"></textarea>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label>项目负责人：</label> <input type="text" class="form-control"
										name="projectleader" id="editMockProjectProjectleader">
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;协议：</label>
									<select name="protocol" class="form-control"
										id="editMockProjectProtocol">
										<option selected="selected" value="http">HTTP</option>
										<option value="https">HTTPS</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" onclick="updateMockProjectConfirm(this.form);return false;">提交更改</button>
							</div>
							<!-- <div>
						<div class="form-group pull-right">
							<button class="btn btn-success form-control" onclick="createMockProject_submit(this.form);return false;">提交</button>
						</div>
					</div>-->
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- 删除 -->
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="mockProjectModalDel" tabindex="-1"
				role="dialog" aria-labelledby="mockProjectModalDelLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="mockProjectModalDelLabel">删除</h4>
						</div>
						<div class="modal-body" id="mockProjectModalDelBody">
							<input type="hidden" value="" id="delMockProjectId">
							您确定要删除“<strong><span id="listMockProjectName"></span> </strong>”Mock项目吗？
							<p class="text-danger">警告！删除该Mock项目，该项目所对应的MockApi均会不可访问。</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary"
								onclick="delMockProjectConfirm();return false;">确定</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
</body>
</html>


