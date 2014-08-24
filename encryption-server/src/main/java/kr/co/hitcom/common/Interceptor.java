package kr.co.hitcom.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.hitcom.rent.member.MemberVO;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	/**
	 * Logger for this class
	 */
	private static final Logger LOGGER = Logger.getLogger(Interceptor.class);
	
//	@Autowired
//	private LocaleResolver localeResolver;
        	
	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		MemberVO memberInfo = (MemberVO) request.getSession().getAttribute("SESSION_MEMBER_INFO");
		
		//로그인 체크
		String uri = request.getRequestURI();
		/*
		String serviceName = uri.substring((uri.lastIndexOf("/")+1), uri.length());
		if( null == memberInfo && !serviceName.equals("loginPage.do") && !serviceName.equals("joinPage.do")
				&& !serviceName.equals("login.do") && !serviceName.equals("join.do")){
			response.sendRedirect("/whollyrental/loginPage.do");
			return false;
		}
		*/
		System.out.println("====>" + uri);
		String serviceName = uri.substring((uri.lastIndexOf(".")+1), uri.length());
		if( null == memberInfo && serviceName.equals("lo")){
			response.sendRedirect("/loginPage.do");
			return false;
		}
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
