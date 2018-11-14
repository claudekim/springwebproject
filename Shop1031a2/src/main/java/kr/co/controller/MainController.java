package kr.co.controller;

import java.io.File;


import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.BestListCriteria;
import kr.co.domain.BestListPageMaker;
import kr.co.domain.BoardVO;
import kr.co.domain.CartListVO;
import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;
import kr.co.domain.ReplyVO;
import kr.co.domain.UserVO;
import kr.co.repository.MainDAO;
import kr.co.service.MainService;
import kr.co.util.MediaUtils;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MainService service;

	//맨 처음 페이지---------------------------------------------------------
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void index(Model model) throws Exception {
		System.out.println();
		System.out.println("MainController > bestList");
		List<ProductVO> bestList6 = service.bestList();
		List<ProductVO> newList6 = service.newList();
		
		System.out.println("newList6 >" + newList6);
		System.out.println("bestList6 >" + bestList6);

		model.addAttribute("newList6",  newList6);
		model.addAttribute("bestList6",  bestList6);


		int a=4;
		int b=5;
		int c=0;
		System.out.println( "처음값 a = "+a+" / b = "+b+" / c = "+c);
		
		c=b;
		b=a;
		a=c;
		System.out.println( "처음값 a = "+a+" / b = "+b+" / c = "+c);
		//--------------------
		
		int aa=0;
		if(aa==0) {
			aa=(aa*-1)+1;			
			System.out.println("a가 0일때 "+aa+" 로 된다");
		}
		
		int aaa=1;
		if(aaa==1) {
			aaa=(aaa*-1)+1;			
			System.out.println("a가 1일때 "+aaa+" 로 된다");
		}
		
	}

	//베스트페이지---------------------------------------------------------
	@RequestMapping("/bestList")
	public void bestList(BestListCriteria cri, Model model) throws Exception {
		System.out.println("MainController > bestList");
		List<ProductVO> list = service.bestListCriteria(cri);
		model.addAttribute("list", list);
		System.out.println("list >> " + list);
		
		BestListPageMaker BestPm = new BestListPageMaker();
		BestPm.setCri(cri);
		
		int amount = service.getBestListAmount();
		BestPm.setAmount(amount);
		System.out.println("ddd" + amount);
		model.addAttribute("BestPm", BestPm);

	}

	//대분류 상의 바지 치마 잡화 눌렀을떄---------------------------------------------------------
	@RequestMapping(value ="/category1",method = RequestMethod.GET)
	public void clickCategory1(String category1 , String category2, Model model) throws Exception {
		System.out.println("대분류 > " +category1);
		List<ProductVO> bestCategory1List = service.bestCategory1List(category1);
		List<ProductVO> clickCategory1 = service.clickCategory1(category1);
		List<CategoryVO> category2Of1 = service.category2Of1(category1);
		

		System.out.println("MainController > clickCategory1");
		
		model.addAttribute("clickCategory1", clickCategory1);
		model.addAttribute("category2Of1", category2Of1);
		model.addAttribute("bestCategory1List", bestCategory1List);
	}
	
	

	//니트 아우터등 소분류메뉴 눌렀을떄---------------------------------------------------------
	@RequestMapping(value ="/category2",method = RequestMethod.GET)
	public void clickCategory2(String category1 , String category2,   Model model) throws Exception {
		
		System.out.println("MainController > clickCategory2");
		System.out.println("소분류 > " +category2);
		
		List<ProductVO> bestCategory2List = service.bestCategory2List(category2);//카테고리2베스트순 물건가져오기
		List<ProductVO> clickCategory2 = service.clickCategory2(category2);//카테고리2신규순물건가져오기
		List<CategoryVO> category2Of1 = service.category2Of1(category1);//카테1일때 나오는카테2불러오기
		System.out.println("카테고리2베스트순 >"+bestCategory2List);
		System.out.println("카테고리2신규순물건가져오기 >"+clickCategory2);
		System.out.println("카테2불러오기 >"+category2Of1);
		
		model.addAttribute("clickCategory2", clickCategory2);
		model.addAttribute("category2Of1", category2Of1);
		model.addAttribute("bestCategory2List", bestCategory2List);
		model.addAttribute("category2", category2);
	}

	//상세페이지------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value ="/detail",method = RequestMethod.GET)
	public void detail( int productNo,  Model model) throws Exception {
		System.out.println("MainController > detail");
		ProductVO product = service.selectByProductNo(productNo);
		System.out.println("상품번호 > " +productNo);
		model.addAttribute("product", product);
	}
	

	//카트>상단에서 들어갔을때------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value ="/cartList",method = RequestMethod.GET)
	public void cartList( String id,  Model model) throws Exception {
		System.out.println("MainController > cartListGET");
		System.out.println("id > "+ id);
		model.addAttribute("id", id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cartList/{id}", method = RequestMethod.GET)
	public ResponseEntity<List<CartListVO>> cartList(@PathVariable String id) {
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("cartList.java");
		System.out.println("====================");
		 ResponseEntity<List<CartListVO>> entity=null;
		 try {
			 List<CartListVO> cartList=service.selectMyCartList(id);
			 entity=new ResponseEntity<List<CartListVO>>(cartList,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			 entity=new ResponseEntity<List<CartListVO>>(HttpStatus.BAD_REQUEST);
		}
			return entity;
	}

	//장바구니에서 물건 삭제할때---------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/cartList/delete/{cartListNum}/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteOneCartList(@PathVariable int cartListNum, @PathVariable String id) {
		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("MainController >> cartDelete");
		System.out.println("====================");
		 ResponseEntity<String> entity=null;
		 try {
			 service.deleteOneCartList(id,cartListNum);
			 entity=new  ResponseEntity<String>("DELETE_OK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			 entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
			return entity;
	}
	//장바구니 다 삭제할때---------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/cartList/delete/{id}", method = RequestMethod.GET)
		public ResponseEntity<String> deleteAllCartList(@PathVariable String id) {
			System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
			System.out.println("MainController >> cartDelete");
			System.out.println("====================");
			 ResponseEntity<String> entity=null;
			 try {
				 service.deleteAllCartList(id);
				 entity=new  ResponseEntity<String>("DELETE_OK",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				 entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
				return entity;
		}
		//장바구니에서 수량 변경할때---------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/cartList/update/{cartListNum}/{ProductQuantity}/{id}", method = RequestMethod.GET)
		public ResponseEntity<String> updateCartListChange(@PathVariable int cartListNum, @PathVariable int ProductQuantity ,@PathVariable String id) {
			System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
			System.out.println("MainController >> updateCartList");
			System.out.println("====================");
			 ResponseEntity<String> entity=null;
			 try {
				 service.updateCartListChange(id,cartListNum,ProductQuantity);
				 entity=new  ResponseEntity<String>("UPDATE_OK",HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				 entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
				return entity;
		}
	
	
	
	//카트>상세페이지에서 수량 선택하고 들어갓ㅆ을때 들어갔을때---------------------------------------------------------

	@ResponseBody
	@RequestMapping(value = "/insertCartList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> insertCartList( CartListVO vo)  throws Exception {

		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("MainController > insertCartListPOST @ResponseBody");
		System.out.println("물건번호 >>"+ vo.getProductNo());
		System.out.println("물건이름 >>"+ vo.getProductName());
		System.out.println("물건가격 >>"+ vo.getProductPrice());
		System.out.println("물건수량 >>"+ vo.getProductQuantity());
		System.out.println("아이디 >>"+ vo.getId());
		System.out.println();
		ResponseEntity<String> entity = null;
		
		try {
			//들어온 값으로 아이
			List<CartListVO> myCartList = service.alreadyMyCartList(vo.getId() , vo.getProductNo());
			System.out.println("myCartList >> "+myCartList);
			
			if(myCartList.toString()=="[]") {//같은 값이 없을때
				System.out.println("새롭게 만들어야겠내요! ");
				int cartListNum=service.getCartListNum()+1;
				System.out.println("장바구니 번호생성 >>"+cartListNum);
				CartListVO cartList=new CartListVO(cartListNum, vo.getId(),  vo.getProductNo(),vo.getProductName(), vo.getProductPrice(),vo.getProductQuantity());
				System.out.println("cartList >> "+cartList);
				service.makeCartList(cartList);
				entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
			}else {//있을때
				System.out.println("이미 있으니 업데이트 하세요! ");
				entity = new ResponseEntity<String>("ALREADY", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	//상세에서 장바구니 넣기 눌렀는데 이미 장바구니에 있어서 혹시 너 장바구니꺼+지금 수량 할래 물어봐서 ㅇㅇ하면 업뎃해줄용
	@ResponseBody
	@RequestMapping(value = "/updateCartList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> updateCartListPlus( CartListVO vo)  throws Exception {

		System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓");
		System.out.println("MainController > updateCartListPlusPOST @ResponseBody");
		System.out.println("물건번호 >>"+ vo.getProductNo());
		System.out.println("물건수량 >>"+ vo.getProductQuantity());
		System.out.println("아이디 >>"+ vo.getId());
		System.out.println();
		ResponseEntity<String> entity = null;
		
		try {
			//들어온 값으로 아이
			service.updateCartListPlus(vo.getId(),vo.getProductNo(),vo.getProductQuantity());
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	


}
