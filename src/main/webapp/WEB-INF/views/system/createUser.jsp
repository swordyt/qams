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
				<form class="form-horizontal" role="form" > 
					<div class="form-group">
						<label>名字</label> <input class="form-control" type="text"
							name="name" required="required" />
					</div>
					<div class="form-group">
						<label>邮箱账号</label> <input class="form-control" type="email"
							name="email" placeholder="请输入有效邮箱账号" required="required" />
					</div>
					<div class="form-group">
						<label>密码</label> <input class="form-control" type="password"
							name="password" placeholder="请输入密码" required="required" />
					</div>
					<div class="form-group">
						<label>确认密码</label> <input class="form-control" type="password"
							placeholder="请再次输入密码" required="required" name="confirmPassword" />
					</div>
					<div class="form-group">
						<label>所属角色</label>
						<select class="form-control" name="roleid" id="roleid">
						</select>
					</div>
					<div class="form-group">
						<button class="btn btn-success form-control" onclick="return createUser_submit(this.form)">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>


