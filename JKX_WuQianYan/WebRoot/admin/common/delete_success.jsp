<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String main=(String)request.getParameter("main"); %>
	<head>
		<title>删除数据成功</title>
		<script type="text/javascript">
      function closewindow()
      {
      // window.returnValue=true;
        window.location.href="<%=basePath%>admin/<%=main%>_List.jsp";
      }
      
      function clock()
      {
        i = i -1;
        if(document.getElementById("info"))
        {
           document.getElementById("info").innerHTML="本窗口将在"+i+"秒后自动关闭"
        }
        if(i>0)
        {
           setTimeout("clock();",1000);
        }
        else
        {
           closewindow();
        }
      }
      var i=4;
      clock();
    </script>
		<style type="text/css">
body {

	font:normal 13px;
	
	background-color: #D6F1B4;
	
}
</style>
	</head>
	<body>
		<center>
		<p>&nbsp;</p>
			删除数据成功！
			
			<div id="info">
				本窗口将在3秒后自动关闭
			</div>
			<br/>
			<input type="button" value="关闭窗口" onclick="closewindow();">
		</center>
	</body>
</html>