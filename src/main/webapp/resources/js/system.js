var URLMAPPING = {};
URLMAPPING["token/system/systemmange?url=listProject"] = function() {
	var data = [
			{
				field : 'id',
				title : '项目编号'
			},
			{
				field : 'name',
				title : '项目名称'
			},
			{
				field : 'creater',
				title : '创建者'
			},
			{
				field : 'createtime',
				title : '创建时间',
				formatter : function(value, row, index) {
					return date(value);
				}
			},
			{
				field : 'opt',
				title : '操作',
				formatter : function(value, row, index) {
					return [
							'<a href="javascript:void(0)" onclick="edit()"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="add()"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/project/getprojects", data);
}
URLMAPPING["token/system/systemmange?url=listMockProject"] = function() {
	var data = [
			{
				field : 'id',
				title : '项目编号'
			},
			{
				field : 'name',
				title : '项目名称'
			},
			{
				field : 'projectleader',
				title : '项目负责人'
			},
			{
				field : 'protocol',
				title : '请求协议'
			},
			{
				field : 'enabled',
				title : '是否启用',
				formatter : function(value, row, index) {
					if (value == 1) {
						return "是";
					}
					return "否";
				}
			},
			{
				field : 'creater',
				title : '创建者'
			},
			{
				field : 'createtime',
				title : '创建时间',
				formatter : function(value, row, index) {
					return date(value);
				}
			},
			{
				field : 'opt',
				title : '操作',
				formatter : function(value, row, index) {
					return [
							'<a href="javascript:void(0)" onclick="edit()"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="add()"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/mockproject/getprojects", data);
}
URLMAPPING["token/system/systemmange?url=createProject"] = function() {
	initDropzone();
}
URLMAPPING["token/system/systemmange?url=createMockProject"] = function() {

}
URLMAPPING["token/system/systemmange?url=createMockApi"] = function() {
	function fillProject(data, textStatus, jqXHR) {
		$.each(data.data.rows, function(k, v) {
			$("#mockProjectId").append(
					'<option  value="' + v.id + '">'
							+ v.name + '</option>');
		});
	}
	function fillMethod(data, textStatus, jqXHR) {
		$.each(data.data,function(k, v) {
			$("#method").append(
					'<option value="' + v.value + '">'
							+ v.name + '</option>');
		});
	}
	function fillResultType(data, textStatus, jqXHR) {
		$.each(data.data,function(k, v) {
			$("#resultType").append(
					'<option value="' + v.value + '">'
					+ v.name + '</option>');
		});
	}
	
	Network.maskSend("token/mockproject/getprojects", {
		offset : "0",
		limit : "0"
	}, fillProject);
	Network.maskSend("token/dict/getdicts", {
		tableName : "t_mock_api",
		type : "method"
	}, fillMethod);
	Network.maskSend("token/dict/getdicts", {
		tableName : "t_mock_api",
		type : "resultType"
	}, fillResultType);
}
URLMAPPING["token/system/systemmange?url=listMockApi"] = function() {
	var data = [
				{
					field : 'id',
					title : '编号'
				},{
					field : 'projectid',
					title : '项目ID'
				},{
					field : 'url',
					title : '接口地址'
				},
				{
					field : 'name',
					title : '接口名称'
				},
				{
					field : 'creater',
					title : '创建者'
				},
				{
					field : 'createtime',
					title : '创建时间',
					formatter : function(value, row, index) {
						return date(value);
					}
				},
				{
					field : 'opt',
					title : '操作',
					formatter : function(value, row, index) {
						return [
								'<a href="javascript:void(0)" onclick="edit()"><i class="glyphicon glyphicon-edit"></i></a>',
								'<a href="javascript:void(0)" onclick="add()"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
								.join('');
					},
				} ];
		initBootstrapTable("#table", "token/mock/getapis", data);
}
URLMAPPING["token/system/systemmange?url=createRole"] = function() {

}
URLMAPPING["token/system/systemmange?url=createUser"] = function() {

}
Dropzone.autoDiscover = false;
Dropzone.options.myAwesomeDropzone = false;
var createProject_dropz;
function initDropzone() {
	if ($("#dropzone").length != 1) {
		return null;
	}
	var maxFiles = 4;
	createProject_dropz = new Dropzone("#dropzone", {
		init : function() {
			this.on("removedfile", function(file) {
				console.log(file.fileKey + "===" + file.fileName);
			});
			this.on("success", function(file, data) {
				if (data.code != "000000") {
					this.removeFile(file);
					alert(data.message);
					return null;
				}
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
/** 创建项目的提交 */
function createProject_submit(e) {
	var name = $(e.name).val().trim();
	var description = $(e.description).val().trim();
	var rootTree = $(e.rootTree).val().trim();
	if (name == null || name == undefined || name == "" || rootTree == null
			|| rootTree == undefined || rootTree == "") {
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
	data.file = JSON.stringify(file);
	function fun(data, textStatus, jqXHR) {
		if (data.code == "000000") {
			e.reset();
			createProject_dropz.removeAllFiles(true);
		}
	}
	parent.Network.maskSend("token/project/addproject", data, fun);
	return false;
}
function edit() {
	$("#modal-content").click();
	$("#myModalLabel").text("编辑");
};
function add() {
	$("#modal-content").click();
	$("#myModalLabel").text("添加");
};
/** 初始化项目列表 */
function initBootstrapTable(id, url, columns) {
	$(id).bootstrapTable({
		url : url,
		columns : columns,
		/*
		 * [ { field : 'id', title : 'Item ID' }, { field : 'name', title :
		 * 'Item Name' }, { field : 'price', title : 'Item Price' }, { field :
		 * 'opt', title : '操作', formatter : function(value, row, index) { return [ '<a
		 * href="javascript:void(0)" onclick="edit()"><i class="glyphicon
		 * glyphicon-edit"></i></a>', '<a href="javascript:void(0)"
		 * onclick="add()"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
		 * .join(''); }, } ],
		 */
		sidePagination : "server", // 设置在哪里进行分页，可选值为 'client'
		// 或者 'server'。设置
		// 'server'时，必须设置
		// 服务器数据地址（url）或者重写ajax方法
		search : true, // 是否启用查询
		showColumns : true, // 显示下拉框勾选要显示的列
		showRefresh : true, // 显示刷新按钮
		pageList : [ 5, 10, 15, 20, 25 ], // 记录数可选列表
		striped : true, // 表格显示条纹
		pagination : true, // 启动分页
		pageSize : 10, // 每页显示的记录数
		pageNumber : 1, // 当前第几页
		responseHandler : function(data) {
			return {
				"total" : data.data.total,// 总页数
				"rows" : data.data.rows
			// 数据
			};
		}
	});
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
										var url_content = $(this).attr("href");
										$("#container_context")
												.load(
														url_content
																+ " #container",
														function(response,
																status, xhr) {
															URLMAPPING[url_content]
																	();

														});
										e.preventDefault();
										// initDropzone();
										return true;
									});
				});
