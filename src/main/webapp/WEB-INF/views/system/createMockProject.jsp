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
				<form class="form-inline pull-right" role="form" method="post" action="token/mockproject/add">
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;启用：</label>
							<input type="checkbox" name="enabled" class="form-control" value="1"> <span
								class="help-block">当勾选上启用时，保存项目后将立即创建mock服务。</span>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目名称：</label> <input
								type="text" class="form-control" placeholder="请尽量使用英文名称。" required="required" name="name">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目描述：</label> 
							<textarea class="form-control" rows="3" cols="35" name="description"></textarea>
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>项目负责人：</label> <input type="text" class="form-control" name="projectleader">
						</div>
					</div>
					<div style="margin-bottom: 5px;">
						<div class="form-group">
							<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;协议：</label>
							<select name="protocol" class="form-control">
								<option selected="selected" value="http">HTTP</option>
								<option value="https">HTTPS</option>
							</select>
						</div>
					</div>
					<div>
						<div class="form-group pull-right">
							<button class="btn btn-success form-control">提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>


