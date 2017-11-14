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
<link rel="stylesheet" type="text/css"
	href="resources/css/system/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/dropzone/dropzone.css">
<script type="text/javascript"
	src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/dropzone/dropzone.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<div class="overlay"></div>

		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top"
			id="sidebar-wrapper" role="navigation">
			<ul class="nav sidebar-nav">
				<li class="sidebar-brand"><a href="#">功能菜单</a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-plus"></i> 项目管理 <span
						class="caret"></span> </a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown-header">项目管理相关功能</li>
						<li><a href="token/system/systemmange?url=createProject">创建项目</a>
						</li>
						<li><a href="#">编辑项目</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-fw fa-plus"></i> 用户管理<span
						class="caret"></span> </a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown-header">用户管理相关功能</li>
						<li><a href="#">创建角色</a></li>
						<li><a href="#">创建用户</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-folder"></i> Page one</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-file-o"></i> Second
						page</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-cog"></i> Third page</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-bank"></i> Page four</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-dropbox"></i> Page 5</a>
				</li>
				<li><a href="#"><i class="fa fa-fw fa-twitter"></i> Last
						page</a>
				</li>
			</ul>
		</nav>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed animated fadeInLeft"
				data-toggle="offcanvas">
				<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
					class="hamb-bottom"></span>
			</button>

			<div id="container_context" style="margin:0px;padding:0px">
				<div class="container">
					<div class="row">
						<div class="col-xs-6 col-xs-offset-3">欢迎来到系统管理页面，webcome to
							System Manage Page!</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<script type="text/javascript" src="resources/js/system.js"></script>
</body>
</html>