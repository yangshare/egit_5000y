<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jkx.web.Impl.Web_User_Impl"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    String realpath=basePath+"admin/main.jsp"; 
    
    
    if(request.getParameter("error")!=null){
      out.print("<script>alert('您输入的账号或者密码不正确！');</script>");
    }
    if(request.getParameter("cheack")!=null){
      out.print("<script>alert('请先登录！');</script>");
    }
    
    
    String name=null,pwd=null;
    if(request.getParameter("username")!=null){ 
       name=new String(request.getParameter("username").getBytes("iso8859-1"),"utf-8");
       pwd=new String(request.getParameter("password").getBytes("iso8859-1"),"utf-8");
     //  System.out.println(name+"======="+pwd);
       Web_User_Impl user=new Web_User_Impl();
       ArrayList<Web_User_Impl> result =new Web_AllImpl_DoAll(user).QueryAll("w_user");
       for(Web_User_Impl us : result){
      // System.out.println(name+"......"+us.getUserName());
         if(us.getUserName().equals(name)){
             if(us.getPassWord().equals(pwd)){
             session.setAttribute("login","已认证");
             session.setAttribute("user",name);
             session.setAttribute("pwd",pwd);
             session.setAttribute("id",us.getId());
             response.sendRedirect(realpath);
              return;
             }
         }
      } 
      response.sendRedirect(basePath+"admin/index.jsp?error=false");
   } 
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>五千言管理平台</title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
}

.STYLE3 {
	color: #528311;
	font-size: 12px;
}

.STYLE4 {
	color: #42870a;
	font-size: 12px;
}
-->
</style>
<script type="text/javascript" src="javascript/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
  function login(){
  	var form=document.getElementById("form");
  	form.submit();		
  }
</script>
	</head>

	<body>
	
<form id="form" action="" method="post">

		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td bgcolor="#e5f6cf">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td height="608" background="images/login_03.gif">
					<table width="862" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="266"
								background="images/login_04.gif">
								&nbsp;
							</td>
						</tr>
						<tr style="background-color: rgb(255, 255, 255);">
							<td height="95">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="424" height="95"
											background="images/login_06.gif">
											&nbsp;
										</td>
										<td width="183"
											background="images/login_07.gif">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="21%" height="30">
														<div align="center">
															<span class="STYLE3">用户</span>
														</div>
													</td>
													<td width="79%" height="30">
														<input type="text" id="username" name="username" 
															style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;" />
													<input id="name_check" type="hidden" value="${userInfo.username}"/>
													
													</td>
												</tr>
												<tr>
													<td height="30">
														<div align="center">
															<span class="STYLE3">密码</span>
														</div>
													</td>
													<td height="30">
														<input type="password" id="password" name="password"
															style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;" />
														<input id="pwd_check" type="hidden" value="${userInfo.userpwd}"/>
													</td>
												</tr>
												<tr>
													<td height="30">
														&nbsp;
													</td>
													<map name="Map">
														<area shape=rect coords="0,0,40,20" href="####"
															onclick="login()">
														<area shape=rect coords="40,0,80,20" href="#">
													</map>
													<td height="30">
														<img src="images/dl.gif" width="81"
															height="22" border="0" usemap="#Map">
													</td>
												</tr>
											</table>
										</td>
										<td width="255"
											background="images/login_08.gif">
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="247" valign="top"
								background="images/login_09.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="22%" height="30">
											&nbsp;
										</td>
										<td width="56%">
											&nbsp;
										</td>
										<td width="22%">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td>
											&nbsp;
										</td>
										<td height="30">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="44%" height="20">
														&nbsp;
													</td>
													<td width="56%" class="STYLE4">
														版本 2008V1.0
													</td>
												</tr>
											</table>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td bgcolor="#a2d962">
					&nbsp;
				</td>
			</tr>
		</table>
		<map name="Map">
			<area shape="rect" coords="3,3,36,19" href="#">
			<area shape="rect" coords="40,3,78,18" href="#">
		</map>
		</form>
	</body>
</html>