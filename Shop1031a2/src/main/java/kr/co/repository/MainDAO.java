package kr.co.repository;

import java.util.List;

import kr.co.domain.BestListCriteria;
import kr.co.domain.CartListVO;
import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;

public interface MainDAO {
	
	List<ProductVO> bestList() throws Exception;// 판매순위대로 불러올때
	List<ProductVO> newList() throws Exception;// 신규순위대로 불러올때
	
	List<ProductVO> clickCategory1(String category1) throws Exception;//대분류 눌렀을때
	List<ProductVO> bestCategory1List(String category1) throws Exception;//대분류 눌렀을때 베스트
	
	List<ProductVO> clickCategory2(String category2) throws Exception;//소분류 눌렀을때
	List<ProductVO> bestCategory2List(String category2) throws Exception;//대분류 눌렀을때 베스트
	
	List<CategoryVO> category2Of1(String category1) throws Exception;//대분류 눌렀을때 소분류
	List<CategoryVO> navCategory() throws Exception;//대분류전체가져와
	
	ProductVO selectByProductNo(int productNo) throws Exception;//상세페이지에서 쓸거 번호로검색
	
	//디테일->장바구니 ---------------------------
	List<CartListVO> selectMyCartList(String id)throws Exception;//장바구니 보기(물건넣는거아니고 그냥 보고싶을때)
	List<CartListVO> alreadyMyCartList(String id, int productNo) throws Exception;//카트리스트에 같은물건 존재하냐확인
	void updateCartListPlus(String id, int productNo, int productQuantity);// 있는물건 수량 업데이트!
	int getCartListNum();//장바구니 넘버 최신꺼 카운트해서 넣을려고
	void makeCartList(CartListVO cartList)throws Exception;//카트리스트에 물건 넣기
	ProductVO selectMyProduct(int num);//카트리스트에 저장된 번호로 물건 값 가져오기
	void deleteOneCartList(String id, int cartListNum) throws Exception;//장바구니에서 물건 하나 삭제
	void deleteAllCartList(String id)throws Exception;//장바구니에서 물건 하나 삭제
	void updateCartListChange(String id, int cartListNum, int productQuantity);// 있는물건 수량 업데이트! 아예 체인지

	int getBestListAmount();
	List<ProductVO> bestListCriteria(BestListCriteria cri) throws Exception;

}
