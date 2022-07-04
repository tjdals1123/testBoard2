package org.ict.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		log.info("실행 된거 맞아?");
		if(session.getAttribute("login") == null) {
			log.info("current user id not logined");
			
			saveDest(request);
			
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}
	
	private void saveDest(HttpServletRequest req) {
		log.info("실행 된거 맞아?");
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		log.info(uri);
		log.info(query);
		
		if(query == null || query.equals("null")) {
			
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			
			log.info("dest : " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
}










