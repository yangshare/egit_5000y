package com.jkx.web.ImplAction;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jkx.web.Impl.Web_User_Impl;
import com.jkx.web.Query.Web_AllImpl_DoAll;
import com.opensymphony.xwork2.ActionSupport;

public class Web_wUser_Action extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String json;
	
	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	@SuppressWarnings("unchecked")
	public String update(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		String username=request.getParameter("username");
		String password=request.getParameter("userpwd");
		Web_User_Impl userImpl=new Web_User_Impl();
		int i = new Web_AllImpl_DoAll(userImpl).UpdateById("w_user", id, "username",  username);
		int j = new Web_AllImpl_DoAll(userImpl).UpdateById("w_user", id, "password", password);
		if(i>0 && j>0){
			request.getSession().setAttribute("user", username);
			request.getSession().setAttribute("pwd", password);
			json="密码修改成功！";
		}else{
			json="密码修改失败！";
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String insert(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username=request.getParameter("username");
		String password=request.getParameter("userpwd");
		Web_User_Impl userImpl=new Web_User_Impl();
		if(new Web_AllImpl_DoAll(userImpl).CheackRename("w_user", "username", username)){
		int i = new Web_AllImpl_DoAll(userImpl).Insert("w_user", "username", "password", username, password);
		if(i>0){
			json="新增账号成功！";
		}else{
			json="新增账号失败！";
		}
		}else{
			json="账号重名，请重新设定账号名！";
		}
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String delete() throws SQLException{
		HttpServletRequest request = ServletActionContext.getRequest();
		int i=0;
		String username=request.getParameter("username");
		String password=request.getParameter("userpwd");
		Web_User_Impl userImpl=new Web_User_Impl();
		ArrayList<Web_User_Impl> Alist=new Web_AllImpl_DoAll(userImpl).QueryByCaseorTypeName("w_user", "password", password);
		if(Alist!=null){
			for(Web_User_Impl impl : Alist){
				if(impl.getUserName().equals(username)){
					i = new Web_AllImpl_DoAll(userImpl).DeleteById("w_user", impl.getId());
				}
			}
		}
		
		if(i>0){
			json="删除账号成功！";
		}else{
			json="删除账号失败！";
		}
		return SUCCESS;
	}
}
