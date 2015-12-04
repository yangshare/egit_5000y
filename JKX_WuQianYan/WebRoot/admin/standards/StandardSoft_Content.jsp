<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jkx.web.Impl.Web_Standard_Pic_Impl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
  int id = Integer.parseInt(request.getParameter("id")); 
  Web_Standard_Pic_Impl standardPicImpl=new Web_Standard_Pic_Impl();
  ArrayList<Web_Standard_Pic_Impl> Alist = new Web_AllImpl_DoAll(standardPicImpl).QueryById("w_standard_pic",id);
  standardPicImpl=Alist.get(0);
  pageContext.setAttribute("standardContent",standardPicImpl.getStandardContent());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>菜单信息列表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>admin/css/tab.css" />
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/tab.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/jquery-1.4.js"></script>
		
	</head>
	<body>
		${standardContent}
	</body>
</html>