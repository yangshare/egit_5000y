<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>五千言设计机构|五千言装饰_合肥装修公司_合肥装潢公司_合肥别墅装修_合肥装饰公司_合肥高端设计_合肥工装设计</title>
	<link rel="shortcut icon" href="img/icons/logo1.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="五千言,装饰公司,设计装潢">
	<meta name="description" content="五千言设计机构|五千言装饰_合肥装修公司_合肥装潢公司_合肥别墅装修_合肥装饰公司_合肥高端设计_合肥工装设计">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
		
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 去掉浏览器默认css -->
	<style type="text/css">
		html,body,p,th,td,input,select,textarea,button,div {padding:0; margin:0;font-family: "microsoft yahei",Tahoma, sans-serif ; font-size:12px; line-height:180%;}		
		dl,ol,dt,dd,ul,li,form,h1,h2,h3,h4,h5,h6 {margin:0; padding:0;list-style:none; }
		input,select,textarea,button{vertical-align:middle;resize:none;}
		.clear{clear:both;}
		img{border:0; vertical-align:middle}
		.float{float:left;}
	</style>
	<link rel="stylesheet" type="text/css" href="wContacts/wContacts.css">
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/wContacts/wContacts.js"></script>
  </head>
  
  <body>
  <!-- header --> 
	<iframe name="iframe_header" src="header.jsp" height="100%" width="100%" frameborder="0" scrolling="auto"  onload="javascript:this.height=0;this.height=Math.max(this.contentWindow.document.body.scrollHeight, contentWindow.document.documentElement.scrollHeight);"></iframe>
<!-- END header -->
	<div class="YcontactsBody">
  	<div style="margin:10px;margin-left:150px;margin-top:20px;">
  		<img alt="contacts" src="img/wContacts/wContact.jpg">
  	</div>
     <div class="Yindex">
    	<ul>
    		
    	
    		<li class="Yleft">
    			<ul>
    				<li style="border-right-color:white;">
    					<a href="wContacts/contact.jsp" target="Ycontact_iframe">联系我们</a>
    				</li>
    				<li>
    					<a href="wContacts/message.jsp" target="Ycontact_iframe">在线留言</a>
    				</li>
    			</ul>
    		</li>
    		
    		
    		<li class="Yright">
    			<iframe name="Ycontact_iframe" src="wContacts/contact.jsp" height="100%" width="100%" frameborder="0" scrolling="auto" id="iframepage" onload="javascript:this.height=0;this.height=Math.max(this.contentWindow.document.body.scrollHeight, contentWindow.document.documentElement.scrollHeight);"></iframe>
    		</li>
    		
    	</ul>
    </div>
    </div>
    <div>
 <!-- footer -->	
	<iframe name="iframe_footer" src="footer.jsp" height="100%" width="100%" frameborder="0" scrolling="auto"  onload="javascript:this.height=0;this.height=Math.max(this.contentWindow.document.body.scrollHeight, contentWindow.document.documentElement.scrollHeight);"></iframe>
<!-- END footer -->
</div>
  </body>
</html>
