package kr.co.ca;

import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "redirect:/main/index";
	}
	
	
	
	@RequestMapping("/show33/{id}/{pw}")
	public void show2(@PathVariable String id, @PathVariable String pw ) {
		System.out.println("================");
		System.out.println(id);
		System.out.println(pw);
		System.out.println("================");
	}
	
	@RequestMapping("/show2/{pw}")
	public void show2(@PathVariable String pw ) {

		System.out.println("================");
		System.out.println(pw);
		System.out.println("================");
	}
	
	@RequestMapping("/show/{id}")//핸들러
	public void show(@PathVariable String id) {
		System.out.println("================");
		System.out.println(id);
		System.out.println("================");
	}
	@RequestMapping("/htest")
	public void htest() {
		
	}
}
