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
				field : 'id',
				title : '操作',
				formatter : function(value, row, index) {
					return [
							'<a href="javascript:void(0)" onclick="mockProjectListEdit(\''
									+ row.id
									+ '\',\''
									+ row.enabled
									+ '\',\''
									+ row.name
									+ '\',\''
									+ row.description
									+ '\',\''
									+ row.projectleader
									+ '\',\''
									+ row.protocol
									+ '\')"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="mockProjectListDel(\''
									+ row.id
									+ '\',\''
									+ row.name
									+ '\')"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/mockproject/getprojects", data);
}
function mockProjectListEdit(id, enabled, name, description, projectleader,
		protocol) {
	var data = new Object();
	$("#editMockProjectId").val(id);
	if (enabled == 1) {
		$("#editMockProjectEnabled").prop("checked", true);
	}
	$("#editMockProjectName").val(name);
	$("#editMockProjectDescription").val(description);
	$("#editMockProjectProjectleader").val(projectleader);
	$("#editMockProjectProtocol").val(protocol);
	$("#mockProjectModalEditLabel").css("color", "rgba(0, 0, 0, 1)");
	$('#mockProjectModalEdit').modal('show');

	// $("#projectModalEditContent").click();
};
function mockProjectListDel(id, name) {
	$("#mockProjectModalDelLabel").css("color", "rgba(0, 0, 0, 1)");
	$("#listMockProjectName").text(name);
	$("#delMockProjectId").val(id);
	$('#mockProjectModalDel').modal('show');
};
function delMockProjectConfirm() {
	var delId = $("#delMockProjectId").val();
	$("#delMockProjectId").text("");
	$('#mockProjectModalDel').modal('hide');
	if (!parent.notEmpty(delId)) {
		return false;
	}
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			parent.promptMessage("成功");
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/mockproject/delmockproject", {
		id : delId
	}, fun);
}
function updateMockProjectConfirm(e) {
	var data = new Object();
	data.id = $(e.id).val().trim();
	data.enabled = 0;
	if ($(e.enabled).prop("checked")) {
		data.enabled = 1;
	}
	data.name = $(e.name).val().trim();
	data.description = $(e.description).val().trim();
	data.projectleader = $(e.projectleader).val().trim();
	data.protocol = $(e.protocol).val().trim();
	if (!parent.notEmpty(data.id) || !parent.notEmpty(data.name)
			|| !parent.notEmpty(data.protocol)) {
		parent.promptMessage("协议或名字均不能为空！");
		return false;
	}
	function fun(data, textStatus, jqXHR) {
		if (data.code == "000000") {
			$(e.id).val("");
			$(e.name).val("");
			$(e.description).val("");
			$(e.projectleader).val("");
			$(e.protocol).val("");
			$('#mockProjectModalEdit').modal('hide');
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/mockproject/updatemockproject", data, fun);
}