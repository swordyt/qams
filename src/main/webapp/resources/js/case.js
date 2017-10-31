var tree_Id;
var tree_Node;
var tree_dbElementId=null;
/*初始化tree*/
var setting = {
    view: {
        addHoverDom: false,
        removeHoverDom: false,
        selectedMulti: false
    },
    check: {
        enable: true
    },
    data: {
        simpleData: {
            enable: true
        }
    },
    edit: {
        enable: false
    },
    callback: {
        onRightClick: rightFunctionMenu,
        onDblClick: doubleItemFunction
    }
};

var zNodes = [
    { id: 0, name: "TestcaseTree", open: true, isParent: true },
    { id: 1, pId: 0, name: "[core] 基本功能 演示", open: true, isParent: true },
    { id: 101, pId: 1, name: "最简单的树 --  标准 JSON 数据" },
    { id: 102, pId: 1, name: "最简单的树 --  简单 JSON 数据" },
    { id: 103, pId: 1, name: "不显示 连接线" },
    { id: 104, pId: 1, name: "不显示 节点 图标" },
    { id: 108, pId: 1, name: "异步加载 节点数据" },
    { id: 109, pId: 1, name: "用 zTree 方法 异步加载 节点数据" },
    { id: 110, pId: 1, name: "用 zTree 方法 更新 节点数据" },
    { id: 111, pId: 1, name: "单击 节点 控制" },
    { id: 112, pId: 1, name: "展开 / 折叠 父节点 控制" },
    { id: 113, pId: 1, name: "根据 参数 查找 节点" },
    { id: 114, pId: 1, name: "其他 鼠标 事件监听" },

    { id: 2, pId: 0, name: "[excheck] 复/单选框功能 演示", open: false },
    { id: 201, pId: 2, name: "Checkbox 勾选操作" },
    { id: 206, pId: 2, name: "Checkbox nocheck 演示" },
    { id: 207, pId: 2, name: "Checkbox chkDisabled 演示" },
    { id: 208, pId: 2, name: "Checkbox halfCheck 演示" },
    { id: 202, pId: 2, name: "Checkbox 勾选统计" },
    { id: 203, pId: 2, name: "用 zTree 方法 勾选 Checkbox" },
    { id: 204, pId: 2, name: "Radio 勾选操作" },
    { id: 209, pId: 2, name: "Radio nocheck 演示" },
    { id: 210, pId: 2, name: "Radio chkDisabled 演示" },
    { id: 211, pId: 2, name: "Radio halfCheck 演示" },
    { id: 205, pId: 2, name: "用 zTree 方法 勾选 Radio" },

    { id: 3, pId: 0, name: "[exedit] 编辑功能 演示", open: false },
    { id: 301, pId: 3, name: "拖拽 节点 基本控制" },
    { id: 302, pId: 3, name: "拖拽 节点 高级控制" },
    { id: 303, pId: 3, name: "用 zTree 方法 移动 / 复制 节点" },
    { id: 304, pId: 3, name: "基本 增 / 删 / 改 节点" },
    { id: 305, pId: 3, name: "高级 增 / 删 / 改 节点" },
    { id: 306, pId: 3, name: "用 zTree 方法 增 / 删 / 改 节点" },
    { id: 307, pId: 3, name: "异步加载 & 编辑功能 共存" },
    { id: 308, pId: 3, name: "多棵树之间 的 数据交互" },

    { id: 4, pId: 0, name: "大数据量 演示", open: false },
    { id: 401, pId: 4, name: "一次性加载大数据量" },
    { id: 402, pId: 4, name: "分批异步加载大数据量" },
    { id: 403, pId: 4, name: "分批异步加载大数据量" },

    { id: 5, pId: 0, name: "组合功能 演示", open: false },
    { id: 501, pId: 5, name: "冻结根节点" },
    { id: 502, pId: 5, name: "单击展开/折叠节点" },
    { id: 503, pId: 5, name: "保持展开单一路径" },
    { id: 504, pId: 5, name: "添加 自定义控件" },
    { id: 505, pId: 5, name: "checkbox / radio 共存" },
    { id: 506, pId: 5, name: "左侧菜单" },
    { id: 507, pId: 5, name: "下拉菜单" },
    { id: 509, pId: 5, name: "带 checkbox 的多选下拉菜单" },
    { id: 510, pId: 5, name: "带 radio 的单选下拉菜单" },
    { id: 508, pId: 5, name: "右键菜单 的 实现" },
    { id: 511, pId: 5, name: "与其他 DOM 拖拽互动" },
    { id: 512, pId: 5, name: "异步加载模式下全部展开" },

    { id: 6, pId: 0, name: "其他扩展功能 演示", open: false },
    { id: 601, pId: 6, name: "隐藏普通节点" },
    { id: 602, pId: 6, name: "配合 checkbox 的隐藏" },
    { id: 603, pId: 6, name: "配合 radio 的隐藏" }
];
var newCount = 1;
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_" + treeNode.tId);
    if (btn) btn.bind("click", function () {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.addNodes(treeNode, { id: (100 + newCount), pId: treeNode.id, name: "new node" + (newCount++) });
        return false;
    });
};
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_" + treeNode.tId).unbind().remove();
};
function rightFunctionMenu(event, treeId, treeNode) {
    tree_Id = treeId;
    tree_Node = treeNode;
    var mouse_x = event.originalEvent.x;
    var mouse_y = event.originalEvent.y;
    if (treeNode == null) {
        console.log("为空！");
        return true;
    }
    console.log(treeNode.id);
    if (treeNode.id == 0) {
        showMenu(["block", "block", "none", "none", "none"]);
        return true;
    }
    if (treeNode.isParent == true) {
        showMenu(["block", "block", "block", "block", "block"]);
        return true;
    }
    if (treeNode.isParent == false) {
        showMenu(["none", "none", "block", "block", "block"]);
        return true;
    }

    function showMenu(attr) {
        $("#menuCreateCase").css("display", attr[0]);
        $("#menuCreateSubdirectory").css("display", attr[1]);
        $("#menuCopy").css("display", attr[2]);
        $("#menuCut").css("display", attr[3]);
        $("#menuDrop").css("display", attr[4]);
        $("#treeRightMenu").css("display", "block")
            .css("left", mouse_x)
            .css("top", mouse_y);
    }
}
function doubleItemFunction(event, treeId, treeNode) {
    console.log(treeNode.tId);
    treeNode.name="ssssssss";
    tree_dbElementId=treeNode;
    return true;
}
/*测试步骤*/
function removeStep(e) {
    $(e).parent().remove();
}
//提交表单
function submitForm(form) {
    console.log("submitForm");
}
$(document).ready(function () {
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    $("#addStep").click(function () {
        $("#steps").append("<div style=\"margin-top: 10px\">" +
            "<div class=\"form-group\">" +
            "<label>步骤&nbsp</label>" +
            "<textarea class=\"form-control\" name=\"step\" placeholder=\"请输入用例步骤\" rows=\"3\" cols=\"30\"></textarea>" +
            "</div>" +
            "&nbsp" +
            "<div class=\"form-group\">" +
            "<label>期望&nbsp</label>" +
            "<textarea class=\"form-control\" name=\"expect\" placeholder=\"请输入期望的结果\" rows=\"3\" cols=\"30\"></textarea>" +
            "</div>" +
            "<button type=\"button\" class=\"btn btn-danger pull-right\" style=\"font-size: 18px;\" onclick=\"removeStep(this)\"><span class=\"glyphicon glyphicon-minus\"></span></button>" +
            "</div>");
    });
    //鼠标单击全屏隐藏功能菜单
    $(document).click(function () {
        $("#treeRightMenu").css("display", "none");
    });
    //创建用例
    $("#menuCreateCase").click(function (event) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.addNodes(tree_Node, { id: (100 + newCount), pId: tree_Node.id, name: "new node" + (newCount++), isParent: false });
        return true;
    });
    //创建子目录
    $("#menuCreateSubdirectory").click(function (event) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.addNodes(tree_Node, { id: (100 + newCount), pId: tree_Node.id, name: "new node" + (newCount++), isParent: true });
        return true;
    });
    //复制
    $("#menuCopy").click(function (event) {

    });
    //剪切
    $("#menuCut").click(function (event) {

    });
    //删除
    $("#menuDrop").click(function (event) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.removeNode(tree_Node);
    });
    //监控name值变化,动态更新树名称
    $("#name").keyup(function (event) {
        if(tree_dbElementId == null){
            return true;
        }
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        console.log(tree_dbElementId);
        tree_dbElementId.name=$(this).val();
        zTree.updateNode(tree_dbElementId);
    });
});
