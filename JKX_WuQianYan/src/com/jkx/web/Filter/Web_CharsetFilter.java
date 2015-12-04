package com.jkx.web.Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Web_CharsetFilter implements Filter {
	
	private String characterEncoding;// 字符编码

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 字符编码处理
		request.setCharacterEncoding(characterEncoding);
		response.setCharacterEncoding(characterEncoding);
		// System.out.println("过滤器使用的编码集："+characterEncoding);
		chain.doFilter(request, response); // 执行下一个Filter
	}

	public void init(FilterConfig config) throws ServletException {
		// 从web获取参数
		characterEncoding = config.getInitParameter("encoding");
	}

}
