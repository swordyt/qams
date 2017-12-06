function initProjects(data, textStatus, jqXHR) {
	$.each(data.data, function(k, v) {
		var option = "<option value=\"" + v.id + "\">" + v.name + "</option>";
		if (k == 1) {// cookie记录项目id
			$.cookie('projectId', v.id, {
				path : '/Qams'
			});
			option = "<option selected = \"selected\" value=\"" + v.id + "\">"
					+ v.name + "</option>";
		}
		$("#projectSelect").append(option);
	});
}
Network.maskSend("token/project/getprojects", {}, initProjects);
$(document)
		.ready(
				function() {
					var nav_home = "token/cases/home";
					$("#content_iframe").attr("src", nav_home);
					function navInteraction(){
						//移除上一个菜单被点击效果
						$("a.navbar-brand,#navbar-collapse ul li a").removeClass("navInteraction");
					}
					$("a.navbar-brand").click(function() {
						$("#content_iframe").attr("src", nav_home);
						navInteraction();
						$(this).addClass("navInteraction");
					});
					$("#navbar-collapse ul li a").click(
							function() {
								navInteraction();
								$(this).addClass("navInteraction");//增加点击效果
								var name = $(this).attr("name");
								if (name == "nav-casemanger") {
									$("#content_iframe").attr("src",
											"token/cases/case");
								}
								if(name == "nav-systemmanger"){
									$("#content_iframe").attr("src",
									"token/system/systemmange");	
								}
							});
					$("#projectSelect")
							.change(
									function() {
										console.log($(this).val());
										$.cookie('projectId', $(this).val(), {
											path : '/Qams'
										});
										document
												.getElementById('content_iframe').contentWindow.location
												.reload(true);
									});
				});