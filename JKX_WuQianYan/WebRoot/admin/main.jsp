<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理平台</title>
</head>

	
		<frameset rows="61,*,24" cols="*" framespacing="0" frameborder="no" border="0">
			<frame src="top.jsp" name="topFrame" scrolling="no"
				noresize="noresize" id="topFrame" />
			<frame src="center.jsp" name="mainFrame" id="mainFrame" />
			<frame src="down.html" name="bottomFrame" scrolling="no"
				noresize="noresize" id="bottomFrame" />
			<noframes>
				<body>
					Your browser does not handle frames!
				</body>
			</noframes>
		</frameset>

	

</html>