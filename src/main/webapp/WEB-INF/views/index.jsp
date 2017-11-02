<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
String path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<script type="text/javascript" src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<title>QAMS</title>
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
						<a class="navbar-brand" href="#">QAMS</a>
					</div>
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="javascript:void(0);"
								name="nav-casemanger">用例管理</a>
							</li>
							<li><a href="javascript:void(0);" name="nav-automanger">自动化管理</a>
							</li>
							<li><a href="javascript:void(0);" name="nav-usermanger">用户管理</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<div style="clear: both;"></div>
	<iframe src="javascript:void(0);" frameborder="0" id="content_iframe"></iframe>

	<script type="text/javascript" src="resources/js/index.js"></script>
</body>
</html>
