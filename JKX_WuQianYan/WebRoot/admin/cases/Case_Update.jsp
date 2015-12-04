<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jkx.web.Impl.Web_Case_Types_Impl"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
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
  if(request.getParameter("update")!=null){
   if(request.getParameter("update").equals("false")){
   out.print("<script>alert('案例更新失败！');</script>");
  }
  }
  int id = Integer.parseInt(request.getParameter("id")); 
  Web_Case_Types_Impl typesImpl=new Web_Case_Types_Impl();
  ArrayList<Web_Case_Types_Impl> Alist = new Web_AllImpl_DoAll(typesImpl).QueryById("w_case_types",id);
  typesImpl=Alist.get(0);

  
   ArrayList<Web_Case_Types_Impl> ALLlist = new Web_AllImpl_DoAll(typesImpl).QueryAll("w_case_types");
   List<String> typelist = new ArrayList<String>();
   typelist.add(0,"\""+typesImpl.getTypeName()+"\"");
  
   for(Web_Case_Types_Impl impl : ALLlist){
    boolean a=true;
      for(String typename : typelist){
       if(("\""+impl.getTypeName()+"\"").equals(typename)){
         a=false;break;
       }
      }
      if(a){
      typelist.add("\""+impl.getTypeName()+"\"");
      }
   }
   %>
  <body> 
    <form  method="post" id="form2">
 
    <table  align="center" style="margin-top: 2px;" class="co12"
    cellspacing="1" bgcolor="#a8c7ce" width="99%" height="99%">
    
    <tr bgcolor="#f9f6fd">
    <td style="height:14px; text-align:center; font-size:13px; background:#c2e990"> 
    [更新案例]
    </td>   
    </tr>
    
   <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
           案例名：
   <input type="text" id="caseName" name="caseName" class="input_01" value="<%=typesImpl.getCaseName() %>"/>
   </td>
   </tr>
    
    <tr bgcolor="#eef9e1">
   <td height="15 class="css_td">
    &nbsp;案例类型：
   
               <select id="typeName"> </select>    
               <input type="button" onclick="javascript:showt();" value="自定义类型">
               <input id="typeText" type="hidden" maxlength="11" size="11" value="">
   
   <!--
   <input type="radio" name="radio" id="typeName1" 
   <c:if test="${caseType eq '浪漫系列'}"> 
   checked="checked"</c:if> value="浪漫系列">浪漫系列
   
    <input type="radio" name="radio" id="typeName2" 
    <c:if test="${caseType eq '唯美系列'}"> 
   checked="checked"</c:if> value="唯美系列"/>唯美系列
   
   <input type="radio" name="radio" id="typeName3" 
    <c:if test="${caseType eq '普通系列'}"> 
   checked="checked" </c:if> value="普通系列"/>普通系列
   -->
   </td>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
        封面图片路径：
 
<input type="file" border="0" id="myFile" name="myFile" value="选择" size="5" onchange="javascript:mit();">
 <input type="hidden" name="caseImg" value="<%=typesImpl.getCaseImg()%>">
  </td>
  <center>
 <img src="<%=basePath%>/admin/images/loading.gif"  id="loading" style="display: none;">
 </center>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="60" class="css_td">
       案例内容：
   <br/><br/><textarea name="content" id="textarea" class="input_01"><%=typesImpl.getCaseContent() %></textarea>  
   </td>
   </tr>
   <input  type="hidden" id="caseContent" name="caseContent" value=""/>
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
   
     var mySelect = document.getElementById("typeName");
     for(var i in <%=typelist%>){
      var opp = new Option(<%=typelist%>[i],<%=typelist%>[i]);
      mySelect.add(opp);
     }
    }
    
    function showt(){
      document.getElementById("typeText").type="text";
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
     var bool=false;
   
    if(document.getElementById("typeText").value!=""){
       bool=true;
       document.getElementById("typeText").name="typeName";
    } else{
       bool=true;
       document.getElementById("typeName").name="typeName";
    }
        
       var caseContent= editor.getData();
       document.getElementById("caseContent").value= editor.getData();
       var caseName=document.getElementById("caseName").value;
       if(bool==true){
            if(caseName!="" &&  caseContent!=undefined){
              document.getElementById("form2").action="wCase_update?id=<%=typesImpl.getId()%>"
              document.getElementById("form2").enctype="application/x-www-form-urlencoded";
		 	  document.getElementById("form2").submit();
		     }else{
		     alert('案例名不能为空！');
		         }
		}else{
		     alert('请选择或填写案例类型！');
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
