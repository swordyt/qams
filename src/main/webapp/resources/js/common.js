var MASK_FLAG=false;
var Mask = {
	popMask : function(message) {
		$("#index_Modal").on('shown.bs.modal',function(){
			$("#index_Modal").modal('hide');
		});
		$("#index_toast").html(message);
		$("#index_Modal").modal('show');
	}
};
var Network = {
	maskSend : function(url, data, callback) {
		data.tokenId = $.cookie("tokenId");
		$.post(url, data, function(data, textStatus, jqXHR) {
			Mask.popMask(data.message);
			callback(data, textStatus, jqXHR);
// setTimeout("Mask.shutMask()",100);
		});
	},
	send : function(url, data, callback) {
		data.tokenId = $.cookie("tokenId");
		$.post(url, data, function(data, textStatus, jqXHR) {
			callback(data, textStatus, jqXHR);
		});
	}
};
$.fn.stringify = function() {
	return JSON.stringify(this);
}
/**
 * 全局显示提示信息
 */
function promptMessage(e){
	Mask.popMask(e);
}
function notEmpty(e){
	if(e==null||e==undefined||e==""){
		return false;
	}
	return true;
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

/**
 * 附件列表对象
 * 
 */
var Attachment=function (id){
	var _this=this;
	$(id).on("click","li > a > p > span.glyphicon.glyphicon-remove",function(e){
		var key=$(e.currentTarget).parent().attr("key");
		var type=$(e.currentTarget).parent().attr("type");
		_this.removeElement($(e.currentTarget),key,type);
	});
	$(id).on("click","li > a > p > span:nth-child(2)",function(e){
		var key=$(e.currentTarget).parent().attr("key");
		var type=$(e.currentTarget).parent().attr("type");
		var text=$(e.currentTarget).html();
		_this.clickElement($(e.currentTarget),key,type,text);
	});
	this.removeElement=function (e,key,type){
		$(e).parent().parent().parent().remove();
	};
	this.clickElement=function (e,key,type,text){
		window.open("download?key="+key+"."+type+"&text="+text);
	};
	this.getValues=function(){
		var file = new Array();
		$(id+" li a p").each(function(k, v) {
			var obj = new Object();
			obj.name = $(v).children("span[name=text]").first().html();
			obj.type = $(v).attr("type");
			obj.key = $(v).attr("key");
			file.push(obj);
		});
		return file;
	}
	this.obj=$(id);
	this.append=function(key,type,text){
		$(id).append(
				"<li role=\"presentation\">"
				+ "<a role=\"menuitem\" tabindex=\"-1\""
				+ "href=\"javascript:void(0);\" style=\"padding-left:0px;\">"
				+ "<p style=\"margin-bottom:0px;font-size: 17px\" key=\""
				+ key
				+ "\" type=\""
				+ type
				+ "\"><span  name=\"remove\" class=\"glyphicon glyphicon-remove\" style=\"color: rgb(212, 106, 64);padding-left:10px;padding-right:10px;\"></span>"
				+ "<span name=\"text\">"
				+ text + "</span></p>"
				+ "</span></a></li>");
	};
	this.removeAll=function(){
		console.log("removeAll");
		this.obj.html("");
	};
}