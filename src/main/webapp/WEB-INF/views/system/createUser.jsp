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
						<label>邮箱账号</label> <input class="form-control" type="text"
							name="email" placeholder="请输入有效邮箱账号" required="required" />
					</div>
					<div class="form-group">
						<label>密码</label> <input class="form-control" type="text"
							name="password" placeholder="请输入密码" required="required" />
					</div>
					<div class="form-group">
						<label>确认密码</label> <input class="form-control" type="text"
							placeholder="请再次输入密码" required="required" />
					</div>
					<div class="form-group">
						<!-- <div class="dropdown">
							<button type="button" class="btn dropdown-toggle"
								id="dropdownMenu1" data-toggle="dropdown">
								选择所属角色<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1" id="dropdownMenu1-ul">
								<li><a>管理员</a>
								</li>
								<li><a>产品经理</a>
								</li>
								<li><a>测试经理</a>
								</li>
								<li><a>项目经理</a>
								</li>
								<li><a>测试员</a>
								</li>
							</ul>
						</div> -->
						<label>所属角色</label>
						<select class="form-control">
						<option>默认</option>
						<option>超级管理员</option>
						<option>系统管理员</option>
						<option>项目经理</option>
						<option>研发经理</option>
						<option>测试经理</option>
						<option>测试员</option>
						<option>研发员</option>
						</select>
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


