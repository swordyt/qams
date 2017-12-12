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
							name="name" placeholder="请输入角色名" />
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
					<div class="form-group">
						<button class="btn btn-success form-control">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>


