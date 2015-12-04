<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jkx.web.Impl.Web_Test_Impl"%>
<%@page import="com.jkx.web.Query.Web_AllImpl_DoAll"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	int pageIndex=1,pageSize=10;
   Web_Test_Impl Test=new Web_Test_Impl();
   //下面的ArrayList<Object>的object可根据需求自信给定义泛型如：ArrayList<Web_Test_Impl>
   ArrayList<Object> result =new Web_AllImpl_DoAll(Test).QueryAll("test");
   pager.setRecordcount(result.size());
   if(request.getParameter("pageIndex")!=null){
    pageIndex=Integer.parseInt(request.getParameter("pageIndex").toString());
    pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
   }
   pager.setPagenow(pageIndex);
   pager.setPagesize(pageSize);
   pager.setPagecount(result.size(),pager.getPagesize());
   List<Object> subresult=null;
   if(pageIndex==1){
    subresult=result.subList(0,pager.getPagesize());
   }
   else if(pager.getPagenow()*pager.getPagesize()<result.size()){
    subresult=result.subList((pager.getPagenow()-1)*(pager.getPagesize()),pager.getPagenow()*pager.getPagesize());
   }
   else{
    subresult=result.subList((pager.getPagenow()-1)*pager.getPagesize(),result.size());
   }
%>
</head>
<body>
<form id="queryForm" action="" method="post"></form><!--对于form的action提交带参数的URL，method采用post,否则，request获取不到参数-->
<table class="border">
	<thead>
		<tr>
			<th width="100">用户ID</th>
			<th width="500">用户姓名</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="<%=subresult%>" var="sub"><!-- var的sub相当于subresult.get(i)，即具体的每一条数据（对象） -->
		<tr>
			<td>${sub.id}</td>
			<td>${sub.name}</td>
			<td>
			<!--<fmt:formatDate value="${log.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>-->
		</tr>
	</c:forEach>
	</tbody>
</table>
<tags:pager pagerRange="<%=pager.getPagerRange()%>" pageSize="<%=pager.getPagesize()%>" totalPage="<%=pager.getPagecount()%>" curIndex="<%=pager.getPagenow()%>" formId="queryForm"></tags:pager>

</body>