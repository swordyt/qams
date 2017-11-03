var Mask = {
	popMask : function() {
		if ($("#loadingModal") == null) {
			var maskDom = "<div class=\"modal fade\" id=\"loadingModal\">"
					+ "<div"
					+ "style=\"width: 200px;height:60px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-30px\">"
					+ "<div class=\"progress progress-striped active\""
					+ "style=\"margin-bottom: 0;\">"
					+ "<div class=\"progress-bar\" style=\"width: 100%;\">"
					+ "<h5 style=\"margin:0;padding:4px\">ÕýÔÚ¼ÓÔØ...</h5>"
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
			callback(data, textStatus, jqXHR);
			Mask.shutMask();
		});
	},
	send : function(url, data, callback) {
		$.post(url, data, function(data, textStatus, jqXHR) {
			callback(data, textStatus, jqXHR);
		});
	}
};
$.fn.stringify = function() {
	return JSON.stringify(this);
}
