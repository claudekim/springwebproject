package kr.co.aop;

//import java.lang.reflect.Array;
//import java.util.Arrays;
//import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {
/*	
	@Before("execution(* kr.co.service.MsgService*.*(..))")
	public void startLog() {
		System.out.println("<======Before======>");
		System.out.println("<======Before======>");
	}
	@After("execution(* kr.co.service.MsgService*.*(..))")
	public void endLog(JoinPoint jp) {
		System.out.println("<#####After#####>");
		System.out.println(jp.getArgs().toString());
		System.out.println(Arrays.toString(jp.getArgs()));
		System.out.println("<#####After#####>");
	}
	*/
	
	@Around("execution(* kr.co.service.MsgService*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable{
		Object result=null;
		System.out.println(">>전");
		long st = System.currentTimeMillis();
		
		
		result = pjp.proceed();//위 전 아래 후 
		System.out.println(">>후");
		long et = System.currentTimeMillis();
		System.out.println("시간 얼마나 걸렸으? : "+(et-st));
		
		return result;
	}
}
