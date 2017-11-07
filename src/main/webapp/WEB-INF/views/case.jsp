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
<title>QACS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/js/jquery/jquery.cookie.js"></script>
<!-- <script type="text/javascript" src="js/angular.min.js"></script> -->
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="resources/css/bootstrapStyle/bootstrapStyle.css" type="text/css">
<script type="text/javascript"
	src="resources/js/tree/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="resources/js/tree/jquery.ztree.excheck.js"></script>
<script type="text/javascript"
	src="resources/js/tree/jquery.ztree.exedit.js"></script>
<script src="resources/js/common.js"></script>
<!-- <script src="resources/js/dropzone.min.js"></script> -->
<title>QAMS</title>
</head>
<body>
	<div class="container" style="padding: 0;">
		<div class="row" style="border:1px double #e7e7e7">
			<div class="col-xs-4"
				style="padding: 0;height:588px;overflow-y:auto;overflow-x: scroll;">
				<div>
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1" style="position: fixed;"
					id="treeRightMenu">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#" id="menuCreateCase"><span
							class="glyphicon glyphicon-plus" style="color: #5cb85c"></span>创建用例</a>
					</li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#" id="menuCreateSubdirectory"><span
							class="glyphicon glyphicon-plus" style="color: #204d74"></span>创建子目录</a>
					</li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#" id="menuCopy"><span class="glyphicon glyphicon-plus"
							style="color: #269abc"></span>复制</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#" id="menuCut"><span class="glyphicon glyphicon-plus"
							style="color: #d58512"></span>剪切</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#" id="menuDrop"><span
							class="glyphicon glyphicon-remove" style="color: #ac2925"></span>删除</a>
					</li>
					<!-- <li role="presentation" class="divider"></li> -->
					<!-- <li role="presentation"><a role="menuitem" tabindex="-1" href="#">åç¦»çé¾æ¥</a></li> -->
				</ul>
			</div>
			<div class="col-xs-8"
				style="height:588px;overflow-y:auto;overflow-x: auto;">
				<form class="form-inline" role="form" method="post" action="#"
					id="form">
					<div>
						<div class="form-group">
							<label for="name">名称</label> <input type="text" name="name"
								class="form-control" id="name" required="">
						</div>
						<input type="hidden" name="id" id="id" style="display:none"/><input
							type="hidden" name="pid" value="0" id="pid" style="display:none"/> <input
							type="hidden" name="type" value="0" id="type" style="display:none"/>
						<div class="form-group">
							<label for="level">优先级</label> <select class="form-control"
								name="level" id="level">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="form-group pull-right">
							<button type="button" class="form-control btn btn-success"
								onclick="submitForm(this.form);return false;">
								提交
								<!-- <span class="glyphicon glyphicon-ok"></span> -->
							</button>
						</div>
					</div>
					<div>
						<div class="form-group" style="margin-top: 10px">
							<label>描述</label>
							<textarea class="form-control" cols="70" rows="5"
								name="description" id="description"></textarea>
						</div>
					</div>
					<div>
						<div style="margin-top: 20px" id="steps">
							<div class="form-group">
								<label>步骤</label>
								<textarea class="form-control" placeholder="请输入用例步骤" rows="3"
									cols="30" id="steps_step"></textarea>
							</div>
							<div class="form-group">
								<label>期望</label>
								<textarea class="form-control" placeholder="请输入期望的结果" rows="3"
									cols="30" id="steps_expect"></textarea>
							</div>
							<button type="button" id="addStep"
								class="btn btn-success pull-right" style="font-size: 18px;">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
						</div>
					</div>
					<div style="margin-top: 20px">
						<div class="form-group pull-left">
							<label>附件</label> <input type="file" name="file" id="file"
								class="form-control" />
						</div>
						<div class="form-group pull-right">
							<label>创建者</label><span>
								<p class="form-control-static" id="userId"></p> </span>
						</div>
					</div>
					<div class="clearfix"></div>
					<div style="margin-top: 20px">
						<div class="form-group pull-left">
							<label>最新修改时间</label>
							<p class="form-control-static" id="updatetime"></p>
						</div>
						<div class="form-group pull-right">
							<label>创建时间</label>
							<p class="form-control-static" id="createTime"></p>
						</div>
					</div>
					<div style="clear:both">
						<div class="form-group pull-right">
							<input class="btn btn-warning form-control" type="reset"
								id="reset" onclick="resetForm(this)" value="重置" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="resources/js/case.js"></script>
</body>
</html>
