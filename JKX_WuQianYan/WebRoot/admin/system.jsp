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
			href="<%=basePath%>admin/css/tab.css" />
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/tab.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/jquery-1.4.js"></script>
		
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
								<span class="STYLE4">系统信息</span>
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
								<table width="99%" border="0" align="center" cellpadding="0"
									cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td height="30" width="20%" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;服务器名：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;iZ25zzn4w3xZ
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;服务器IP：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;123.57.157.88
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" width="20%" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;服务器端口：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;8080
											</div>
										</td>
									</tr>
									<tr>
										<td height="30" bgcolor="#FFFFFF" class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;Tomcat版本：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;Tomcat7
											</div>
										</td>
									</tr>
									<tr >
										<td height="30" bgcolor="#FFFFFF"  class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;服务器CPU个数：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF" >
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;1个
											</div>
										</td>
									</tr>
									<tr >
										<td height="30" bgcolor="#FFFFFF"  class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;服务器操作系统：
											</div>
										</td>
										<td height="18" bgcolor="#FFFFFF" >
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;WINDOW7
											</div>
										</td>
									</tr>
									<tr >
										<td height="30" align="center" colspan="2" bgcolor="#EDF9DB"  class="STYLE2">
											<div class="STYLE2 STYLE1">
												<span class="STYLE4">说明信息</span>
											</div>
										</td>
									</tr>
									<tr >
										<td height="30"  colspan="2" bgcolor="#FFFFFF"  class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;1、请选择左边的菜单进行管理
											</div>
										</td>
									</tr>
									<tr >
										<td height="30"  colspan="2" bgcolor="#FFFFFF"  class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;2、如需帮助，请联系统开发人员（1577569****）......或是致电1800******客户热线
											</div>
										</td>
									</tr>
									<tr >
										<td height="30"  colspan="2" bgcolor="#FFFFFF"  class="STYLE2">
											<div class="STYLE2 STYLE1">
												&nbsp;&nbsp;&nbsp;&nbsp;3、如果你对系统的数据结构不是很了解，请不要随意更改数据库的结构
											</div>
										</td>
									</tr>
								</table>
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