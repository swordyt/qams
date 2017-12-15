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
				field : 'id',
				title : '操作',
				formatter : function(value, row, index) {
					return [
							'<a href="javascript:void(0)" onclick="projectListEdit(\''
									+ value
									+ '\')"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="projectListDel(\''
									+ value
									+ '\',\''
									+ row.name
									+ '\')"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/project/getprojects", data);
	initDropzone();
}
function projectListEdit(id) {
	function fun(data, textStatus, jqXHR) {
		$("#dropdownMenu1-ul").html("");
		fillFile(data.data.project.file);
		$("#editProjectId").val(data.data.project.id);
		$("#editProjectName").val(data.data.project.name);
		$("#editProjectDescription").val(data.data.project.description);
	}
	parent.Network.maskSend("token/project/getproject", {
		id : id
	}, fun);

	$("#projectModalEditLabel").css("color", "rgba(0, 0, 0, 1)");
	$('#projectModalEdit').modal('show');

	// $("#projectModalEditContent").click();
};
function projectListDel(id, name) {
	$("#projectModalDelLabel").css("color", "rgba(0, 0, 0, 1)");
	$("#listProjectName").text(name);
	$("#delProjectId").val(id);
	$('#projectModalDel').modal('show');
};
function delProjectConfirm() {
	var delId = $("#delProjectId").val();
	$("#delProjectId").text("");
	$('#projectModalDel').modal('hide');
	if (!parent.notEmpty(delId)) {
		return false;
	}
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			parent.promptMessage("成功");
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/project/delproject", {
		id : delId
	}, fun);
}
/**
 * 填充已上传的附件列表
 */
function fillFile(files) {
	if (files == null || files == "") {
		return null;
	}
	$
			.each(
					JSON.parse(files),
					function(k, v) {
						$("#dropdownMenu1-ul")
								.append(
										"<li role=\"presentation\">"
												+ "<a role=\"menuitem\" tabindex=\"-1\""
												+ "href=\"javascript:void(0);\" style=\"padding-left:0px;\">"
												+ "<p style=\"margin-bottom:0px;font-size: 17px\" key=\""
												+ v.key
												+ "\" type=\""
												+ v.type
												+ "\"><span onclick=\"removeFile(this)\" class=\"glyphicon glyphicon-remove\" style=\"color: rgb(212, 106, 64);padding-left:10px;padding-right:10px;\"></span>"
												+ v.name + "</p>"
												+ "</span></a></li>");
					});

}
function updateProject_submit(e) {
	var data = new Object();
	data.id = $(e.id).val().trim();
	data.name = $(e.name).val().trim();
	data.description = $(e.description).val().trim();
	var files = createProject_dropz.getAcceptedFiles();
	var file = new Array();
	$.each(files, function(k, v) {
		var obj = new Object();
		obj.name = v.fileName;
		obj.type = v.fileType;
		obj.key = v.fileKey;
		file.push(obj);
	});
	$("#dropdownMenu1-ul li a p").each(function(k, v) {
		var obj = new Object();
		obj.name = $(v).text();
		obj.type = $(v).attr("type");
		obj.key = $(v).attr("key");
		file.push(obj);
	});

	data.file = JSON.stringify(file);
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			createProject_dropz.removeAllFiles(true);
			$(e.id).val("");
			$(e.name).val("");
			$(e.description).val("");
			$('#projectModalEdit').modal('hide');
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/project/updateproject", data, fun);
	return false;

}