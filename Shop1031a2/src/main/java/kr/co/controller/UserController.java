package kr.co.controller;

import java.util.Date;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;
import kr.co.service.MainService;
import kr.co.service.UserService;
//import kr.co.service.UserService;
import kr.co.util.UploadFileUtils;

@Controller
@RequestMapping("/user")
public class UserController {
	@Inject
	private UserService service;
	
	//회원가입페이지 열기--------------------------------------
	@RequestMapping(value="/join" , method = RequestMethod.GET)
	public void join() throws Exception{
		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("UserController>>>> Join GET");
		
	}

	//회원가입데이터 인설트하기--------------------------------------
	@RequestMapping(value="/join" , method = RequestMethod.POST)
	public String join(UserVO vo,RedirectAttributes rttr) throws Exception{
		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("UserController>>>> Join POST");
		System.out.println("들어온값 > " +vo);
		service.joinUs(vo);
		rttr.addFlashAttribute("msg", "INSERT_SUCCESS");
		
		return "redirect:/main/index";
	}
	
	//회원가입할때 아이디 체크하기--------------------------------------
	@ResponseBody
	@RequestMapping(value = "/idCheck/{id}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> idCheck(@PathVariable String id) throws Exception {

		ResponseEntity<String> entity = null;
		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("UserController>>>> idCheck POST");
		System.out.println("=======idCheckAjax=======");
		
		try {
			UserVO userId=service.idCheck(id);
			System.out.println("들어온id  >>"+id+" / idCheck 돌린거 >> " +userId+ " (null이면 DB에 없는 것)");
			
			if(userId==null) {
				entity = new ResponseEntity<String>("ID_사용가능", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	//로그인페이지가기--------------------------------------
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	public void login(LoginDTO dto) throws Exception{

		System.out.println();
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("UserController>>>> login GET");
		
	}

	//로그인하기--------------------------------------
	@RequestMapping(value="/login" , method = RequestMethod.POST)
	public void login(LoginDTO dto, Model model , HttpSession session) throws Exception{
		
		UserVO vo=service.login(dto);
		if(vo==null) {
			return;//다시 겟방식 로그인으로 이동
		}
		model.addAttribute("vo",vo);
		if(dto.isUseCookie()) {
			int amount = 60*2;
			Date sessionLimit = new Date(System.currentTimeMillis()+(amount*1000));
			service.keepLogin(vo.getId(), session.getId(), sessionLimit);
		}
		
		System.out.println("UserController>>>> login POST (( "+vo.getId()+" //"+vo.getPw()+"))" );
	}

	//마이페이지가기--------------------------------------
		@RequestMapping(value="/myPage" , method = RequestMethod.GET)
		public void myPage() throws Exception{

			System.out.println();
			System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
			System.out.println("UserController>>>> login GET");
			
		}

		
		
		
		
		
		
		
}
