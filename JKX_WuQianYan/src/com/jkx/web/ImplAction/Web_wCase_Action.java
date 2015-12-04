package com.jkx.web.ImplAction;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.jkx.web.Impl.Web_Case_Types_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("unchecked")
public class Web_wCase_Action extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ArrayList json = null;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public ArrayList getJson() {
		return json;
	}

	public void setJson(ArrayList json) {
		this.json = json;
	}

	public String WgetType() throws UnsupportedEncodingException {

		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		ArrayList<Web_Case_Types_Impl> Alist = new Web_AllImpl_DoAll(Case_Types)
				.QueryAll("w_case_types");

		/*
		 * 该代码实现从Alist里面取出不重名的TypeName并放到新list里面， 注意，此处jsonlist需要实例化，否则添加不进去数据
		 */
		ArrayList<String> JsonList = new ArrayList<String>();
		JsonList.add(Alist.get(0).getTypeName());
		for (Web_Case_Types_Impl impl1 : Alist) {
			boolean i = false;
			for (String impl2 : JsonList) {
				if (impl1.getTypeName().equals(impl2)) {
					i = true;
				}
			}
			if (i == false) {
				JsonList.add(impl1.getTypeName());
			}
		}

		this.json = JsonList;
		System.out.println(JsonList.toString());
		return SUCCESS;
	}

	public String WgetAllcase() throws UnsupportedEncodingException {

		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		ArrayList<Web_Case_Types_Impl> Alist = new Web_AllImpl_DoAll(Case_Types)
				.QueryAll("w_case_types");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetCaseByType() throws UnsupportedEncodingException,
			SQLException {

		String typeName = new String(ServletActionContext.getRequest()
				.getParameter("typeName").getBytes("iso8859-1"), "utf-8");
		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		ArrayList<Web_Case_Types_Impl> Alist = new Web_AllImpl_DoAll(Case_Types)
				.QueryByCaseorTypeName("w_case_types", "typeName", typeName);
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetCase() throws UnsupportedEncodingException, SQLException {

		int id = Integer.parseInt(new String(ServletActionContext.getRequest()
				.getParameter("id").getBytes("iso8859-1"), "utf-8"));
		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		ArrayList<Web_Case_Types_Impl> Alist = new Web_AllImpl_DoAll(Case_Types)
				.QueryById("w_case_types", id);
		this.json = Alist;
		return SUCCESS;
	}

	// -------------后台管理系统代码----------------

	public void update() throws NumberFormatException, SQLException,
			IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(new String(ServletActionContext.getRequest()
				.getParameter("id").getBytes("iso8859-1"), "utf-8"));
		String typeName = request.getParameter("typeName");
		String caseName = request.getParameter("caseName");
		String caseContent = request.getParameter("caseContent");
		String caseImg = request.getParameter("caseImg");
		if (request.getSession().getAttribute("path") != null) {
			caseImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}
		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		int i2 = new Web_AllImpl_DoAll(Case_Types).UpdateById("w_case_types",
				id, "caseName", caseName);
		int i1 = new Web_AllImpl_DoAll(Case_Types).UpdateById("w_case_types",
				id, "typeName", typeName);
		int i3 = new Web_AllImpl_DoAll(Case_Types).UpdateById("w_case_types",
				id, "caseContent", caseContent);
		int i4 = new Web_AllImpl_DoAll(Case_Types).UpdateById("w_case_types",
				id, "caseImg", caseImg);
		if (i1 > 0 && i2 > 0 && i3 > 0 && i4 > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/update_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/cases/Case_Update.jsp?id=" + id
					+ "&update=false");
		}
	}

	public void delete() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id"));
		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		int i = new Web_AllImpl_DoAll(Case_Types)
				.DeleteById("w_case_types", id);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=cases/Case");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/cases/Case_List.jsp?delete=false");
		}
	}

	public void insert() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		String typeName = request.getParameter("typeName");
		String caseName = request.getParameter("caseName");
		String caseContent = request.getParameter("caseContent");
		String caseImg = null;
		if (request.getSession().getAttribute("path") != null) {
			caseImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_Case_Types_Impl Case_Types = new Web_Case_Types_Impl();
		if (new Web_AllImpl_DoAll(Case_Types).CheackRename("w_case_types",
				"caseName", caseName)) {

			int i = new Web_AllImpl_DoAll(Case_Types).Insert("w_case_types",
					"typeName", "caseName", "caseContent", "caseImg", typeName,
					caseName, caseContent, caseImg);

			if (i > 0) {
				response.setContentType("text/html; charset=utf-8");
				response.sendRedirect("http://"
						+ InetAddress.getLocalHost().getHostAddress()
								.toString()
						+ ":8080/wuqianyan/admin/common/insert_success.jsp");
			} else {
				response.setContentType("text/html; charset=utf-8");
				response
						.sendRedirect("http://"
								+ InetAddress.getLocalHost().getHostAddress()
										.toString()
								+ ":8080/wuqianyan/admin/cases/Case_Add.jsp?insert=false");
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/cases/Case_Add.jsp?insert=rename");
		}
	}
}
