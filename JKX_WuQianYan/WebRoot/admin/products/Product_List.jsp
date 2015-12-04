<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%@page import="com.jkx.web.Impl.Web_Product_Impl"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<head>
<style><!--分页样式-->
.pager { font: 12px Arial, Helvetica, sans-serif;}
.pager a {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;margin-right:2px;line-height:30px;vertical-align:middle;}
.pager .active a{color:red;border:none;}
.pager a:visited {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;}
.pager a:hover {color: #fff; background: #ffa501;border-color:#ffa501;text-decoration: none;}
.pager .input_li{padding: 1px 6px;}
</style>

<jsp:useBean id="pager" class="com.jkx.web.pager.web_Page"></jsp:useBean>
<%
  if(request.getParameter("delete")!=null){
    if(request.getParameter("delete").equals("false")){
    out.print("<script>alert('产品删除失败！');</script>");
    }
  }
	int pageIndex=1,pageSize=5;
   Web_Product_Impl productImpl=new Web_Product_Impl();
   //下面的ArrayList<Object>的object可根据需求自信给定义泛型如：ArrayList<Web_Test_Impl>
   ArrayList<Web_Product_Impl> result =new Web_AllImpl_DoAll(productImpl).QueryAll("w_product");
   pager.setRecordcount(result.size());
   if(request.getParameter("pageIndex")!=null){
    pageIndex=Integer.parseInt(request.getParameter("pageIndex").toString());
    pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
   }
   pager.setPagenow(pageIndex);
   pager.setPagesize(pageSize);
   pager.setPagecount(result.size(),pager.getPagesize());
   List<Web_Product_Impl> subresult=null;
   if(pageIndex==1){
     if(result.size()<pager.getPagesize()){
       pager.setPagesize(result.size());
       if(session.getAttribute("product")!="once"){
       out.print("<script>alert('总记录小于分页数，仅有"+result.size()+"条记录！');</script>");
       session.setAttribute("product","once");
       }
     }
    subresult=result.subList(0,pager.getPagesize());
   }
   else if(pager.getPagenow()*pager.getPagesize()<result.size()){
    subresult=result.subList((pager.getPagenow()-1)*(pager.getPagesize()),pager.getPagenow()*pager.getPagesize());
   }
   else{
    subresult=result.subList((pager.getPagenow()-1)*pager.getPagesize(),result.size());
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>产品列表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>admin/css/tab.css" />
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/jquery-1.4.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>admin/javascript/tab.js"></script>
		<script type="text/javascript">
		  function del(id){
		     if (confirm("确认要删除？")) {
           		window.location.href="<%=basePath%>wProduct_delete?id="+id;
        	}
        	
		  }
		</script>
		<style type="text/css">
#exceed {
	width: 290px;
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
	text-align: left;
	padding-left: 5px;
}
</style>
	</head>
	<body>
	<form id="queryForm"  method="post"></form>
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
							<td width="1101" background="<%=basePath%>admin/images/tab_05.gif">
								<img src="<%=basePath%>admin/images/311.gif" width="16"
									height="16" />
								<span class="STYLE4">产品列表</span>
							</td>
							<td width="281" background="<%=basePath%>admin/images/tab_05.gif">
								<table border="0" align="right" cellpadding="0" cellspacing="0">
									<tr>
										<td width="60">
											<table width="90%" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1">
														<div align="center">
															<img src="<%=basePath%>admin/images/001.gif" width="14"
																height="14" />
														</div>
													</td>
													<td class="STYLE1">
														<div align="center">
															<a href="####"
																onclick="openWin('<%=basePath%>admin/products/Product_Add.jsp','add_notepad',980,650)">新建</a>
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
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
										<td width="5%" height="26"
											background="<%=basePath%>admin/images/tab_14.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												序号
											</div>
										</td>
										<td width="10%" height="18"
											background="<%=basePath%>admin/images/tab_14.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												封面
											</div>
										</td>
										<td width="10%" height="18"
											background="<%=basePath%>admin/images/tab_14.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												产品类型
											</div>
										</td>
										<td width="10%" height="18"
											background="<%=basePath%>admin/images/tab_14.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												产品名字
											</div>
										</td>
										<td width="15%" height="18"
											background="<%=basePath%>admin/images/tab_14.gif"
											class="STYLE1">
											<div align="center" class="STYLE2 STYLE1">
												产品内容
											</div>
										</td>
										<td width="10%" height="18" colspan="2"
											background="<%=basePath%>admin/images/tab_14.gif"
											class="STYLE1">
											<div align="center" class="STYLE2">
												产品管理
											</div>
										</td>
									</tr>
									<c:if test="${subresult.size < 1}">
										<tr>
											<td height="18" colspan="12" bgcolor="#FFFFFF">
												<div align="center" class="STYLE1">
													暂无数据
												</div>
											</td>
										</tr>
									</c:if>
									<c:forEach items="<%=subresult %>" var="products" varStatus="coun">
										<tr>
											<td height="18" bgcolor="#FFFFFF" class="STYLE2">
												<div align="center" class="STYLE2 STYLE1">
													${coun.count}
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												<div align="left" style="padding-left: 24px;"
													class="STYLE2 STYLE1">
													<img width="100px" height="70px" src="<%=basePath%>${products.productImg}"/>
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center" class="STYLE2 STYLE1">
													
														<font color="#4FA21F">${products.productType}</font>
												
													
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center" class="STYLE2 STYLE1">
													${products.productName}
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center" class="STYLE2 STYLE1">
													<span class="STYLE1">[ </span>
													<a class="STYLE1" href="<%=basePath%>admin/products/Product_Content.jsp?id=${products.id}">
													点击查看详细内容</a>
													<span class="STYLE1">]</span>
												</div>
											</td>
											<td height="18" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">[</span>
													<a href="####"
														onclick="openWin('<%=basePath%>admin/products/Product_Update.jsp?id=${products.id}','add_notepad',980,650)">编辑</a>
													<span class="STYLE1">]</span>
												</div>
											</td>
											<td height="28" bgcolor="#FFFFFF">
												<div align="center">
													<span class="STYLE1">[ </span>
													<a href="javascript:void(0);"  onclick="del(${products.id})">删除</a>
													<span class="STYLE1">]</span>
												</div>
											</td>
										</tr>
									</c:forEach>
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
							<td align="center" background="<%=basePath%>admin/images/tab_21.gif"  >
								<tags:pager pagerRange="<%=pager.getPagerRange()%>" pageSize="<%=pager.getPagesize()%>" totalPage="<%=pager.getPagecount()%>" curIndex="<%=pager.getPagenow()%>" formId="queryForm"></tags:pager>
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
