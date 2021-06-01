package com.bteam.violet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
				
		try {
			if(req.getSession().getAttribute("admin") == null) {
				res.sendRedirect("/violet/");
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}
