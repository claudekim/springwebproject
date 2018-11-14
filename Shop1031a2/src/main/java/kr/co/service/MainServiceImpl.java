package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.domain.BestListCriteria;
import kr.co.domain.CartListVO;
import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;
import kr.co.repository.MainDAO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;

	@Override
	public List<ProductVO> bestList() throws Exception {
		// TODO Auto-generated method stub
		return dao.bestList();
	}

	@Override
	public List<ProductVO> newList() throws Exception {
		// TODO Auto-generated method stub
		return dao.newList();
	}

	@Override
	public List<ProductVO> clickCategory1(String category1) throws Exception {
		// TODO Auto-generated method stub
		return dao.clickCategory1(category1);
	}

	@Override
	public List<ProductVO> bestCategory1List(String category1) throws Exception {
		// TODO Auto-generated method stub
		return dao.bestCategory1List(category1);
	}
	
	@Override
	public List<ProductVO> clickCategory2(String category2) throws Exception {
		// TODO Auto-generated method stub
		return  dao.clickCategory2(category2);
	}

	@Override
	public List<ProductVO> bestCategory2List(String category2) throws Exception {
		// TODO Auto-generated method stub
		return dao.bestCategory2List(category2);
	}

	@Override
	public List<CategoryVO> category2Of1(String category1) throws Exception {
		// ;//대분류 눌렀을때 소분류
		return dao.category2Of1(category1);
	}

	@Override
	public List<CategoryVO> navCategory() throws Exception {
		// 네비에쓸분
		return dao.navCategory();
	}

	@Override
	public ProductVO selectByProductNo(int productNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectByProductNo(productNo);
	}

	@Override
	public List<CartListVO> selectMyCartList(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMyCartList(id);
	}	
	@Override
	public ProductVO selectMyProduct(int num) {
		// TODO Auto-generated method stub
		return dao.selectMyProduct(num);
	}

	@Override
	public int getCartListNum() {
		// TODO Auto-generated method stub
		return dao.getCartListNum();
	}

	@Override
	public void makeCartList(CartListVO cartList) throws Exception {
		// TODO Auto-generated method stub
		dao.makeCartList(cartList);
	}

	@Override
	public List<CartListVO> alreadyMyCartList(String id, int productNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.alreadyMyCartList(id,productNo);
	}

	@Override
	public void updateCartListPlus(String id, int productNo, int productQuantity) {
		// TODO Auto-generated method stub
		dao.updateCartListPlus(id,productNo,productQuantity);
		
	}

	@Override
	public void deleteOneCartList(String id, int cartListNum) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteOneCartList(id,cartListNum);
	}

	@Override
	public void deleteAllCartList(String id) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAllCartList(id);
	}

	@Override
	public void updateCartListChange(String id, int cartListNum, int productQuantity) {
		// TODO Auto-generated method stub
		dao.updateCartListChange(id, cartListNum, productQuantity);
	}

	@Override
	public int getBestListAmount() {
		return dao.getBestListAmount();
	}

	@Override
	public List<ProductVO> bestListCriteria(BestListCriteria cri) throws Exception {
		return dao.bestListCriteria(cri);
	}


	
}
