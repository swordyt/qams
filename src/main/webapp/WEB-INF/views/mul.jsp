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
<script type="text/javascript"
	src="resources/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap-multiselect.js"></script>
<link rel="stylesheet"
	href="resources/css/bootstrap/bootstrap-multiselect.css">
</head>
<body>
	<div class="container">
		<label for="example-getting-started">多选站点</label><select
			id="example-getting-started" multiple="multiple" class="form-control">
			<option value="cheese">Cheese</option>
			<option value="tomatoes">Tomatoes</option>
			<option value="mozarella">Mozzarella</option>
			<option value="mushrooms">Mushrooms</option>
			<option value="pepperoni">Pepperoni</option>
			<option value="onions">Onions</option>
		</select>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#example-getting-started")
									.multiselect(
											{
												nonSelectedText : '全部',
												buttonWidth : '220px',//button宽度  
											});
						});
	</script>
</body>
</html>