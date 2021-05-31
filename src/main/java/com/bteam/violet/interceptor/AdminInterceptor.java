package com.bteam.violet.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bteam.violet.domain.CustVO;

/*
public class AdminInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		
		HttpSession session = req.getSession();
		CustVO cust = (CustVO)session.getAttribute("cust");
	
		if(cust == null) {
			System.out.println("interceptor ing...");
			res.sendRedirect("/violet/");
			return false;
		}
		
		return true;
	}
}*/
