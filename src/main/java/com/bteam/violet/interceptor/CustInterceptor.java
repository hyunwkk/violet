package com.bteam.violet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
				
		try {
			if(req.getSession().getAttribute("member") == null) {
				if(req.getSession().getAttribute("admin") == null) {
					log.info("회원이 아닙니다. 로그인하세요!");
					res.sendRedirect("/violet/cust/login");
					return false;
				}
			}	
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

}
