function submit() {
	var email = $('#email').val();
	var password = $('#password').val();
	function fun(data, textStatus, jqXHR) { // data 保存提交后返回的数据，一般为 json 数据
		if (textStatus == "success") {
			if (data.code == "000000") {
				$.cookie('tokenId', data.data.tokinId, {
					path : '/Qams'
				});
				location.href="cases/index?tokenId="+data.data.tokinId;
			} else {
				$("#myAlert").css("display", "block");
				$("#alertMessage").html(data.message);
			}
		}
	};
	Network.maskSend("login", {
		"email" : email,
		"password" : password
	}, fun);
	return false; // 阻止表单自动提交事件
};
$().ready(function() {
	$(".btn-success").click(submit);
	$("#email,#password").focus(function(){
		$("#myAlert").css("display", "none");
	});
});
