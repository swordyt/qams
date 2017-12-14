URLMAPPING["token/system/systemmange?url=listMockApi"] = function() {
	var data = [
			{
				field : 'id',
				title : '编号'
			},
			{
				field : 'projectid',
				title : '项目ID'
			},
			{
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
							'<a href="javascript:void(0)" onclick="mockApiListEdit(\''
									+ value
									+ '\')"><i class="glyphicon glyphicon-edit"></i></a>',
							'<a href="javascript:void(0)" onclick="mockApiListDel(\''
									+ row.id
									+ '\',\''
									+ row.name
									+ '\')"><i class="glyphicon glyphicon-ban-circle"></i></a>' ]
							.join('');
				},
			} ];
	initBootstrapTable("#table", "token/mock/getapis", data);
}
function mockApiListEdit(id) {
	$("#mockApiModalEditLabel").css("color", "rgba(0, 0, 0, 1)");
	$('#mockApiModalEdit').modal('show');

	// $("#projectModalEditContent").click();
};
function mockApiListDel(id, name) {
	$("#mockApiModalDelLabel").css("color", "rgba(0, 0, 0, 1)");
	$("#listMockApiName").text(name);
	$("#delMockApiId").val(id);
	$('#mockApiModalDel').modal('show');
};
function delMockApiConfirm() {
	var delId = $("#delMockApiId").val();
	$("#delMockApiId").text("");
	$('#mockApiModalDel').modal('hide');
	if (!parent.notEmpty(delId)) {
		return false;
	}
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			parent.promptMessage("成功");
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/mock/delapi", {
		id : delId
	}, fun);
}
