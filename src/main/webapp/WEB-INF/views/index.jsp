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
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
<script type="text/javascript"
	src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<link rel="shortcut icon" href="favicon.ico" />
<title>QAMS</title>
<style type="text/css">
.navInteraction {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container" style="padding: 0">
		<div class="row">
			<nav class="navbar navbar-default" role="navigation">
				<div class="container=fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-collapse">
							<span class="sr-only">切换导航</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand active" href="javascript:void(0);"
							name="nav-home">QAMS</a>
					</div>
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="javascript:void(0);" name="nav-casemanger">用例管理
							</a></li>
							<li><a href="javascript:void(0);" name="nav-automanger">自动化管理</a>
							</li>
							<li><a href="javascript:void(0);" name="nav-systemmanger">系统管理</a>
							</li>
						</ul>
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group">
								<select class="form-control pull-right" id="projectSelect">
								</select>
							</div>
						</form>
						<p class="navbar-text navbar-right" ><a href="index" id="index_userName"></a></p>
					</div>
				</div>
			</nav>
			<button id="index_messageModel" class="btn btn-primary btn-lg hidden"
				data-toggle="modal" data-target="#index_Modal">开始演示模态框</button>
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="index_Modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body" id="index_toast"></div>
						<div class="modal-footer hidden">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="index_messageModelClose">关闭</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<div class="row">
			<div id="myAlert">
				<span id="alertMessage"></span>
			</div>
		</div>
	</div>
	<iframe src="javascript:void(0);" frameborder="0" id="content_iframe"></iframe>

	<script type="text/javascript" src="resources/js/index.js"></script>
</body>
</html>
