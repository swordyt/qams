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
				<form class="form-horizontal pull-right" role="form" onload="initDropzone()" id="createProjectForm">
					<div>
						<div class="form-group">
							<label>项目名</label> <input type="text" class="form-control"
								name="name" required="required"/>
						</div>
						<div class="form-group">
							<label>描述</label>
							<textarea rows="4" cols="60" class="form-control" name="description"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label>附件</label>
						<div id="dropzone" class="dropzone needsclick dz-clickable"></div>
					</div>
					<div class="form-group">
					<label>用例主目录名</label>
					<input type="text" name="rootTree" class="form-control" required="required"/>
					</div>
					<div class="form-group">
					<button class="btn btn-success form-control" onclick="createProject_submit(this.form);return false;">提交</button>
					</div>
				</form>
					
			</div>
		</div>
	</div>
</body>
</html>


