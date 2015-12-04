<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
	<head>
		<title>成功添加记录页面</title>
		<script type="text/javascript">
      function closeWindow()
      {
         if(window.opener)
         {
           window.opener.location.reload(true);
           window.close();
         }
      }
      
      function clock()
      {
        i=i-1;
        
        if(document.getElementById("info"))
        {
           document.getElementById("info").innerHTML="<font size=3>恭喜您，更新成功！本窗口将在<span style=color:red>"+i+"秒</span>后自动关闭！</font>"
        }
        
        if(i>0)
        {
           setTimeout("clock();",1000);
        }
        else
        {
            closeWindow();
        }
      }
       var i=4;
       clock();
    </script>
		<style type="text/css">
body {
	font: normal 13px;
	background-color: #D6F1B4;
}
</style>
	</head>
	<body bgcolor="#DADAFE">
		<center>
			<img src="<%=basePath%>admin/images/success.gif">
			
			<div id="info">
				<font size=3>恭喜您，更新成功！本窗口将在<span style="color: red">3秒</span>后自动关闭</font>
			</div>
			<br>
			<br />
			<input type="button" value="关闭窗口" onclick="closeWindow();">
		</center>
	</body>
</html>
