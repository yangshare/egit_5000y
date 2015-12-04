<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<!-- 去掉浏览器默认css -->
	<style type="text/css">
		html,body,p,th,td,input,select,textarea,button,div {padding:0; margin:0;font-family: "microsoft yahei",Tahoma, sans-serif ; font-size:12px; line-height:180%;}
		html,body{background:white;}
		dl,ol,dt,dd,ul,li,form,h1,h2,h3,h4,h5,h6 {margin:0; padding:0;list-style:none; }
		input,select,textarea,button{vertical-align:middle;resize:none;}
		.clear{clear:both;}
		img{border:0; vertical-align:middle}
		.float{float:left;};
	</style> 
	<link rel="stylesheet" type="text/css" href="css/wIndex/wIndex.css">
	<link rel="stylesheet" type="text/css" href="css/wIndex/layout.css" />
	<link rel="stylesheet" type="text/css" href="css/wIndex/style.css" />
	<script language="javascript" type="text/javascript" src="js/wIndex/mootools.js"></script>
	<script language="javascript" type="text/javascript" src="js/wIndex/script.js"></script>
  </head>
  
  <body>
  
  	<div class="Yindex">
  		
  		<div id="container">
			
       		<br/>
            <p>
                <strong style="color:#bbb;"> ↓↓点击下面的图片翻看↓↓</strong> 
             
            </p>       
		<!------------------------------------- THE CONTENT ------------------------------------------------->
		<div id="lof-cordion-1" class="lof-cordion">
			<div class="lof-cordion-wapper">
		    	<ul>
		
		        	<li>
		            	<div class="lof-shadow"></div>
		            	<img src="img/wIndex/DSC_0031gai.jpg" />
		                 <div class="lof-description">
		                	<h4>婚纱店</h4>
		                    <p>Professional interior design</p>
		                </div>
		           </li>
		
				
		           
		            <li>
		            	<div class="lof-shadow"></div>
		                <img src="img/wIndex/IMG_8580.JPG" />
		                <div class="lof-description">
		                	<h4>凯旋门15-4503</h4>
		                	 <p>Professional interior design</p>    
		                </div>
		      </li>
		
		            <li>
		            	<div class="lof-shadow"></div>
		                <img src="img/wIndex/IMG_8524.JPG" />
		                 <div class="lof-description">
		                	<h4>新地中心C-1004</h4>
		                     <p>Professional interior design</p>
		                </div>
		                </li>
		
		            <li><div class="lof-shadow"></div><img src="img/wIndex/img_8721.jpg" />
		             	<div class="lof-description">
		                	<h4>新地中心C-1701</h4>
		                     <p>Professional interior design</p>
		                </div>
		            </li>
		        </ul>
			</div>
		
		    <div class="lof-bottom"></div>
		 </div>   
		
		<!------------------------------------- END OF THE CONTENT ------------------------------------------------->
		<script type="text/javascript">
			new LofmCordion( {wapperSelector: $E('#lof-cordion-1 .lof-cordion-wapper') } );
		</script>
		

  	</div>
  	
  	
  	</div>
 
  </body>
</html>
