package com.bteam.violet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
				
		try {
			if(req.getSession().getAttribute("admin") == null) {
				log.info("관리자가 아닙니다. 홈페이지로 이동합니다.");
				res.sendRedirect("/violet/");
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}
