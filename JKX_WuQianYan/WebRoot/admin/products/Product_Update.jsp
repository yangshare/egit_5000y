<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%@page import="com.jkx.web.Impl.Web_Product_Impl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
   out.print("<script>alert('产品更新失败！');</script>");
  }
  }
  int id = Integer.parseInt(request.getParameter("id")); 
  Web_Product_Impl productImpl=new Web_Product_Impl();
  ArrayList<Web_Product_Impl> Alist = new Web_AllImpl_DoAll(productImpl).QueryById("w_product",id);
  productImpl=Alist.get(0);

  ArrayList<Web_Product_Impl> ALLlist = new Web_AllImpl_DoAll(productImpl).QueryAll("w_product");
   List<String> typelist = new ArrayList<String>();
   typelist.add(0,"\""+productImpl.getProductType()+"\"");
  
   for(Web_Product_Impl impl : ALLlist){
    boolean a=true;
      for(String typename : typelist){
       if(("\""+impl.getProductType()+"\"").equals(typename)){
         a=false;break;
       }
      }
      if(a){
      typelist.add("\""+impl.getProductType()+"\"");
      }
   }
   %>
  <body> 
    <form action="" method="post" id="form2">
 
    <table  align="center" style="margin-top: 2px;" class="co12"
    cellspacing="1" bgcolor="#a8c7ce" width="99%" height="99%">
    
    <tr bgcolor="#f9f6fd">
    <td style="height:14px; text-align:center; font-size:13px; background:#c2e990"> 
    [更新产品]
    </td>   
    </tr>
    
   <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
           产品名：
   <input type="text" id="productName" name="productName" class="input_01" value="<%=productImpl.getProductName()%>"/>
   </td>
   </tr>
    
    <tr bgcolor="#eef9e1">
   <td height="15 class="css_td">
    &nbsp;产品类型：
    
      <select id="typeName"> </select>    
               <input type="button" onclick="javascript:showt();" value="自定义类型">
               <input id="typeText" type="hidden" maxlength="11" size="11" value="">
               
   </td>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="15" class="css_td">
        封面图片路径：
   
  <input type="file" border="0" id="myFile" name="myFile" value="选择" size="5" onchange="javascript:mit();">
 <input type="hidden" name="productImg" value="<%=productImpl.getProductImg()%>">
  </td>
  <center>
 <img src="<%=basePath%>/admin/images/loading.gif"  id="loading" style="display: none;">
 </center>
   </tr>
   
    <tr bgcolor="#eef9e1">
   <td height="60" class="css_td">
       案例内容：
   <br/><br/><textarea name="content" id="textarea" class="input_01"><%=productImpl.getProductText()%></textarea>  
   </td>
   </tr>
    <input  type="hidden" id="productContent" name="productContent" value=""/>
   <tr bgcolor="#eef9e1" height="45">
   <td height="30" class="css_td">
   <center>
   <input type="button" value="确定" onclick="javascript:submi();"/>&nbsp;&nbsp;&nbsp;
   <input type="button" value="关闭" onclick="javascript:window.close();"/>
   <script type="text/javascript" src="<%=basePath%>admin/javascript/ajaxfileupload.js"></script>
   <script type="text/javascript">
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
       document.getElementById("typeText").name="productType";
    } else{
       bool=true;
       document.getElementById("typeName").name="productType";
    }
      
       var caseContent= editor.getData();
       document.getElementById("productContent").value= editor.getData();
       var caseName=document.getElementById("productName").value;
       
       if(bool==true){
            if(caseName!="" &&  caseContent!=undefined){
              document.getElementById("form2").action="wProduct_update?id=<%=productImpl.getId()%>";
              document.getElementById("form2").enctype="application/x-www-form-urlencoded";
		 	  document.getElementById("form2").submit();
		     }else{
		     alert('产品名不能为空！');
		         }
		}else{
		     alert('请选择或填写产品类型！');
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
