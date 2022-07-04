package org.ict.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("login의 pre");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			log.info("clear login data before");
			
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		log.info("login의 post");
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object userVO = modelMap.get("userVO");
		
		if(userVO != null) {
			log.info("new login success");
			session.setAttribute(LOGIN, userVO);
			//response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			
			log.info("login의 post");
			
			response.sendRedirect(dest != null ? (String)dest : "/");
		}
		
	}
	
	
}













