var Mask = {
	popMask : function() {
		if ($("#loadingModal") == null) {
			var maskDom = "<div class=\"modal fade\" id=\"loadingModal\">"
					+ "<div"
					+ "style=\"width: 200px;height:60px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-30px\">"
					+ "<div class=\"progress progress-striped active\""
					+ "style=\"margin-bottom: 0;\">"
					+ "<div class=\"progress-bar\" style=\"width: 100%;\">"
					+ "<h5 style=\"margin:0;padding:4px\">正在加载...</h5>"
					+ "</div>" + "</div>" + "</div>" + "</div>";
			$("body").append(maskDom);
			$('#loadingModal').modal({
				backdrop : 'static',
				keyboard : false
			});
		}
		$("#loadingModal").modal('show');
	},
	shutMask : function() {
		// alert($("#loadingModal").html());
		$("#loadingModal").modal('hide');
	}
};
var Network = {
	maskSend : function(url, data, callback) {
		Mask.popMask();
		data.tokenId = $.cookie("tokenId");
		$.post(url, data, function(data, textStatus, jqXHR) {
			if(textStatus=="success" && data.code=="000000"){
				showAlert(1,data.message);
			}else{
				showAlert(2,data.message);
			}
			callback(data, textStatus, jqXHR);
			Mask.shutMask();
		});
	},
	send : function(url, data, callback) {
		$.post(url, data, function(data, textStatus, jqXHR) {
			if(textStatus=="success" && data.code=="000000"){
				showAlert(1,data.message);
			}else{
				showAlert(2,data.message);
			}
			callback(data, textStatus, jqXHR);
		});
	}
};
$.fn.stringify = function() {
	return JSON.stringify(this);
}
/**
 *  * 和PHP一样的时间戳格式化函数  *
 * date('Y-m-d','1350052653');//很方便的将时间戳转换成了2012-10-11 
 * date('Y-m-d H:i:s','1350052653');//得到的结果是2012-10-12 22:37:33
 * @param {string}
 *            format 格式  *
 * @param {int}
 *            timestamp 要格式化的时间 默认为当前时间  *
 * @return {string}   格式化的时间字符串  
 */
function date(timestamp){// 比如需要这样的格式 yyyy-MM-dd hh:mm:ss
	var date = new Date(timestamp);
	Y = date.getFullYear() + '-';
	M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	D = date.getDate() + ' ';
	h = date.getHours() + ':';
	m = date.getMinutes() + ':';
	s = date.getSeconds(); 
//	console.log(Y+M+D+h+m+s); //呀麻碟
	// 输出结果：2014-04-23 18:55:49
	return Y+M+D+h+m+s;
};
/**
 * level 1:成功 0:失败 message:提示信息
 */
function timeOut() {
	$("#myAlert").alert('close');
};
function showAlert(level, message) {
	var style;
	switch (level) {
	case 1:
		style = "center-block alert fade in alert alert-success";
		break;
	case 2:
		style = "center-block alert fade in alert alert-warning";
		break;
	}
	$("#alertMessage").html(message);
	$("#myAlert").attr("class", style).show();
//	setTimeout('timeOut()', 1000);
}