package kr.co.controller;

import java.lang.annotation.Repeatable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;
import kr.co.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@ResponseBody
	@RequestMapping("/getCategory2/{category1}")
	public List<String> getCategory1(@PathVariable String category1) throws Exception{
		List<String> list = service.category2List(category1);
		
		
		return list;
	}


	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(Model model) throws Exception {
	List<String> category1List = service.category1List();
	List<String> category2List = service.category2List("바지");
	model.addAttribute("category1List", category1List);
	model.addAttribute("category2List", category2List);
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(ProductVO pvo) throws Exception{			

		if(pvo.getProductImgPath()==null) {
			pvo.setProductImgPath("이미지없음");
		}
		
		service.create(pvo);
		return "redirect:/";
	}
}
