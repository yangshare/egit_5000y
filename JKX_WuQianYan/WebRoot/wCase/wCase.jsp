<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>五千言设计机构|五千言装饰_合肥装修公司_合肥装潢公司_合肥别墅装修_合肥装饰公司_合肥高端设计_合肥工装设计</title>
		<link rel="shortcut icon" href="img/icons/logo1.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="keywords" content="五千言,装饰公司,设计装潢">
		<meta name="description"
			content="五千言设计机构|五千言装饰_合肥装修公司_合肥装潢公司_合肥别墅装修_合肥装饰公司_合肥高端设计_合肥工装设计">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<!-- 去掉浏览器默认css -->
		<style type="text/css">
html,body,p,th,td,input,select,textarea,button,div {
	padding: 0;
	margin: 0;
	font-family: "microsoft yahei", Tahoma, sans-serif;
	font-size: 12px;
	line-height: 180%;
}

dl,ol,dt,dd,ul,li,form,h1,h2,h3,h4,h5,h6 {
	margin: 0;
	padding: 0;
	list-style: none;
}

input,select,textarea,button {
	vertical-align: middle;
	resize: none;
}

.clear {
	clear: both;
}

img {
	border: 0;
	vertical-align: middle
}

.float {
	float: left;
}
</style>
		<link rel="stylesheet" type="text/css" href="css/index_css.css">
	</head>

	<body>
		<!-- header -->
		<iframe name="iframe_header" src="header.jsp" height="100%"
			width="100%" frameborder="0" scrolling="auto"
			onload="javascript:this.height=0;this.height=Math.max(this.contentWindow.document.body.scrollHeight, contentWindow.document.documentElement.scrollHeight);"></iframe>
		<!-- END header -->
		<div>
			这是案例
		</div>

<input type="text" id="reqContent" value="Your message"
			onFocus="if(this.value=='Your message')this.value='';">
		<input type="text" id="reqName" value="Your name"
			onFocus="if(this.value=='Your name')this.value='';">
		<input type="button" name="submit" value="Cancel"
			onclick="doSubmit();">
		<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript">
	/*function doSubmit() {
		var info = document.getElementById("reqContent").value;
		var name = document.getElementById("reqName").value;
		// alert("d"); 
		var URL = 'wCase_Case_getType?info=' + info + '&name=' + name;
		$.ajax({//获取数据库地理位置
				
		         type:"post",
		         url:URL,//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名		        
		         dataType:"text",//设置需要返回的数据类型
		         success:function(json){
			if (json != null || json !="") {
				alert(json);
		} else {
			alert("温馨提示：Json未提交！");
		}
	}}	);

	}*/
	
	function displayLocation(data)//处理从strust获取的数据并处理显示再网页
{ 
	var id = data.typeName;
	var location=data.location;
    alert(id);
}

function doSubmit(){
var info = document.getElementById("reqContent").value;
		var name = document.getElementById("reqName").value;
 $.ajax({
		  		
                url:'wCase_Case_getType?info=' + info + '&name=' + name,
                dataType: 'text',
                
                success:function(json){
					alert(json);
					/*for(var i=0;i<json.){
						}
                 	$(".Case_DaoHang");*/
                },
               error:function(json){
				  
                    alert("维护中，请稍后访问！");
                }
            });
}            

</script>

		<!-- footer -->
		<iframe name="iframe_footer" src="footer.jsp" height="100%"
			width="100%" frameborder="0" scrolling="auto"
			onload="javascript:this.height=0;this.height=Math.max(this.contentWindow.document.body.scrollHeight, contentWindow.document.documentElement.scrollHeight);"></iframe>
		<!-- END footer -->
	</body>
</html>
