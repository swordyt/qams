$(document).ready(
	$("#navbar-collapse ul li a").click(function(){
		var name=$(this).attr("name");
		var url="#";
		if (name=="nav-casemanger") {
			url="case.html";
		}
		$("#content_iframe").attr("src",url);
	})
);