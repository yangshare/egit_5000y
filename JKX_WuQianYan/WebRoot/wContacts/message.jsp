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
		
		.Ymessage_table td{
			padding:10px;
			
		}
		.Ymessage_table input{
			width:100%;
			
		}
		#mSubmit{
			height:30px;
			background-color: #F6F6F6;
			border:1px gray solid;
		}
		#mSubmit:hover{
			cursor: pointer;
			background-color: white;
		}
	</style>
	
  </head>
  
  <body>
    	<div class="Ymessage">
	    	<center>
	    		<table class="Ymessage_table">
	    			<tr><td><input id="mTitle" type="text" value="项目名称" onfocus="if(this.value=='项目名称')this.value='';"/></td></tr>
	    			<tr><td><input id="houseArea" type="text" value="面积" onfocus="if(this.value=='面积')this.value='';"/></td></tr>
	    			<tr><td><input id="contactName" type="text" value="联系人" onfocus="if(this.value=='联系人')this.value='';"/></td></tr>
	    			<tr><td><input id="contactPhone" type="text" value="联系电话" onfocus="if(this.value=='联系电话')this.value='';"/></td></tr>
	    			<tr><td><input id="houseType" type="text" value="喜欢风格" onfocus="if(this.value=='喜欢风格')this.value='';"/></td></tr>
	    			<tr>
		    			<td>
		    				<textarea id="messages" cols="100" rows="6" onfocus="if(this.value=='请留言')this.value='';">请留言</textarea>
		    			</td>
		    		</tr>
	    			<tr>
	    				<td colspan="2">
	    					<input id="mSubmit" type="button" value="提       交" onclick="doSubmit();"/>
	    				</td>
	    			</tr>
	    		</table>
	    	</center>
    	</div>
    	<input type="text" id="reqContent" value="Your message"
			onFocus="if(this.value=='Your message')this.value='';">
		<input type="text" id="reqName" value="Your name"
			onFocus="if(this.value=='Your name')this.value='';">
		<input type="button" name="submit" value="Cancel"
			onclick="doSubmit();">
		<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript">
	function doSubmit() {
		var mTitle = document.getElementById("mTitle").value;
		var houseArea = document.getElementById("houseArea").value;
		var contactName = document.getElementById("contactName").value;
		var contactPhone = document.getElementById("contactPhone").value;
		var houseType = document.getElementById("houseType").value;
		var messages = document.getElementById("messages").value;
		// alert("d"); 
		var URL = 'wMessage_Insert?mTitle=' + mTitle + '&houseArea=' + houseArea
		+ '&contactName=' + contactName+ '&contactPhone=' + contactPhone
		+ '&houseType=' + houseType+ '&messages=' + messages;
		$.ajax({//获取数据库地理位置
				
		         type:"post",
		         url:URL,//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名		        
		         dataType:"json",//设置需要返回的数据类型
		         success:function(json){
			if (json != null || json !="") {
				alert(json['json']);
		          } else {
			    alert("网络等原因导致提交失败！");
		}
	}}	);

	}
	
	function displayLocation(data)//处理从strust获取的数据并处理显示再网页
{ 
	var id = data.typeName;
	var location=data.location;
    alert(id);
}
</script>
  </body>
</html>
