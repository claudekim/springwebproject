package kr.co.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	private final String LOGIN="login";
	
	@Override//컨트롤러 지나기 전에
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("= = =LoginInterceptor  preHandle= = = = =");
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN)!=null) {
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

	
	@Override//컨트롤러 불러오고 나서 
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("= = =LoginInterceptor  postHandle= = = = =");
		
		HttpSession session = request.getSession();
		
		ModelMap map = modelAndView.getModelMap();
		Object vo = map.get("vo");
		
		if(vo!=null) {
			session.setAttribute(LOGIN,vo);
			if(request.getParameter("useCookie")!=null) {
				
				UserVO userVo= (UserVO) vo;
				Cookie loginCookie1 = new Cookie("loginCookie1", userVo.getId());
				loginCookie1.setPath("/");
				loginCookie1.setMaxAge(60*2);
				response.addCookie(loginCookie1);
				
				
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*2);
				response.addCookie(loginCookie);
				System.out.println(" LoginInterceptor.java 쿠키내용 >>" +loginCookie);
			}
			
			Object dest = session.getAttribute("dest");
			
			if(dest!=null) {//로그인전에 글쓰려다 강제 이동당했을때
				//원래가려고했던 주소로 이동하자
				
				response.sendRedirect((String)dest);
				System.out.println("LoginInterceptor >> dest있을때 > (( "+vo+" )) \n 가려고한곳 :: "+dest);
				session.removeAttribute("dest");
			}else {
				//착하게 로그인부터 하려던 애라서 걍 인덱스로 가면되나봄!
				
				response.sendRedirect("/");
				System.out.println("LoginInterceptor >> dest없을때 > "+vo);
				
			}
			
			
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
