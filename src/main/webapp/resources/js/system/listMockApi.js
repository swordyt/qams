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
									+ row.id
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
	$("#editMockapiResulttype").html("");
	$("#editMockapiProjectid").html("");
	$("#editMockapiMethod").html("");
	initCreateMockApi("#editMockapiProjectid", "#editMockapiMethod",
			"#editMockapiResulttype");
	function fun(data, textStatus, jqXHR) {
		$("#editMockapiId").val(data.data.id);
		$("#editMockapiName").val(data.data.name);
		setTimeout(function() {
			$("#editMockapiMethod").val(data.data.method);
		}, 500);
		$("#editMockapiUrltype").val(data.data.urltype);
		$("#editMockapiUrl").val(data.data.url);
		$("#editMockapiResultcode").val(data.data.resultcode);
		$("#editMockapiResulttype").val(data.data.resulttype);
		$("#editMockapiResultvalue").val(data.data.resultvalue);
		$("#editMockapiHeaders").val(data.data.headers);
		setTimeout(function() {
			$("#editMockapiProjectid").val(data.data.projectid);
		}, 500);
	}
	parent.Network.maskSend("token/mock/getapi", {
		id : id
	}, fun);
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
function updateProject_submit(e) {
	var data = new Object();
	data.id = $(e.id).val().trim();
	data.projectid = $(e.projectid).val().trim();
	data.name = $(e.name).val().trim();
	data.method = $(e.method).val().trim();
	data.urltype = $(e.urltype).val().trim();
	data.url = $(e.url).val().trim();
	data.resultcode = $(e.resultcode).val().trim();
	data.resulttype = $(e.resulttype).val().trim();
	data.resultvalue = $(e.resultvalue).val().trim();
	data.headers = $(e.headers).val().trim();
	data.headers = $(e.headers).val().trim();
	function fun(data, textStatus, jqXHR) {
		if (data.code = "000000") {
			$('#mockApiModalEdit').modal('hide');
			$("#table").bootstrapTable('refresh');
		}
	}
	parent.Network.maskSend("token/mock/updateapi", data, fun);
	return false;
}
