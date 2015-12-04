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

import com.jkx.web.Impl.Web_Product_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("unchecked")
public class Web_wProduct_Action extends ActionSupport {
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

	public String WgetProducttype() {
		Web_Product_Impl productImpl = new Web_Product_Impl();
		ArrayList<Web_Product_Impl> Alist = new Web_AllImpl_DoAll(productImpl)
				.QueryAll("w_product");

		ArrayList<Web_Product_Impl> JsonList = new ArrayList<Web_Product_Impl>();
		JsonList.add(Alist.get(0));
		for (Web_Product_Impl impl1 : Alist) {
			boolean i = false;
			for (Web_Product_Impl impl2 : JsonList) {
				if (impl1.getProductType().equals(impl2.getProductType())) {
					i = true;
				}
			}
			if (i == false) {
				JsonList.add(impl1);
			}
		}
		this.json = JsonList;
		return SUCCESS;
	}

	public String WgetAllproduct() {

		Web_Product_Impl productImpl = new Web_Product_Impl();
		ArrayList<Web_Product_Impl> Alist = new Web_AllImpl_DoAll(productImpl)
				.QueryAll("w_product");
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetTypeproduct() throws UnsupportedEncodingException,
			SQLException {

		String productType = new String(ServletActionContext.getRequest()
				.getParameter("productType").getBytes("iso8859-1"), "utf-8");
		Web_Product_Impl productImpl = new Web_Product_Impl();
		ArrayList<Web_Product_Impl> Alist = new Web_AllImpl_DoAll(productImpl)
				.QueryByCaseorTypeName("w_product", "productType", productType);
		this.json = Alist;
		return SUCCESS;
	}

	public String WgetProduct() throws UnsupportedEncodingException,
			SQLException {

		String productName = new String(ServletActionContext.getRequest()
				.getParameter("productName").getBytes("iso8859-1"), "utf-8");
//		System.out.println("productName="+productName);
		Web_Product_Impl productImpl = new Web_Product_Impl();
		ArrayList<Web_Product_Impl> Alist = new Web_AllImpl_DoAll(productImpl)
				.QueryByCaseorTypeName("w_product", "productName", productName);
		this.json = Alist;
		return SUCCESS;
	}

	// -------------------后台管理代码------------------

	public void update() throws NumberFormatException, SQLException,
			IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(new String(ServletActionContext.getRequest()
				.getParameter("id").getBytes("iso8859-1"), "utf-8"));
		String productName = request.getParameter("productName");
		String productType = request.getParameter("productType");
		String productContent = request.getParameter("productContent");
		String productImg = request.getParameter("productImg");
		if (request.getSession().getAttribute("path") != null) {
			productImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}
		Web_Product_Impl productImpl = new Web_Product_Impl();
		int i2 = new Web_AllImpl_DoAll(productImpl).UpdateById("w_product", id,
				"productName", productName);
		int i1 = new Web_AllImpl_DoAll(productImpl).UpdateById("w_product", id,
				"productType", productType);
		int i3 = new Web_AllImpl_DoAll(productImpl).UpdateById("w_product", id,
				"productText", productContent);
		int i4 = new Web_AllImpl_DoAll(productImpl).UpdateById("w_product", id,
				"productImg", productImg);
		if (i1 > 0 && i2 > 0 && i3 > 0 && i4 > 0) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/common/update_success.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("http://"
					+ InetAddress.getLocalHost().getHostAddress().toString()
					+ ":8080/wuqianyan/admin/products/Product_Update.jsp?id="
					+ id + "&update=false");
		}
	}

	public void delete() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("id"));
		Web_Product_Impl productImpl = new Web_Product_Impl();
		int i = new Web_AllImpl_DoAll(productImpl).DeleteById("w_product", id);
		if (i > 0) {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/common/delete_success.jsp?main=products/Product");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/products/Product_List.jsp?delete=false");
		}
	}

	public void insert() throws UnknownHostException, IOException {
		request.setCharacterEncoding("utf-8");
		String productName = request.getParameter("productName");
		String productType = request.getParameter("productType");
		String productContent = request.getParameter("productContent");
		String productImg = null;
		if (request.getSession().getAttribute("path") != null) {
			productImg = (String) request.getSession().getAttribute("path");
			request.getSession().setAttribute("path", null);
		}

		Web_Product_Impl productImpl = new Web_Product_Impl();
		if (new Web_AllImpl_DoAll(productImpl).CheackRename("w_product",
				"productName", productName)) {

			int i = new Web_AllImpl_DoAll(productImpl).Insert("w_product",
					"productType", "productName", "productText", "productImg",
					productType, productName, productContent, productImg);

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
								+ ":8080/wuqianyan/admin/products/Product_Add.jsp?insert=false");
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			response
					.sendRedirect("http://"
							+ InetAddress.getLocalHost().getHostAddress()
									.toString()
							+ ":8080/wuqianyan/admin/products/Product_Add.jsp?insert=rename");
		}
	}

}
