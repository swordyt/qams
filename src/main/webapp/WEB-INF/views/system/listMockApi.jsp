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
		<div class="modal fade" id="mockApiModalEdit" tabindex="-1"
			role="dialog" aria-labelledby="mockApiModalEditLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="mockApiModalEditLabel">编辑</h4>
					</div>
					<div class="modal-body" id="mockApiModalEditBody">
						<form style="margin:auto 5px auto 5px" class="form-inline"
							role="form" id="createProjectForm">
							<input type="hidden" id="editMockapiId" name="id"/>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的的的</span>项目：</label><select
										name="projectid" class="form-control"
										id="editMockapiProjectid">
									</select>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的</span>接口名称：</label> <input
										type="text" class="form-control" placeholder="购买基金"
										name="name" id="editMockapiName">
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的的的</span>方法：</label> <select
										name="method" class="form-control" id="editMockapiMethod">
									</select>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的</span>URL类型：</label>
									<select name="urltype" class="form-control"
										id="editMockapiUrltype">
										<option selected="selected" value="1">URL</option>
										<option value="2">URL正则</option>
									</select>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的的的</span>URL：</label>
									<input type="text" class="form-control"
										placeholder="token/cases/index" name="url" id="editMockapiUrl">
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的的</span>返回码：</label> <input
										type="text" class="form-control" placeholder="200"
										name="resultcode" id="editMockapiResultcode">
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label>返回结果类型：</label> <select class="form-control"
										name="resulttype" id="editMockapiResulttype">
									</select>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的</span>返回结果：</label>
									<textarea cols="50" rows="10" name="resultvalue"
										class="form-control" placeholder="Enter valid JSON"
										id="editMockapiResultvalue"></textarea>
								</div>
							</div>
							<div style="margin-bottom: 5px;">
								<div class="form-group">
									<label><span style="visibility:hidden">我的</span>Headers：</label>
									<textarea cols="50" rows="10" name="headers"
										class="form-control" placeholder="{}" id="editMockapiHeaders"></textarea>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="updateMockApi_submit(this.form);return false;">提交更改</button>
							</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- 删除 -->
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="mockApiModalDel" tabindex="-1"
				role="dialog" aria-labelledby="mockApiModalDelLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="mockApiModalDelLabel">删除</h4>
						</div>
						<div class="modal-body" id="mockApiModalDelBody">
							<input type="hidden" value="" id="delMockApiId"> 您确定要删除“<strong><span
								id="listMockApiName"></span> </strong>”MockApi吗？
							<p class="text-danger">警告！删除该MockApi，该接口将不可访问。</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary"
								onclick="delMockApiConfirm();return false;">确定</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
</body>
</html>


