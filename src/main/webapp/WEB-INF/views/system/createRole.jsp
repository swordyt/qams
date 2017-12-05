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
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label>角色名</label> <input class="form-control" type="text"
							name="name" placeholder="请输入角色名"/>
					</div>
					<div class="form-group">
						<label>用户权限</label>
						<div class="container">
							<div class="row">
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">创建用户</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">创建用例</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">创建项目</label>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">分配项目</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">选项 3</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">选项 3</label>
								</div>

							</div>
							<div class="row">
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">选项 3</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">选项 3</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">选项 3</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>可分配项目</label>
						<div class="container">
							<div class="row">
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">红高粱01</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">红高粱02</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">红高粱03</label>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">定期01</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">定期02</label>
								</div>
								<div class="col-xs-3 checkbox-inline">
									<label><input type="checkbox" value="">定期03</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
					<button class="btn btn-success form-control">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>


