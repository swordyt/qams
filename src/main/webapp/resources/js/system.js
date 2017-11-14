Dropzone.autoDiscover = false;
Dropzone.options.myAwesomeDropzone = false;
var createProject_dropz;
function initDropzone() {
	var maxFiles = 4;
	createProject_dropz = new Dropzone("#dropzone", {
		init : function() {
			this.on("removedfile", function(file) {
				console.log(file.fileKey + "===" + file.fileName);
			});
			this.on("success", function(file, data) {
				file.fileKey = data.data.key;
				file.fileName = data.data.name;
				file.fileType = data.data.type;
			});
		},
		maxFiles : maxFiles,
		maxFilesize : 2,
		acceptedFiles : ".jpg,.png,.docx,.xlsx",
		addRemoveLinks : true,
		dictCancelUpload : "取消上传",
		dictCancelUploadConfirmation : "您确定要取消该文件的上传？",
		dictRemoveFile : "删除",
		dictFileTooBig : "拒绝上传：文件大小超过最大上传限制2M。",
		dictMaxFilesExceeded : "拒绝上传：文件数目超过最多上传文件数4。",
		dictResponseError : "服务器无响应，请删除后重新上传！",
		dictDefaultMessage : "请将附件拖动到该区域进行上传，最多上传四个附件，每个附件最多2M！",
		dictInvalidFileType : "拒绝上传：文件类型不符合支持类型jpg、png、docx、xlsx",
		url : "token/upload"
	});
}
function createProject_submit(e) {
	var name=$(e.name).val().trim();
	var description=$(e.description).val().trim();
	var rootTree=$(e.rootTree).val().trim();
	if(name==null||name==undefined||name==""||rootTree==null||rootTree==undefined||rootTree==""){
		return false;
	}
	var files = createProject_dropz.getAcceptedFiles();
	var file = new Array();
	var data = new Object();
	data.name = name;
	data.description = description
	data.rootTree = rootTree;
	$.each(files, function(k, v) {
		var obj = new Object();
		obj.key = v.fileKey;
		obj.name = v.fileName;
		obj.type = v.fileType;
		file.push(obj);
	});
	data.file=JSON.stringify(file);
	function fun(data, textStatus, jqXHR){
		if(data.code=="000000"){
			e.reset();
			createProject_dropz.removeAllFiles(true);
		}
	}
	Network.maskSend("token/project/addproject", data, fun);
	return false;
}
$(document)
		.ready(
				function() {
					var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;
					trigger.click(function() {
						hamburger_cross();
					});

					function hamburger_cross() {

						if (isClosed == true) {
							overlay.hide();
							trigger.removeClass('is-open');
							trigger.addClass('is-closed');
							isClosed = false;
						} else {
							overlay.show();
							trigger.removeClass('is-closed');
							trigger.addClass('is-open');
							isClosed = true;
						}
					}

					$('[data-toggle="offcanvas"]').click(function() {
						$('#wrapper').toggleClass('toggled');
					});
					$(
							"#sidebar-wrapper ul li:not(.dropdown) a,ul.dropdown-menu li a")
							.click(
									function(e) {
										$("#container_context")
												.load(
														$(this).attr("href")
																+ " #container",
														function(response,
																status, xhr) {
															initDropzone();
														});
										e.preventDefault();
										// initDropzone();
										return true;
									});
				});
