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
				<form class="form-inline pull-right" role="form">
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目：</label><select name="" class="form-control">
								<option selected="selected">盈米</option>
								<option>诺诺磅客</option>
							</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接口名称：</label>
								<input type="text" class="form-control" placeholder="购买基金">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;方法：</label>
							<select name="" class="form-control">
							<option selected="selected">GET</option>
							<option>POST</option>
							</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL：</label>
								<input type="text" class="form-control" placeholder="token/cases/index">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回码：</label>
								<input type="text" class="form-control" placeholder="200">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>返回结果类型：</label>
								<select class="form-control" name="">
								<option selected="selected">JSON</option>
								</select>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回结果：</label>
							<textarea cols="50" rows="10" name="" class="form-control"></textarea>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Headers：</label>
							<textarea cols="50" rows="10" name="" class="form-control" placeholder="{}"></textarea>
						</div>
					</div>
					<div>
						<div class="form-group pull-right">
							<button class="btn btn-success form-control"
								onclick="createProject_submit(this.form);return false;">提交</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>


