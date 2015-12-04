<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/dtree.js"></script>
		<link rel="StyleSheet" href="<%=basePath%>admin/css/dtree.css"
			type="text/css" />
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE2 {
	color: #43860c;
	font-size: 12px;
}

a:link {
	font-size: 12px;
	text-decoration: none;
	color: #43860c;
}

a:visited {
	font-size: 12px;
	text-decoration: none;
	color: #43860c;
}

a:hover {
	font-size: 12px;
	text-decoration: none;
	color: #FF0000;
}
-->
</style>
</head>
	<body>
		<div class="dtree">
			<a href="javascript: d.openAll();">open all</a> |
			<a href="javascript: d.closeAll();">close all</a>
			<script type="text/javascript">
				d = new dTree('d');
				d.add(0, -1, '后台管理');
				d.add(1, 0, '案例模块管理', '');
				d.add(2, 1, '案例列表', 'cases/Case_List.jsp', '', 'I1');
				d.add(3, 0, '产品配套管理', '');
				d.add(4, 3, '产品列表', 'products/Product_List.jsp', '', 'I1');
				d.add(6, 0, '关于模块管理', '', 'I1');
				d.add(7, 6, '关于我们', 'abouts/About_Company.jsp', '', 'I1');
				d.add(8, 6, '公司动态', 'abouts/About_News_List.jsp', '', 'I1');
				d.add(9, 6, '招贤纳士', 'abouts/About_Hire_List.jsp', '', 'I1');
				d.add(10, 6, '设计团队', 'abouts/About_Us_List.jsp', '', 'I1');
				d.add(11, 0, '施工标准管理');
				d.add(12, 11, '硬装设计制图标准', 'standards/Standard_HardDisn.jsp', '', 'I1');
				d.add(13, 11, '施工标准工艺', 'standards/Standard_ConstructionProcess.jsp', '', 'I1');
				d.add(14, 11, '手绘制图和软装设计', 'standards/StandardSoft_List.jsp', '', 'I1');
				d.add(15, 0, '账号管理');
				d.add(16, 15, '修改管理员密码', 'user_update.jsp', '', 'I1');
				d.add(17, 15, '添加管理员账号', 'user_insert.jsp', '', 'I1');
				d.add(18, 15, '删除管理员账号', 'user_delete.jsp', '', 'I1');
				d.add(19, 15, '查看用户留言', 'user_reply_List.jsp', '', 'I1');
				document.write(d);
				//-->
			</script>
		</div>
	</body>

</html>