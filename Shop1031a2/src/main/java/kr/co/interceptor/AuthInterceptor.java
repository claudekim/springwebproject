package kr.co.interceptor;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.domain.UserVO;
import kr.co.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println( "AuthInterceptor >> 시작"  );
		HttpSession session =  request.getSession();
		UserVO vo = (UserVO) session.getAttribute("login");

		//서버 아이피 랑 
		//서버 접속아이피
		String rip = request.getRemoteHost();
		String ip = request.getLocalAddr();//내꺼..?
		
		System.out.println("rip > "+ rip);
		System.out.println("ip > "+ ip);
		
		if(vo==null) {//로그인안하고 들어왔을 때
			System.out.println( "AuthInterceptor >> 셋션없음" );
			
			String uri = request.getRequestURI();//가려고했던주소
			String query = request.getQueryString();//가지고가려했던쿼리
			
			if(query==null) {
				query = "";//쿼리값없으면걍 ㄱㄱ
			}else {
				query= "?"+query;//쿼리값있으면 +물음표
			}
			
			if(request.getMethod().equals("GET")) {
				session.setAttribute("dest",uri+query);
			}

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			Cookie loginCookie1 = WebUtils.getCookie(request, "loginCookie1");
			System.out.println( "AuthInterceptor 쿠키값 >> "+loginCookie );
			
			if(loginCookie!=null && loginCookie1!=null) {//쿠키가 있을떄
				System.out.println( "AuthInterceptor 쿠키값 .getValue() >> "+loginCookie.getValue() );
				
				//loginCookie1.getValue() 도 넣게 바꿔야해
				UserVO userVo = service.checkUserWithSessionKey(loginCookie.getValue());
				System.out.println( "AuthInterceptor 쿠키 userVo  >> "+ userVo  );
				
				if(userVo!=null) {//쿠키랑 userVo랑 맞을때
					session.setAttribute("login",userVo);
					System.out.println( "AuthInterceptor 쿠키있구나 자동로그인됬으야! 얼씨구야 ㅎㅎ" );
					return true;
					
				}
			}
			
			if(!request.getRequestURI().equals("/main/cartList")) {
				
				response.sendRedirect("/user/login");
				System.out.println( "AuthInterceptor 넌 쿠키도 없냐.." );
				return false;
				
			}
			
		} else {//로그인하고 들어왔을 때
			
			System.out.println( "AuthInterceptor >> 셋션있음 (( " +vo.getId()+" //"+vo.getPw()+" ))" );
			
		}

		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
