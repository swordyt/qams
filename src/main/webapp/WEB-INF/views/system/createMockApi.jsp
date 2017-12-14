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
		<div class="row">
			<div class="col-xs-6 col-xs-offset-3">
				<form class="form-inline pull-right" role="form" >
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目：</label><select
								name="projectid" class="form-control" id="mockProjectId">
							</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接口名称：</label>
							<input type="text" class="form-control" placeholder="购买基金" name="name">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;方法：</label>
							<select name="method" class="form-control" id="method">
							</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL类型：</label>
							<select name="urltype" class="form-control">
								<option selected="selected" value="1">URL</option>
								<option value="2">URL正则</option>
							</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL：</label>
							<input type="text" class="form-control"
								placeholder="token/cases/index" name="url">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回码：</label>
							<input type="text" class="form-control" placeholder="200" name="resultcode">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>返回结果类型：</label> <select class="form-control" name="resulttype" id="resultType">
							</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回结果：</label>
							<textarea cols="50" rows="10" name="resultvalue" class="form-control" placeholder="Enter valid JSON"></textarea>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Headers：</label>
							<textarea cols="50" rows="10" name="headers" class="form-control"
								placeholder="{}"></textarea>
						</div>
					</div>
					<div>
						<div class="form-group pull-right">
							<button class="btn btn-success form-control" onclick="createMockApi_submit(this.form);return false;">提交</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>


