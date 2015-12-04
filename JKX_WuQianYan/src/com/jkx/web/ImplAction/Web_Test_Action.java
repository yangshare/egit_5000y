package com.jkx.web.ImplAction;

import java.util.ArrayList;

import org.junit.Test;

import com.jkx.web.Impl.Web_Contact_Message_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

public class Web_Test_Action extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Test
	public void a() {
		Web_Contact_Message_Impl messageImpl = new Web_Contact_Message_Impl();
		ArrayList<Web_Contact_Message_Impl> result = new Web_AllImpl_DoAll(
				messageImpl).QueryAll("w_contact_message");
		System.out.println((result.get(0)).getTitle());
	}
	// public void a() {
	// String newsContent =
	// "<p>公司决定让公司决定让.公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让公司决定让</p>";
	// // String regex = "([\u4e00-\u9fa5]+)";
	// String regex = "[^0-9a-zA-Z\u4e00-\u9fa5.，,。？“”]+";
	// Matcher matcher = Pattern.compile(regex).matcher(newsContent);
	// if (matcher.find()) {
	// System.out.println(matcher.group(0));
	// }
	// }

	// public void WgetNews() throws SQLException, UnsupportedEncodingException
	// {
	// String newsname = "新闻";/*
	// * new String(ServletActionContext.getRequest()
	// * .
	// * getParameter("newsName").getBytes("iso8859-1"
	// * ), "utf-8");
	// */
	// Web_About_News_Impl aboutNewsImpl = new Web_About_News_Impl();
	// ArrayList<Web_About_News_Impl> Alist = new Web_AllImpl_DoAll(
	// aboutNewsImpl).QueryByCaseorTypeName("w_about_news",
	// "newsName", newsname);
	// new Web_AllImpl_DoAll(aboutNewsImpl).ClickNumInsert(Alist.get(0)
	// .getNewsClicks(), Alist.get(0).getId());
	//
	// // return SUCCESS;
	// }

	// public void a() throws SQLException{
	// Web_Case_Types_Impl typesImpl=new Web_Case_Types_Impl();
	// ArrayList<Web_Case_Types_Impl> Alist = new
	// Web_AllImpl_DoAll(typesImpl).QueryById("w_case_types",22);
	// typesImpl=Alist.get(0);
	// ArrayList<Web_Case_Types_Impl> ALLlist = new
	// Web_AllImpl_DoAll(typesImpl).QueryAll("w_case_types");
	// List<String> typelist = new ArrayList<String>();
	// typelist.add(0,"\""+typesImpl.getTypeName()+"\"");
	//		   
	// for(Web_Case_Types_Impl impl : ALLlist){
	// boolean a=true;
	// for(String typename : typelist){
	// if(("\""+impl.getTypeName()+"\"").equals(typename)){
	// a=false;
	// }
	// }
	// if(a){
	// typelist.add("\""+impl.getTypeName()+"\"");
	// }
	// }
	// System.out.println(typelist.toString());
	// }
}
