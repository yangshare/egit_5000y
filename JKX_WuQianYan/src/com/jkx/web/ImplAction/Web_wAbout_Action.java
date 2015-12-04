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
import com.jkx.web.Impl.Web_About_Hire_Impl;
import com.jkx.web.Impl.Web_About_News_Impl;
import com.jkx.web.Impl.Web_About_Us_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("unchecked")
public class Web_wAbout_Action extends ActionSupport {
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

	public String WgetIntroduces() throws SQLException {
		Web_About_Company_Impl aboutCompany = new Web_About_Company_Impl();
		ArrayList<Web_About_Company_Impl> Alist = new Web_AllImpl_DoAll(
				aboutCompany).QueryAll("w_about_company");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetAllNews() throws SQLException {
		Web_About_News_Impl aboutNewsImpl = new Web_About_News_Impl();
		ArrayList<Web_About_News_Impl> Alist = new Web_AllImpl_DoAll(
				aboutNewsImpl).QueryAll("w_about_news");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetNews() throws SQLException, UnsupportedEncodingException {
		String newsname = new String(ServletActionContext.getRequest()
				.getParameter("newsName").getBytes("iso8859-1"), "utf-8");

		Web_About_News_Impl aboutNewsImpl = new Web_About_News_Impl();
		ArrayList<Web_About_News_Impl> Alist = new Web_AllImpl_DoAll(
				aboutNewsImpl).QueryByCaseorTypeName("w_about_news",
				"newsName", newsname);
		new Web_AllImpl_DoAll(aboutNewsImpl).ClickNumInsert(Alist.get(0)
				.getNewsClicks(), Alist.get(0).getId());
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetAllHires() throws SQLException {
		Web_About_Hire_Impl aboutHireImpl = new Web_About_Hire_Impl();
		ArrayList<Web_About_Hire_Impl> Alist = new Web_AllImpl_DoAll(
				aboutHireImpl).QueryAll("w_about_hire");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetHires() throws SQLException, UnsupportedEncodingException {
		String hireName = new String(ServletActionContext.getRequest()
				.getParameter("hireName").getBytes("iso8859-1"), "utf-8");
		Web_About_News_Impl aboutNewsImpl = new Web_About_News_Impl();
		ArrayList<Web_About_Hire_Impl> Alist = new Web_AllImpl_DoAll(
				aboutNewsImpl).QueryByCaseorTypeName("w_about_hire",
				"hireName", hireName);
		this.json = Alist;
		return SUCCESS;
	}

	public String Allpeople() throws SQLException {
		Web_About_Us_Impl aboutUs = new Web_About_Us_Impl();
		ArrayList<Web_About_Us_Impl> Alist = new Web_AllImpl_DoAll(aboutUs)
				.QueryAll("w_about_us");
		this.json = Alist;
		return SUCCESS;
	}

	public String people() throws SQLException, UnsupportedEncodingException {
		int id = Integer.parseInt(new String(ServletActionContext.getRequest()
				.getParameter("id").getBytes("iso8859-1"), "utf-8"));
		Web_About_Us_Impl aboutUs = new Web_About_Us_Impl();
		ArrayList<Web_About_Us_Impl> Alist = new Web_AllImpl_DoAll(aboutUs)
				.QueryById("w_about_us", id);
		this.json = Alist;
		return SUCCESS;
	}

	// -----------------后台管理代码----------------

	// --------关于公司--------
	public void CompanyUpdate() throws NumberFormatException, SQLException,
			UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		String introduce = request.getParameter("aboutcompanyContent");
		Web_About_Company_Impl companyImpl = new Web_About_Company_Impl();
		int i = new Web_AllImpl_DoAll(companyImpl).UpdateById(
				"w_about_company", id, "introduce", introduce);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_Company.jsp?insert=true");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_Company.jsp?insert=false");
		}
	}

	// ---------新闻动态----------
	public void NewsUpdate() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		String newsName = request.getParameter("newsName");
		String newsTime = request.getParameter("newsTime");
		String newsClicks = request.getParameter("newsClicks");
		String newsImg = request.getParameter("newsImg");
		String newsContent = request.getParameter("newsContent");
		String newsExplain = request.getParameter("newsExplain");

		if (request.getSession().getAttribute("path") != null) {
			newsImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}
		Web_About_News_Impl newsImpl = new Web_About_News_Impl();
		int i2 = new Web_AllImpl_DoAll(newsImpl).UpdateById("w_about_news", id,
				"newsName", newsName);
		int i1 = new Web_AllImpl_DoAll(newsImpl).UpdateById("w_about_news", id,
				"newsTime", newsTime);
		int i3 = new Web_AllImpl_DoAll(newsImpl).UpdateById("w_about_news", id,
				"newsClicks", newsClicks);
		int i4 = new Web_AllImpl_DoAll(newsImpl).UpdateById("w_about_news", id,
				"newsImg", newsImg);
		int i5 = new Web_AllImpl_DoAll(newsImpl).UpdateById("w_about_news", id,
				"newsIntroduce", newsContent);
		int i6 = new Web_AllImpl_DoAll(newsImpl).UpdateById("w_about_news", id,
				"newsExplain", newsExplain);
		if (i1 > 0 && i2 > 0 && i3 > 0 && i4 > 0 && i5 > 0 && i6 > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/update_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/abouts/About_News_Update.jsp?id="
					+ id + "&update=false");
		}
	}

	public void NewsDelete() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		Web_About_News_Impl newsImpl = new Web_About_News_Impl();
		int i = new Web_AllImpl_DoAll(newsImpl).DeleteById("w_about_news", id);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=abouts/About_News");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_News_List.jsp?delete=false");
		}
	}

	public void NewsInsert() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		String newsName = request.getParameter("newsName");
		String newsTime = request.getParameter("newsTime");
		String newsClicks = request.getParameter("newsClicks");
		String newsContent = request.getParameter("newsContent");
		String newsExplain = request.getParameter("newsExplain");

		String newsImg = null;
		if (request.getSession().getAttribute("path") != null) {
			newsImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_About_News_Impl newsImpl = new Web_About_News_Impl();
		if (new Web_AllImpl_DoAll(newsImpl).CheackRename("w_about_news",
				"newsName", newsName)) {

			int i = new Web_AllImpl_DoAll(newsImpl).Insert("w_about_news",
					"newsName", "newsTime", "newsClicks", "newsIntroduce",
					"newsExplain", "newsImg", newsName, newsTime, newsClicks,
					newsContent, newsExplain, newsImg);

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
								+ ":8080/wuqianyan/admin/abouts/About_News_Add.jsp?insert=false");
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_News_Add.jsp?insert=rename");
		}
	}

	// ---------我们团队----------
	public void UsUpdate() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		String name = request.getParameter("name");
		String usContent = request.getParameter("usContent");
		String usImg = request.getParameter("usImg");
		if (request.getSession().getAttribute("path") != null) {
			usImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_About_Us_Impl usImpl = new Web_About_Us_Impl();
		int i2 = new Web_AllImpl_DoAll(usImpl).UpdateById("w_about_us", id,
				"name", name);
		int i1 = new Web_AllImpl_DoAll(usImpl).UpdateById("w_about_us", id,
				"introduce", usContent);
		int i3 = new Web_AllImpl_DoAll(usImpl).UpdateById("w_about_us", id,
				"usImg", usImg);
		if (i1 > 0 && i2 > 0 && i3 > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/update_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/abouts/About_Us_Update.jsp?id="
					+ id + "&update=false");
		}
	}

	public void UsDelete() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		Web_About_Us_Impl usImpl = new Web_About_Us_Impl();
		int i = new Web_AllImpl_DoAll(usImpl).DeleteById("w_about_us", id);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=abouts/About_Us");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_News_List.jsp?delete=false");
		}
	}

	public void UsInsert() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String usContent = request.getParameter("usContent");
		String usImg = null;
		if (request.getSession().getAttribute("path") != null) {
			usImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_About_Us_Impl usImpl = new Web_About_Us_Impl();

		int i = new Web_AllImpl_DoAll(usImpl).Insert("w_about_us", "name",
				"introduce", "usImg", name, usContent, usImg);

		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/insert_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_Us_Add.jsp?insert=false");
		}
	}

	// ---------招聘信息----------

	public void HireUpdate() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		String hireName = request.getParameter("hireName");
		String hireTime = request.getParameter("hireTime");
		String hireClicks = request.getParameter("hireClicks");
		String hireImg = request.getParameter("hireImg");
		String hireContent = request.getParameter("hireContent");
		String hireExplain = request.getParameter("hireExplain");
		if (request.getSession().getAttribute("path") != null) {
			hireImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}
		Web_About_Hire_Impl hireImpl = new Web_About_Hire_Impl();
		int i2 = new Web_AllImpl_DoAll(hireImpl).UpdateById("w_about_hire", id,
				"hireName", hireName);
		int i1 = new Web_AllImpl_DoAll(hireImpl).UpdateById("w_about_hire", id,
				"hireTime", hireTime);
		int i3 = new Web_AllImpl_DoAll(hireImpl).UpdateById("w_about_hire", id,
				"hireClicks", hireClicks);
		int i4 = new Web_AllImpl_DoAll(hireImpl).UpdateById("w_about_hire", id,
				"hireImg", hireImg);
		int i5 = new Web_AllImpl_DoAll(hireImpl).UpdateById("w_about_hire", id,
				"hireText", hireContent);
		int i6 = new Web_AllImpl_DoAll(hireImpl).UpdateById("w_about_hire", id,
				"hireExplain", hireExplain);
		if (i1 > 0 && i2 > 0 && i3 > 0 && i4 > 0 && i5 > 0 && i6 > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/update_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/abouts/About_Hire_Update.jsp?id="
					+ id + "&update=false");
		}
	}

	public void HireDelete() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt((String) request.getParameter("id"));
		Web_About_Hire_Impl hireImpl = new Web_About_Hire_Impl();
		int i = new Web_AllImpl_DoAll(hireImpl).DeleteById("w_about_hire", id);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=abouts/About_Hire");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_Hire_List.jsp?delete=false");
		}
	}

	public void HireInsert() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		String hireName = request.getParameter("hireName");
		String hireTime = request.getParameter("hireTime");
		String hireClicks = request.getParameter("hireClicks");
		String hireContent = request.getParameter("hireContent");
		String hireExplain = request.getParameter("hireExplain");
		String hireImg = null;
		if (request.getSession().getAttribute("path") != null) {
			hireImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_About_Hire_Impl hireImpl = new Web_About_Hire_Impl();
		if (new Web_AllImpl_DoAll(hireImpl).CheackRename("w_about_hire",
				"hireName", hireName)) {

			int i = new Web_AllImpl_DoAll(hireImpl).Insert("w_about_hire",
					"hireName", "hireTime", "hireClicks", "hireText",
					"hireExplain", "hireImg", hireName, hireTime, hireClicks,
					hireContent, hireExplain, hireImg);

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
								+ ":8080/wuqianyan/admin/abouts/About_Hire_Add.jsp?insert=false");
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/abouts/About_Hire_Add.jsp?insert=rename");
		}
	}

}
