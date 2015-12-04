package com.jkx.web.ImplAction;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.struts2.ServletActionContext;

import com.jkx.web.Impl.Web_Contact_Message_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

public class Web_wMessage_Action extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String json = null;

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	@SuppressWarnings("unchecked")
	public String Insert() throws UnsupportedEncodingException {
		String mTitle = new String(ServletActionContext.getRequest()
				.getParameter("mTitle").getBytes("iso8859-1"), "utf-8");
		String houseArea = new String(ServletActionContext.getRequest()
				.getParameter("houseArea").getBytes("iso8859-1"), "utf-8");
		String contactName = new String(ServletActionContext.getRequest()
				.getParameter("contactName").getBytes("iso8859-1"), "utf-8");
		String contactPhone = new String(ServletActionContext.getRequest()
				.getParameter("contactPhone").getBytes("iso8859-1"), "utf-8");
		String houseType = new String(ServletActionContext.getRequest()
				.getParameter("houseType").getBytes("iso8859-1"), "utf-8");
		String message = new String(ServletActionContext.getRequest()
				.getParameter("messages").getBytes("iso8859-1"), "utf-8");

		String msg;
		Web_Contact_Message_Impl messageImpl = new Web_Contact_Message_Impl();
		int i = new Web_AllImpl_DoAll(messageImpl).Insert("w_contact_message",
				"mTitle", "houseArea", "contactName", "contactPhone",
				"houseType", "message", mTitle, houseArea, contactName,
				contactPhone, houseType, message);
		if (i > 0) {
			msg = "提交成功！";
		} else {
			msg = "插入数据库异常导致提交失败！";
		}
		this.json = msg;
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public void delete() throws UnknownHostException, IOException {
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id"));
		Web_Contact_Message_Impl messageImpl = new Web_Contact_Message_Impl();
		int i = new Web_AllImpl_DoAll(messageImpl).DeleteById(
				"w_contact_message", id);
		if (i > 0) {
			ServletActionContext.getResponse().setContentType(
					"text/html; charset=utf-8");
			ServletActionContext
					.getResponse()
					.sendRedirect(
							"http://"
									+ InetAddress.getLocalHost()
											.getHostAddress().toString()
									+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=user_reply");
		} else {
			ServletActionContext.getResponse().setContentType(
					"text/html; charset=utf-8");
			ServletActionContext
					.getResponse()
					.sendRedirect(
							"http://"
									+ InetAddress.getLocalHost()
											.getHostAddress().toString()
									+ ":8080/wuqianyan/admin/user_reply.jsp?delete=false");
		}
	}
}
