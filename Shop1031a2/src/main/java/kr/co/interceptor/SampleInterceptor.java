package kr.co.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//return super.preHandle(request, response, handler);
		System.out.println("::::::::::::::::::preHandle()::::::::::::::::::::::");
		HandlerMethod hm=(HandlerMethod)handler;
		System.out.println("::::::::::::::::::handler()::::::::::::::::::::::" +hm.getBean());
		System.out.println("::::::::::::::::::handler()::::::::::::::::::::::" +hm.getMethod());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		//super.postHandle(request, response, handler, modelAndView);
		Object model2 =  modelAndView.getModel().get("result");
		Object model =  modelAndView.getModel().put("result", "heelowaeiraosiejro");
		System.out.println("::::::::::::::::::model2:::::::::::::>>"+model2);
		System.out.println("::::::::::::::::::model:::::::::::::>>"+model);
		
		if(model!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("result", model);
			response.sendRedirect("/doB");
			
		}
		System.out.println("::::::::::::::::::postHandle()::::::::::::::::::::::");
		
		
	}


}
