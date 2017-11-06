var tree_Id;
var tree_Node;
var tree_dbElementId = null;
function typeToIsparent(data){
	$.each(data.data, function(k, v) {
		if (data.data[k].id == 0) {
			data.data[k].open = true;
		}
		if (data.data[k].type == 1) {
			data.data[k].isParent = false;
		} else {
			data.data[k].isParent = true;
		}
	});
	return data;
}
/* 初始化tree */
function dataFilter(treeId, parentNode, responseData) {
	responseData=typeToIsparent(responseData);
	return responseData.data;
}
var setting = {
	view : {
		addHoverDom : false,
		removeHoverDom : false,
		selectedMulti : false
	},
	check : {
		enable : true
	},
	data : {
		simpleData : {
			enable : true,
			idKey : "id",
			pIdKey : "pid",
			isParent : "type",
			rootPId : 0
		},
		keep : {
			leaf : true,
			parent : true
		}
	},
	edit : {
		enable : false
	},
	callback : {
		onRightClick : rightFunctionMenu,
		onDblClick : doubleItemFunction
	},
	async : {
		enable : true,
		dataFilter : dataFilter,
		type : "post",
		autoParam : [ "id" ],
		url : "cases/casesTree"
	}
};
var newCount = 1;
function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
		return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
			+ "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_" + treeNode.tId);
	if (btn)
		btn.bind("click", function() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.addNodes(treeNode, {
				id : (100 + newCount),
				pId : treeNode.id,
				name : "new node" + (newCount++)
			});
			return false;
		});
};
// function removeHoverDom(treeId, treeNode) {
// $("#addBtn_" + treeNode.tId).unbind().remove();
// };
function rightFunctionMenu(event, treeId, treeNode) {
	tree_Id = treeId;
	tree_Node = treeNode;
	// var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	var mouse_x = event.originalEvent.x;
	var mouse_y = event.originalEvent.y;
	if (treeNode == null) {
		console.log("为空！");
		return true;
	}
	console.log(treeNode);
	if (treeNode.id == 0) {
		showMenu([ "block", "block", "none", "none", "none" ]);
		return true;
	}
	if (treeNode.isParent == true) {
		showMenu([ "block", "block", "block", "block", "block" ]);
		return true;
	}
	if (treeNode.isParent == false) {
		showMenu([ "none", "none", "block", "block", "block" ]);
		return true;
	}

	function showMenu(attr) {
		$("#menuCreateCase").css("display", attr[0]);
		$("#menuCreateSubdirectory").css("display", attr[1]);
		$("#menuCopy").css("display", attr[2]);
		$("#menuCut").css("display", attr[3]);
		$("#menuDrop").css("display", attr[4]);
		$("#treeRightMenu").css("display", "block").css("left", mouse_x).css(
				"top", mouse_y);
	}
}
function doubleItemFunction(event, treeId, treeNode) {
	// console.log(treeNode.tId);
	resetForm();
	tree_dbElementId = treeNode;
	if (treeNode.type == 0) {
		showForm(1, 0, 1, 0, 0, 1, 1);
	}
	if (treeNode.type == 1) {
		showForm(1, 1, 1, 1, 1, 1, 1);
	}
	console.log(treeNode);
	fillForm(treeNode.name, treeNode.type, treeNode.pid, treeNode.level,
			treeNode.description, treeNode.step, treeNode.file,
			treeNode.userid, date(treeNode.createtime),
			date(treeNode.updateTime), treeNode.id);
	return true;
}
function fillForm(name, type, pid, level, description, steps, file, userId,
		createTime, updatetime, id) {
	if (name != null) {
		$("#name").val(name);
	}
	if (type != null) {
		$("#type").val(type);
	}
	if (pid != null) {
		$("#pid").val(pid);
	}
	if (level != null) {
		$("#level").val(level);
	}
	if (description != null) {
		$("#description").val(description);
	}
	if (steps != null) {
		$("#steps").val(steps);
	}
	if (file != null) {
		$("#file").val(file);
	}
	if (userId != null) {
		$("#userId").html(userId);
	}
	if (createTime != null) {
		$("#createTime").html(createTime);
	}
	if (updatetime != null) {
		$("#updatetime").html(updatetime);
	}
	if (id != null) {
		$("#id").val(id);
	}
}
/**
 * 填充用例步骤字段
 */
function fillStep(step, expect) {
	console.log("fillStep");
	if (step == null || expect == null) {
		$("#steps")
				.append(
						"<div style=\"margin-top: 10px\">"
								+ "<div class=\"form-group\">"
								+ "<label>步骤&nbsp</label>"
								+ "<textarea class=\"form-control\" placeholder=\"请输入用例步骤\" rows=\"3\" cols=\"30\"></textarea>"
								+ "</div>"
								+ "&nbsp"
								+ "<div class=\"form-group\">"
								+ "<label>期望&nbsp</label>"
								+ "<textarea class=\"form-control\"  placeholder=\"请输入期望的结果\" rows=\"3\" cols=\"30\"></textarea>"
								+ "</div>"
								+ "<button type=\"button\" class=\"btn btn-danger pull-right\" style=\"font-size: 18px;\" onclick=\"removeStep(this)\"><span class=\"glyphicon glyphicon-minus\"></span></button>"
								+ "</div>");
	} else {
		$("#steps")
				.append(
						"<div style=\"margin-top: 10px\">"
								+ "<div class=\"form-group\">"
								+ "<label>步骤&nbsp</label>"
								+ "<textarea class=\"form-control\" placeholder=\"请输入用例步骤\" rows=\"3\" cols=\"30\" value=\""
								+ step
								+ "\"></textarea>"
								+ "</div>"
								+ "&nbsp"
								+ "<div class=\"form-group\">"
								+ "<label>期望&nbsp</label>"
								+ "<textarea class=\"form-control\"  placeholder=\"请输入期望的结果\" rows=\"3\" cols=\"30\" value=\""
								+ expect
								+ "\"></textarea>"
								+ "</div>"
								+ "<button type=\"button\" class=\"btn btn-danger pull-right\" style=\"font-size: 18px;\" onclick=\"removeStep(this)\"><span class=\"glyphicon glyphicon-minus\"></span></button>"
								+ "</div>");
	}
}
$("form").hide();
function showForm(name, level, description, steps, file, createTime, updatetime) {
	$("form").show();
	if (name == null || name == 0 || name == false) {
		$("#name").parent().css("display", "none");
	} else {
		$("#name").parent().css("display", "inline-block");
	}
	if (level == null || level == 0 || level == false) {
		$("#level").parent().css("display", "none");
	} else {
		$("#level").parent().css("display", "inline-block");
	}
	if (description == null || description == 0 || description == false) {
		$("#description").parent().css("display", "none");
	} else {
		$("#description").parent().css("display", "inline-block");
	}
	if (steps == null || steps == 0 || steps == false) {
		$("#steps").parent().css("display", "none");
	} else {
		$("#steps").parent().css("display", "block");
	}
	if (file == null || file == 0 || file == false) {
		$("#file").parent().css("display", "none");
	} else {
		$("#file").parent().css("display", "inline-block");
	}
	if (createTime == null || createTime == 0 || createTime == false) {
		$("#createTime").parent().css("display", "none");
	} else {
		$("#createTime").parent().css("display", "inline-block");
	}
	if (updatetime == null || updatetime == 0 || updatetime == false) {
		$("#updatetime").parent().css("display", "none");
	} else {
		$("#updatetime").parent().css("display", "inline-block");
	}
}
/* 测试步骤 */
function removeStep(e) {
	$(e).parent().remove();
}
$(document).ready(
		function() {
			var zNodes;
			Network.maskSend("cases/casesTree", {}, function(data, textStatus,
					jqXHR) {
				data=typeToIsparent(data);
				// console.log(data.data);
				$.fn.zTree.init($("#treeDemo"), setting, data.data);
			});

			$("#addStep").click(function() {
				fillStep(null, null);
			});
			// 鼠标单击全屏隐藏功能菜单
			$(document).click(function() {
				$("#treeRightMenu").css("display", "none");
			});
			// 创建用例
			$("#menuCreateCase").click(
					function(event) {
						resetForm("kill");
						showForm(1, 1, 1, 1, 1, 1, 1);
						fillForm(null, "1", tree_Node.id, null, null, null,
								null, tree_Node.userId, null, null);
						// var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						// zTree.addNodes(tree_Node, {
						// id : (100 + newCount),
						// pId : tree_Node.id,
						// name : "new node" + (newCount++),
						// isParent : false
						// });
						event.preventDefault();
						return true;
					});
			// 创建子目录
			$("#menuCreateSubdirectory").click(
					function(event) {
						resetForm("kill");
						showForm(1, 0, 1, 0, 0, 1, 1);
						fillForm(null, "0", tree_Node.id, null, null, null,
								null, tree_Node.userId, null, null);
						// var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						// zTree.addNodes(tree_Node, {
						// id : (100 + newCount),
						// pId : tree_Node.id,
						// name : "new node" + (newCount++),
						// isParent : true
						// });
						event.preventDefault();
						return true;
					});
			// 复制
			$("#menuCopy").click(function(event) {

			});
			// 剪切
			$("#menuCut").click(function(event) {

			});
			// 删除
			$("#menuDrop").click(function(event) {
				if (tree_Node.isParent == true) {
					alert("您正在删除的是目录，请再次确认。");
				}
				function fun(data, textStatus, jqXHR) {
					alert(data.message);
				}
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.removeNode(tree_Node);
				var data = new Object();
				var id = tree_Node.id;
				data.id = id;
				Network.maskSend("cases/delCase", data, fun);
				event.preventDefault();
			});
			// 监控name值变化,动态更新树名称
			// $("#name").keyup(function(event) {
			// if (tree_dbElementId == null) {
			// return true;
			// }
			// var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			// console.log(tree_dbElementId);
			// tree_dbElementId.name = $(this).val();
			// zTree.updateNode(tree_dbElementId);
			// });
			// $("#reset").click(function(e){
			// $("#form")[0].reset();
			// });
		});
// 重置表单
function resetForm(e) {
	$("#steps").find("button.btn-danger").click();
	if (e == "kill") {
		e = null;
		$("#id").removeAttr("value");
	}
	if (e == null) {
		$("#reset").click();
	}
	return true;
}

// 提交表单
function submitForm(form) {
	var step = new Array();
	var data = new Object();
	var stepes = $("#steps").find("textarea[placeholder=请输入用例步骤]");
	var expectes = $("#steps").find("textarea[placeholder=请输入期望的结果]");
	$.each(stepes, function(index, domEle) {
		var obj = new Object();
		obj.step = $(domEle).val();
		// console.log(obj.step);
		obj.expect = $(expectes[index]).val();
		step.push(obj);

	});
	console.log(encodeURI($(step).stringify(), "utf-8"));
	data.step = encodeURI($(step).stringify(), "utf-8");
	data.name = $(form.name).val();
	data.file = $(form.file).val();
	data.level = $(form.level).val();
	data.pid = $(form.pid).val();
	data.type = $(form.type).val();
	data.description = $(form.description).val();
	function fun(data, textStatus, jqXHR) {
		alert(data.data);
		resetForm("kill");
	}
	var id = parseInt($(form.id).val());
	if (isNaN(id)) {
		Network.maskSend("cases/addCase", data, fun);
	} else {
		data.id = id;
		Network.maskSend("cases/updateCase", data, fun);
	}

}
