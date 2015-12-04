
var highlightcolor = "#eafcd5";
// 此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var clickcolor = "#51b2f6";

	
function changeto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE") {
		return;
	}
	while (source.tagName != "TD") {
		source = source.parentElement;
	}
	source = source.parentElement;
	cs = source.children;
	// alert(cs.length);
	if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc" && cs[1].style.backgroundColor != clickcolor) {
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = highlightcolor;
		}
	}
}
function changeback() {
	if (event.fromElement.contains(event.toElement) || source.contains(event.toElement) || source.id == "nc") {
		return;
	}
	if (event.toElement != source && cs[1].style.backgroundColor != clickcolor) {
		// source.style.backgroundColor=originalcolor
	}
	for (i = 0; i < cs.length; i++) {
		cs[i].style.backgroundColor = "";
	}
}
function clickto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE") {
		return;
	}
	while (source.tagName != "TD") {
		source = source.parentElement;
	}
	source = source.parentElement;
	cs = source.children;
	// alert(cs.length);
	if (cs[1].style.backgroundColor != clickcolor && source.id != "nc") {
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = clickcolor;
		}
	} else {
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = "";
		}
	}
}

// JQuery选择

// 全选、取消全选
function SelectAllRows() {
	var check_obj = $("input[name='objId']");
	var checkAll = $("input[name='checkedAll']");
	if (checkAll.attr("checked") == true) {
		for (var i = 0; i < check_obj.length; i++) {
			check_obj.get(i).checked = true;
		}
	} else {
		for (var i = 0; i < check_obj.length; i++) {
			check_obj.get(i).checked = false;
		}
	}
}

// 执行批量删除
function delBatch(userId, damain) {
	var checked_num = $("input[name='objId']:checked").length;
	if (checked_num == 0) {
		alert("\u81f3\u5c11\u9009\u62e9\u4e00\u9879");
		return;
	}
	var objIds = "";
	if (confirm("\u786e\u5b9a\u8981\u6279\u91cf\u5220\u9664?")) {
		var check_obj = $("input[name='objId']");
		for (var i = 0; i < check_obj.length; i++) {
			if (check_obj.get(i).checked == true) {
				objIds += check_obj.get(i).value + ",";
			}
		}
	}

	// 去掉最后的逗号
	objIds = objIds.substring(0, objIds.length - 1);
	$.ajax({type:"post", url:damain + "&objIds=" + objIds, success:function (msg) {

					// 刷新本页
		window.location.href = window.location.reload();
	}});
}

// 执行修改操作
function updateBatch(domain, objIdstr, width, height) {
	var checked_num = $("input[name='objId']:checked").length;
	if (checked_num == 0) {
		alert("\u8bf7\u9009\u62e9\u8981\u4fee\u6539\u7684\u8bb0\u5f55");
		return;
	}
	var check_obj = $("input[name='objId']:checked");
	if (check_obj.length > 1) {
		alert("\u8bf7\u9009\u62e9\u4e00\u6761\u8bb0\u5f55\u8fdb\u884c\u66f4\u65b0");
		return;
	} else {
		openWin(domain + "?" + objIdstr + "=" + check_obj.get(0).value, "update", width, height);

		// openWin('admin/menu/menu_update.jsp?menu_id='+check_obj.get(0).value,
		// 'add_menu', 800, 300);
	}
}
function openWin(f, n, w, h, s) {
	sb = s == "1" ? "1" : "0";
	l = (screen.width - w) / 2;
	t = (screen.height - h) / 2;
	sFeatures = "left=" + l + ",top=" + t + ",height=" + h + ",width=" + w + ",center=1,scrollbars=" + sb + ",status=0,directories=0,channelmode=0";
	openwin = window.open(f, n, sFeatures);
	if (!openwin.opener) {
		openwin.opener = self;
	}
	openwin.focus();
	return openwin;
}
/*******
 * 
 * 
 * @param {} url
 * @param {} confirmString
 * @return {Boolean}
 */
var isIe = (document.all) ? true : false;
//设置select的可见状态
function setSelectState(state) {
	var objl = document.getElementsByTagName("select");
	for (var i = 0; i < objl.length; i++) {
		objl[i].style.visibility = state;
	}
}
//弹出方法
function showDivBox() {
	var bWidth = parseInt(document.documentElement.scrollWidth);
	var bHeight = document.documentElement.clientHeight;
	if (isIe) {
		setSelectState("hidden");
	}
	var back = document.createElement("div");
	back.id = "back";
	var styleStr = "top:0px;left:0px;position:absolute;z-index:100;background:#666;width:" + bWidth + "px;height:" + bHeight + "px;";
	styleStr += (isIe) ? "filter:alpha(opacity=0);" : "opacity:0;";
	back.style.cssText = styleStr;
	document.body.appendChild(back);
	showBackground(back, 50);
	document.getElementById("divDisplay").style.display = "block";
}
//让背景渐渐变暗
function showBackground(obj, endInt) {
	if (isIe) {
		obj.filters.alpha.opacity += 1;
		if (obj.filters.alpha.opacity < endInt) {
			setTimeout(function () {
				showBackground(obj, endInt);
			}, 5);
		}
	} else {
		var al = parseFloat(obj.style.opacity);
		al += 0.01;
		obj.style.opacity = al;
		if (al < (endInt / 100)) {
			setTimeout(function () {
				showBackground(obj, endInt);
			}, 5);
		}
	}
}
/*
 * 打开删除窗口--此窗口出现后，其他的窗口就不能被激活
 */
function openDeleteDialog(url, confirmString) {
	var c = confirmString;
	if (c == null || c == "") {
		c = "\u4f60\u786e\u8ba4\u8981\u5220\u9664\u8bb0\u5f55\u5417\uff1f";
	}
	if (confirm(c)) {
		return window.location = url;
	}
	return false;
}
/*
 * 删除记录
 */
function del(url, info) {
	if (openDeleteDialog(url, info)) {
		window.location.reload(true);
	}
}
function closewindow() {
	if (window.opener) {
		// window.opener.location.reload(true);
		window.close();
	}
}

