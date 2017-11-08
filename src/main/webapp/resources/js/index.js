function initCaseManage(data, textStatus, jqXHR) {
	$.each(data.data, function(k, v) {
		if (k == 1) {// cookie记录项目id
			$.cookie('projectId', v.id, {
				path : '/Qams'
			});
		}
		$("#projectSelect").append(
				"<option value=\"" + v.id + "\">" + v.name + "</option>");
	});
}
Network.maskSend("token/project/getprojects", {}, initCaseManage);
function caseMangerNavClick(e) {
	var url = "token/cases/case";
	$("#content_iframe").attr("src", url);
	return false;
}
$(document).ready($("#navbar-collapse ul li a").click(function() {
	var name = $(this).attr("name");
	if (name == "nav-casemanger") {
		$("#content_iframe").attr("src", "token/cases/case");
	}
}), $("#projectSelect").change(function() {
	console.log($(this).val());
	$.cookie('projectId', $(this).val(), {
		path : '/Qams'
	});
	document.getElementById('content_iframe').contentWindow.location.reload(true);
}));