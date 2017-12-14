URLMAPPING["token/system/systemmange?url=listUser"] = function() {
	var data = [
			{
				field : 'id',
				title : '编号'
			},
			{
				field : 'email',
				title : 'email'
			},
			{
				field : 'name',
				title : '姓名'
			},
			{
				field : 'roleid',
				title : '所属角色'
			},
			{
				field : 'id',
				title : '操作',
				formatter : function(value, row, index) {
					return [
							'<a href="javascript:void(0)" onclick="userListEdit(\''
									+ value
									+ '\')"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="userListDel(\''
									+ row.id
									+ '\',\''
									+ row.name
									+ '\')"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/user/getusers", data);
}
function userListEdit(id) {
	$("#userModalEditLabel").css("color", "rgba(0, 0, 0, 1)");
	$('#userModalEdit').modal('show');

	// $("#projectModalEditContent").click();
};
function userListDel(id, name) {
	$("#userModalDelLabel").css("color", "rgba(0, 0, 0, 1)");
	$("#listUserName").text(name);
	$("#delUserId").val(id);
	$('#userModalDel').modal('show');
};
function delUserConfirm() {
	var delId = $("#delUserId").val();
	$("#delUserId").text("");
	$('#userModalDel').modal('hide');
	if (!parent.notEmpty(delId)) {
		return false;
	}
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			parent.promptMessage("成功");
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/user/deluser", {
		id : delId
	}, fun);
}