<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%@page import="com.jkx.web.Impl.Web_Standard_Impl"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="<%=basePath%>admin/javascript/jquery-1.8.0.min.js"></script> 
	<script type="text/javascript" src="<%=basePath%>/ckeditor/ckeditor.js"></script>  
    <script type="text/javascript" src="<%=basePath%>/ckeditor/config.js"></script>  
    <script type="text/javascript">
	    $(document).ready(function(){  
	    	CKEDITOR.replace('myckeditor'); 
	    });  
    </script>
<link rel="stylesheet" type="text/css"
			href="<%=basePath%>admin/css/tab.css" />
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/tab.js"></script>
			
		<style type="text/css">
.input_01 {
	border-bottom-color: #6D6D6D;
	border-bottom-width: 1px;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px; solid #ff6633;
	color: #000000;
	FONT-SIZE: 9pt;
	FONT-STYLE: normal;
	FONT-VARIANT: normal;
	FONT-WEIGHT: normal;
	HEIGHT: 18px;
	background: #EEF9E1;
	LINE-HEIGHT: normal;
	padding-left: 5px;
	width: 200px;
}

.css_td {
	padding-left: 10px;
}

</style>
  <% 
   if(request.getParameter("insert")!=null){
   if(request.getParameter("insert").equals("false")){
   out.print("<script>alert('硬装设计制图标准更新失败！');</script>");
  } 
  if(request.getParameter("insert").equals("true")){
   out.print("<script>alert('硬装设计制图标准更新成功！');</script>");
  }
  }
   int id=1;
   Web_Standard_Impl standardImpl=new Web_Standard_Impl();
   ArrayList<Web_Standard_Impl> Alist = new Web_AllImpl_DoAll(standardImpl).QueryById("w_standard",id);
  standardImpl=Alist.get(0);
  pageContext.setAttribute("introduce",standardImpl.getStandardIntroduce());
   %>
  <body>
 <center><h5>[<%=standardImpl.getStandardType()%>]</h5></center>
 
  <form action="" method="post" id="form2">
  名称：
   <input type="text" id="standardType" name="standardType"  value="<%=standardImpl.getStandardType()%>"/>
   <br><br>
  
     顶部图片路径：
<input type="file" border="0" id="myFile" name="myFile" value="选择" size="5" onchange="javascript:mit();">
 <br/><center>
 <img src="<%=basePath%>/admin/images/loading.gif"  id="loading" style="display: none;">
 </center>
  <input type="hidden" name="standardImg" value="<%=standardImpl.getStandardImg()%>">
  <br><br>
  内容：<br>
   <textarea name="content" id="textarea" class="input_01">${introduce}</textarea>
   <input  type="hidden" id="StandardContent" name="StandardContent" value=""/>
    <center>
    <input type="button" value="确定" onclick="javascript:submi();"/>&nbsp;&nbsp;&nbsp;
   <input type="button" value="关闭" onclick="javascript:closethis();"/>
   </center>
   </form>
   <script type="text/javascript" src="<%=basePath%>admin/javascript/ajaxfileupload.js"></script>
    <script type="text/javascript" defer=true>
    var editor = null;
    function closethis(){
      window.location.href="<%=basePath%>admin/system.jsp";
    }
    
    window.onload = function(){
     editor = CKEDITOR.replace('content'); //参数‘content’是textarea元素的name属性值，而非id属性值
    }
    
      function mit() {
		
		$("#loading").ajaxStart(function () {$(this).show();})
		             .ajaxComplete(function () { $(this).hide();}); 
		
		//ajax上传图片
		$.ajaxFileUpload({
	       url: 'UpLoad_execut',
	       secureuri: false,
	       fileElementId:'myFile',
	       dataType:'json',
	       success:function(json){
			  if (json != null || json !="") {
				$("#loading").css("display","none");
				alert(json["json"]);
		      } else {
			   alert("由于网络等原因，请求未提交！");
		          }
	         }
     	  });
		}     
           
     function submi(){
   
       var caseContent= editor.getData();
       document.getElementById("StandardContent").value= editor.getData();
            if(caseContent!=undefined){
              document.getElementById("form2").action="wStandard_StandardUpdate?id=<%=standardImpl.getId()%>";
		 	  document.getElementById("form2").enctype="application/x-www-form-urlencoded";
		 	  document.getElementById("form2").submit();
		     }else{
		     alert('内容不能为空！');
		         }
       }
   </script>
  </body>
</html>
