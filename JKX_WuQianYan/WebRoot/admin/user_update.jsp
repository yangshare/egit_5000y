<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>菜单信息列表</title>
		<link rel="stylesheet" type="text/css"
			href="css/tab.css" />
			<script type="text/javascript"
			src="javascript/jquery-1.8.0.min.js"></script>
		<script type="text/javascript"
			src="javascript/tab.js"></script>
	     	<script type="text/javascript"
			src="javascript/user.js"></script>
	</head>
	<body>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15" height="30">
								<img src="<%=basePath%>admin/images/tab_03.gif" width="15"
									height="30" />
							</td>
							<td width="1101" align="center"
								background="<%=basePath%>admin/images/tab_05.gif">
								<span class="STYLE4">账号信息</span>
							</td>
							<td width="14">
								<img src="<%=basePath%>admin/images/tab_07.gif" width="14"
									height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="9" background="<%=basePath%>admin/images/tab_12.gif">
								&nbsp;
							</td>
							<td bgcolor="#f3ffe3">

							<form action="." method="post">
								<table width="99%" border="0" align="center" cellpadding="0"
									cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td height="30" width="20%" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;我的账号：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div id="Yuser_name" class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;${user}
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;账号密码：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div id="Yuser_pwd" class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;${pwd }
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" width="20%" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												<input id="Yuser_submit" type="button" value="编辑"/>
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div class="STYLE2 STYLE1">
												<input id="reset" onclick="a();" type="button" value="重置" style="display: none;"/>
											    <input type="hidden" value="${id}" id="id"/>
											<script  type="text/javascript">
											 function a(){
											$("#Yuser_name").html("<input type='text' value=''>");
			                                $("#Yuser_pwd").html("<input type='text' value=''>");
											 }
											</script>
											</div>
										</td>
									</tr>
									
								</table>
								</form>
							</td>
							<td width="9" background="<%=basePath%>admin/images/tab_16.gif">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="29">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15" height="29">
								<img src="<%=basePath%>admin/images/tab_20.gif" width="15"
									height="29" />
							</td>
							<td background="<%=basePath%>admin/images/tab_21.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="25%" height="29" nowrap="nowrap">
											&nbsp;
										</td>
										<td width="75%" valign="top" class="STYLE1">
											<div align="right">
												<table width="352" height="20" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td height="22" valign="middle" colspan="10">
															<div align="right">
																&nbsp;
															</div>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td width="14">
								<img src="<%=basePath%>admin/images/tab_22.gif" width="14"
									height="29" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>	
	</body>
</html>