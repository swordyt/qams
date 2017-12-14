URLMAPPING["token/system/systemmange?url=listRole"] = function() {
	var data = [
			{
				field : 'id',
				title : '编号'
			},
			{
				field : 'name',
				title : '名字'
			},
			{
				field : 'parentid',
				title : '父编号'
			},
			{
				field : 'communal',
				title : '是否公用',
				formatter : function(value, row, index) {
					if (value == 1) {
						return '是';
					}
					return '否';
				}
			},
			{
				field : 'auth',
				title : '权限'
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
							'<a href="javascript:void(0)" onclick="roleListEdit(\''
									+ value
									+ '\')"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="roleListDel(\''
									+ row.id
									+ '\',\''
									+ row.name
									+ '\')"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/role/getroles", data);
}

function roleListEdit(id) {
	$("#roleModalEditLabel").css("color", "rgba(0, 0, 0, 1)");
	$('#roleModalEdit').modal('show');

	// $("#projectModalEditContent").click();
};
function roleListDel(id, name) {
	$("#roleModalDelLabel").css("color", "rgba(0, 0, 0, 1)");
	$("#listRoleName").text(name);
	$("#delRoleId").val(id);
	$('#roleModalDel').modal('show');
};
function delRoleConfirm() {
	var delId = $("#delRoleId").val();
	$("#delRoleId").text("");
	$('#roleModalDel').modal('hide');
	if (!parent.notEmpty(delId)) {
		return false;
	}
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			parent.promptMessage("成功");
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/role/delrole", {
		id : delId
	}, fun);
}