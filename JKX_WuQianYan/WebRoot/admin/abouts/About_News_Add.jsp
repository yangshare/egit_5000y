<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%@page import="com.jkx.web.Impl.Web_About_News_Impl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

  </head>
  <%
  if(request.getParameter("insert")!=null){
    if(request.getParameter("insert").equals("false")){
    out.print("<script>alert('新增新闻失败！');</script>");
    }
    if(request.getParameter("insert").equals("rename")){
    out.print("<script>alert('新闻标题重名，请重命名！');</script>");
    }
  }
   %>
  <body> 
    <form  method="post" id="form2">
 
    <table  align="center" style="margin-top: 2px;" class="co12"
    cellspacing="1" bgcolor="#a8c7ce" width="99%" height="99%">
    
    <tr bgcolor="#f9f6fd">
    <td style="height:14px; text-align:center; font-size:13px; background:#c2e990"> 
    [新增新闻]
    </td>   
    </tr>
    
   <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
           新闻标题：
   <input type="text" id="newsName" name="newsName" class="input_01" value=""/>
   </td>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="15 class="css_td">
        &nbsp;新闻时间：
   <input type="text" id="newsTime" name="newsTime" class="input_01" value=""/>
   </td>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="15 class="css_td">
        &nbsp;新闻点击量：
   <input type="text" id="newsClicks" name="newsClicks" class="input_01" value="0" readonly="readonly"/>
   </td>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
        封面图片路径：
  <input type="file" border="0" id="myFile" name="myFile" value="选择" size="5" onchange="javascript:mit();">
 <br/><center>
 <img src="<%=basePath%>/admin/images/loading.gif"  id="loading" style="display: none;">
 </center>
  </td>
   </tr>
   
   <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
        新闻简介：
   <input type="text" id="newsExplain" name="newsExplain"  value="" size="50" maxlength="50"/>
   </td>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="60" class="css_td">
       新闻内容：
   <br/><br/><textarea name="content" id="textarea" class="input_01"></textarea>  
   </td>
   </tr>
   <input  type="hidden" id="newsContent" name="newsContent" value=""/>
   <tr bgcolor="#eef9e1" height="45">
   <td height="30" class="css_td">
   <center>
   <input type="button" value="确定" onclick="javascript:submi();"/>&nbsp;&nbsp;&nbsp;
   <input type="button" value="关闭" onclick="javascript:window.close();"/>
   <script type="text/javascript" src="<%=basePath%>admin/javascript/ajaxfileupload.js"></script>
   <script type="text/javascript" defer=true>
    var editor = null;
    
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
     
       var newsContent= editor.getData();
       document.getElementById("newsContent").value= editor.getData();
       var newsName=document.getElementById("newsName").value;
       var newsTime=document.getElementById("newsTime").value;
       var newsClicks=document.getElementById("newsClicks").value;
       var newsExplain=document.getElementById("newsExplain").value;
            if(newsName==""){
              alert('新闻标题不能为空！');
		     }
		     if(newsTime==""){
              alert('新闻时间不能为空！');
		     }
		      if(newsClicks==""){
              alert('新闻点击量不能为空！');
		     }
		      if(newsContent==""){
              alert('新闻内容不能为空！');
		     }
		      if(newsExplain==""){
		      alert('新闻简介不能为空！');
		      }
		     else{
		      document.getElementById("form2").action="wAbout_NewsInsert"
              document.getElementById("form2").enctype="application/x-www-form-urlencoded";
		 	  document.getElementById("form2").submit();
		     }
      }    
 
   </script>
   </center>
   </td>
   
   </tr>
   
    </table>
   
    </form>
  </body>
</html>
