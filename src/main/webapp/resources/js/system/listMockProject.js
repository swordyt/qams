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
									+ value
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
function mockProjectListEdit(id) {
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