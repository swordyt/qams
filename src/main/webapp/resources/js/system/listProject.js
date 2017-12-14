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
function projectListEdit(row) {
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
		if(data.code="000000"){
			parent.promptMessage("成功");
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/project/delproject", {
		id : delId
	}, fun);
}