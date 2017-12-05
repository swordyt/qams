var Mask = {
	popMask : function(data) {
		$("#index_Modal").modal('hide');
		$("#index_toast").html(data.message);
		$("#index_messageModel").click();
	},
	shutMask : function() {
		// alert($("#loadingModal").html());
		 $("#index_messageModelClose").click();
	}
};
var Network = {
	maskSend : function(url, data, callback) {
		data.tokenId = $.cookie("tokenId");
		$.post(url, data, function(data, textStatus, jqXHR) {
			Mask.popMask(data);
			callback(data, textStatus, jqXHR);
			setTimeout("Mask.shutMask()",1000);
		});
	}
};
$.fn.stringify = function() {
	return JSON.stringify(this);
}
/**
 *  * 和PHP一样的时间戳格式化函数  * date('Y-m-d','1350052653');//很方便的将时间戳转换成了2012-10-11
 * date('Y-m-d H:i:s','1350052653');//得到的结果是2012-10-12 22:37:33
 * 
 * @param {string}
 *            format 格式  *
 * @param {int}
 *            timestamp 要格式化的时间 默认为当前时间  *
 * @return {string}   格式化的时间字符串  
 */
function date(timestamp) {// 比如需要这样的格式 yyyy-MM-dd hh:mm:ss
	var date = new Date(timestamp);
	Y = date.getFullYear() + '-';
	M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
			.getMonth() + 1)
			+ '-';
	D = date.getDate() + ' ';
	h = date.getHours() + ':';
	m = date.getMinutes() + ':';
	s = date.getSeconds();
	// console.log(Y+M+D+h+m+s); //呀麻碟
	// 输出结果：2014-04-23 18:55:49
	return Y + M + D + h + m + s;
};