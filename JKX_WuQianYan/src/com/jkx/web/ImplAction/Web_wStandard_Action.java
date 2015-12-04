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

import com.jkx.web.Impl.Web_About_Company_Impl;
import com.jkx.web.Impl.Web_Standard_Impl;
import com.jkx.web.Impl.Web_Standard_Pic_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("unchecked")
public class Web_wStandard_Action extends ActionSupport {
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

	public String WgetType() {

		Web_Standard_Impl standardImpl = new Web_Standard_Impl();
		ArrayList<Web_Standard_Impl> Alist = new Web_AllImpl_DoAll(standardImpl)
				.QueryAll("w_standard");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetContent() throws UnsupportedEncodingException,
			SQLException {

		String standardType = new String(ServletActionContext.getRequest()
				.getParameter("standardType").getBytes("iso8859-1"), "utf-8");
		Web_Standard_Impl standardImpl = new Web_Standard_Impl();
		ArrayList<Web_Standard_Impl> Alist = new Web_AllImpl_DoAll(standardImpl)
				.QueryByCaseorTypeName("w_standard", "standardType",
						standardType);
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetPaintType() throws UnsupportedEncodingException,
			SQLException {

//		String standardType = new String(ServletActionContext.getRequest()
//				.getParameter("standardType").getBytes("iso8859-1"), "utf-8");
		Web_Standard_Pic_Impl standardPicImpl = new Web_Standard_Pic_Impl();
		ArrayList<Web_Standard_Pic_Impl> Alist = new Web_AllImpl_DoAll(
				standardPicImpl).QueryAll("w_standard_pic");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetPaintContent() throws UnsupportedEncodingException,
			SQLException {

		int id = Integer.parseInt(new String(ServletActionContext.getRequest()
				.getParameter("id").getBytes("iso8859-1"), "utf-8"));
		Web_Standard_Pic_Impl standardPicImpl = new Web_Standard_Pic_Impl();
		ArrayList<Web_Standard_Pic_Impl> Alist = new Web_AllImpl_DoAll(
				standardPicImpl).QueryById("w_standard_pic", id);
		this.json = Alist;
		return SUCCESS;
	}

	// -----------后台管理系统代码----------------

	public void StandardUpdate() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		String introduce = request.getParameter("StandardContent");
		String standardType = request.getParameter("standardType");
		String standardImg = request.getParameter("standardImg");
		if (request.getSession().getAttribute("path") != null) {
			standardImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}
		Web_About_Company_Impl companyImpl = new Web_About_Company_Impl();
		int i1 = new Web_AllImpl_DoAll(companyImpl).UpdateById("w_standard",
				id, "standardIntroduce", introduce);
		int i2 = new Web_AllImpl_DoAll(companyImpl).UpdateById("w_standard",
				id, "standardType", standardType);
		int i3 = new Web_AllImpl_DoAll(companyImpl).UpdateById("w_standard",
				id, "standardImg", standardImg);
		if (i1 > 0 && i2 > 0 && i3 > 0) {
			if (id == 1) {
				response.setContentType("text/html; charset=utf-8");
				response
						.sendRedirect("http://"
								+ InetAddress.getLocalHost().getHostAddress()
										.toString()
								+ ":8080/wuqianyan/admin/standards/Standard_HardDisn.jsp?insert=true");
			}
			if (id == 2) {
				response.setContentType("text/html; charset=utf-8");
				response
						.sendRedirect("http://"
								+ InetAddress.getLocalHost().getHostAddress()
										.toString()
								+ ":8080/wuqianyan/admin/standards/Standard_ConstructionProcess.jsp?insert=true");
			}
		} else {
			if (id == 1) {
				response.setContentType("text/html; charset=utf-8");
				response
						.sendRedirect("http://"
								+ InetAddress.getLocalHost().getHostAddress()
										.toString()
								+ ":8080/wuqianyan/admin/standards/Standard_HardDisn.jsp?insert=false");
			}
			if (id == 2) {
				response.setContentType("text/html; charset=utf-8");
				response
						.sendRedirect("http://"
								+ InetAddress.getLocalHost().getHostAddress()
										.toString()
								+ ":8080/wuqianyan/admin/standards/Standard_ConstructionProcess.jsp?insert=false");
			}
		}
	}

	// 软装设计

	public void StandardSoftUpdate() throws NumberFormatException,
			SQLException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(new String(ServletActionContext.getRequest()
				.getParameter("id").getBytes("iso8859-1"), "utf-8"));
		String standardName = request.getParameter("standardName");
		String standardContent = request.getParameter("standardContent");
		String standardImg = request.getParameter("standardImg");
		if (request.getSession().getAttribute("path") != null) {
			standardImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}
		Web_Standard_Pic_Impl picImpl = new Web_Standard_Pic_Impl();
		int i2 = new Web_AllImpl_DoAll(picImpl).UpdateById("w_standard_pic",
				id, "standardName", standardName);
		int i3 = new Web_AllImpl_DoAll(picImpl).UpdateById("w_standard_pic",
				id, "standardContent", standardContent);
		int i4 = new Web_AllImpl_DoAll(picImpl).UpdateById("w_standard_pic",
				id, "standardImg", standardImg);
		if (i2 > 0 && i3 > 0 && i4 > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/update_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/standards/StandardSoft_Update.jsp?id="
							+ id + "&update=false");
		}
	}

	public void StandardSoftDelete() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id"));
		Web_Standard_Pic_Impl picImpl = new Web_Standard_Pic_Impl();
		int i = new Web_AllImpl_DoAll(picImpl).DeleteById("w_standard_pic", id);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=standards/StandardSoft");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/standards/StandardSoft_List.jsp?delete=false");
		}
	}

	public void StandardSoftInsert() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		String standardName = request.getParameter("standardName");
		String standardContent = request.getParameter("standardContent");
		String standardImg = null;
		if (request.getSession().getAttribute("path") != null) {
			standardImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_Standard_Pic_Impl picImpl = new Web_Standard_Pic_Impl();
		if (new Web_AllImpl_DoAll(picImpl).CheackRename("w_standard_pic",
				"standardName", standardName)) {

			int i = new Web_AllImpl_DoAll(picImpl).Insert("w_standard_pic",
					"standardName", "standardContent", "standardImg",
					standardName, standardContent, standardImg);

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
								+ ":8080/wuqianyan/admin/standards/StandardSoft_Add.jsp?insert=false");
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/standards/StandardSoft_Add.jsp?insert=rename");
		}
	}
}
