package com.jkx.web.Filter;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Web_FileFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
        
        // 从session里取得登录认证
        String login = (String) session.getAttribute("login");

        if(path.contains("/admin/")){
        	// 登陆页面无需过滤
        	if(path.indexOf("/index.jsp") > -1) {
                chain.doFilter(servletRequest, servletResponse);
                return;
            }else{
            	// 判断如果没有取到认证,就跳转到登陆页面
                if (login == null || "".equals(login)) {
                    // 跳转到登陆页面
                	
                    servletResponse.sendRedirect("http://"+ InetAddress.getLocalHost()
                    		.getHostAddress().toString()+":8080/wuqianyan/admin/index.jsp?cheack=no");
                    
                } else {
                    // 已经登陆,放行此次请求
                    chain.doFilter(request, response);
                }
            }
        }else{
        	chain.doFilter(servletRequest, servletResponse);
        }

    }

    public void destroy() {
        // TODO Auto-generated method stub

    }

}