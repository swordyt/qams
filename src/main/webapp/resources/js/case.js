var tree_Node;
var rootId;
Dropzone.autoDiscover = false;
Dropzone.options.myAwesomeDropzone = false;
var maxFiles = 4;
var dropz = new Dropzone("#dropzone", {
	init : function() {
		this.on("removedfile", function(file) {
			console.log(file.fileKey + "===" + file.fileName);
		});
		this.on("success", function(file, data) {
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
function typeToIsparent(data) {
	$.each(data.data, function(k, v) {
		data.data[k].grade = data.data[k].level;
		if (data.data[k].pid == null && data.data[k].projectid != null) {
			rootId = data.data[k].id;
		}
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
	responseData = typeToIsparent(responseData);
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
			rootPId : rootId
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
		url : "token/cases/casesTree"
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
	tree_Node = treeNode;
	// var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	var mouse_x = event.originalEvent.x;
	var mouse_y = event.originalEvent.y;
	if (treeNode == null) {
		console.log("为空！");
		return true;
	}
	if (parent.notEmpty(treeNode.projectid)) {
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

	if (treeNode == null) {
		return true;
	}
	tree_Node = treeNode.getParentNode();
	resetForm("kill");
	// tree_dbElementId = treeNode;
	if (treeNode.type == 0) {
		showForm(1, 0, 1, 0, 0, 1, 1);
	}
	if (treeNode.type == 1) {
		showForm(1, 1, 1, 1, 1, 1, 1);
	}
	fillForm(treeNode.name, treeNode.type, treeNode.pid, treeNode.grade,
			treeNode.description, treeNode.step, treeNode.file,
			treeNode.userid, date(treeNode.createtime),
			date(treeNode.updateTime), treeNode.id);
	return true;
}
function fillForm(name, type, pid, grade, description, steps, file, userId,
		createTime, updatetime, id) {
	// steps=decodeURI(steps, "utf-8");
	if (name != null) {
		$("#name").val(name);
	}
	if (type != null) {
		$("#type").val(type);
	}
	if (pid != null) {
		$("#pid").val(pid);
	}else{
		$("#pid").val("");
	}
	if (grade != null) {
		// $("#level").find("option[text='"+grade+"']").attr("selected",true);
		$("#level").val(grade);
	}
	if (description != null) {
		$("#description").val(description);
	}
	if (steps != null) {
		$.each(JSON.parse(steps), function(k, v) {
			if (k == 0) {
				$("#steps_step").val(v.step);
				$("#steps_expect").val(v.expect);
			} else {
				fillStep(v.step, v.expect);
			}

		});
		// $("#steps").val(steps);
	}
	if (file != null) {
		fillFile(file);
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
								+ "<textarea class=\"form-control\" placeholder=\"请输入用例步骤\" rows=\"3\" cols=\"30\""
								+ "\">"
								+ step
								+ "</textarea>"
								+ "</div>"
								+ "&nbsp"
								+ "<div class=\"form-group\">"
								+ "<label>期望&nbsp</label>"
								+ "<textarea class=\"form-control\"  placeholder=\"请输入期望的结果\" rows=\"3\" cols=\"30\""
								+ "\">"
								+ expect
								+ "</textarea>"
								+ "</div>"
								+ "<button type=\"button\" class=\"btn btn-danger pull-right\" style=\"font-size: 18px;\" onclick=\"removeStep(this)\"><span class=\"glyphicon glyphicon-minus\"></span></button>"
								+ "</div>");
	}
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
		$("#dropzone").parent().css("visibility", "hidden");
		$("#dropdownMenu1").parent().css("display", "none");
	} else {
		$("#dropzone").parent().css("visibility", "visible");
		$("#dropdownMenu1").parent().css("display", "block");
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
/**
 * init tree
 */
function initTree() {

	parent.Network.maskSend("token/cases/casesTree", {
		projectId : $.cookie("projectId")
	}, function(data, textStatus, jqXHR) {
		data = typeToIsparent(data);
		// console.log(data.data);
		$.fn.zTree.init($("#treeDemo"), setting, data.data);
	});
}
$(document).ready(
		function() {
			initTree();
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
					parent.promptMessage(data.message);
				}
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.removeNode(tree_Node);
				var data = new Object();
				var id = tree_Node.id;
				data.id = id;
				parent.Network.maskSend("token/cases/delCase", data, fun);
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
// null,'kill'
function resetForm(e) {
	$("#steps").find("button.btn-danger").click();// 删除自增加的步骤
	$("#id").removeAttr("value");// 清除绑定的id
	dropz.removeAllFiles(true);
	// $("#dropzone>div.dz-preview").remove();
	// $("#dropzone").removeClass();
	// $("#dropzone").addClass("dropzone needsclick dz-clickable");
	$("#dropdownMenu1-ul li").each(function(k, v) {
		$(v).remove();
	});
	if (e == "kill") {
		e = null;
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
		obj.expect = $(expectes[index]).val();
		step.push(obj);

	});
	// console.log(decodeURI($(step).stringify(), "utf-8"));
	// data.step = decodeURI($(step).stringify(), "utf-8");
	data.step = JSON.stringify(step);
	data.name = $(form.name).val();
	// $("#dropdownMenu1-ul li p").each(function(){
	// console.log($(this).html());
	// });
	var files = dropz.getAcceptedFiles();
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
		obj.name = $(v).text().trim();
		obj.type = $(v).attr("type");
		obj.key = $(v).attr("key");
		file.push(obj);
	});

	data.file = JSON.stringify(file);
	data.level = $(form.level).val().trim();
	data.pid = $(form.pid).val().trim();
	data.type = $(form.type).val().trim();
	data.description = $(form.description).val().trim();
	function fun(data, textStatus, jqXHR) {
		resetForm("kill");
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		if (tree_Node == null || tree_Node.id == rootId) {
			initTree();
		} else {
			zTree.reAsyncChildNodes(tree_Node, "refresh");
		}
	}
	var id = parseInt($(form.id).val());
	if (isNaN(id)) {
		parent.Network.maskSend("token/cases/addCase", data, fun);
	} else {
		data.id = id;
		parent.Network.maskSend("token/cases/updateCase", data, fun);
	}
}
// 删除已上传附件列表
function removeFile(e) {
	$(e).parent().parent().parent().remove();
}
