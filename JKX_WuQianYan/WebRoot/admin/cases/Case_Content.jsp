<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%@page import="com.jkx.web.Impl.Web_Case_Types_Impl"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
  int id = Integer.parseInt(request.getParameter("id")); 
  Web_Case_Types_Impl typesImpl=new Web_Case_Types_Impl();
  ArrayList<Web_Case_Types_Impl> Alist = new Web_AllImpl_DoAll(typesImpl).QueryById("w_case_types",id);
  typesImpl=Alist.get(0);
  pageContext.setAttribute("caseContent",typesImpl.getCaseContent());
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
		${caseContent}
	</body>
</html>