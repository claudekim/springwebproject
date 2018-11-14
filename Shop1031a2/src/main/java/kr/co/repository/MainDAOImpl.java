package kr.co.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.BestListCriteria;
import kr.co.domain.CartListVO;
import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;

@Repository
@Transactional
public class MainDAOImpl implements MainDAO {

	private final String NS = "ma.i.n";

	@Autowired
	private SqlSession session;

	@Override
	public List<ProductVO> bestList() throws Exception { 
	// 판매순위대로 불러올때
		
		return session.selectList(NS + ".bestList");
	}
	
	@Override
	public List<ProductVO> newList() throws Exception {
		// 신규순위대로 불러올때
		
		return session.selectList(NS + ".newList");
	}
	
	@Override
	public List<ProductVO> clickCategory1(String category1) throws Exception {
		//대분류 눌렀을때

		return  session.selectList(NS + ".clickCategory1",category1);
	}
	
	@Override
	public List<ProductVO> bestCategory1List(String category1) throws Exception{
		//대분류 눌렀을때 베스트
		
		return session.selectList(NS + ".bestCategory1List",category1);
	}
	
	@Override
	public List<ProductVO> clickCategory2(String category2) throws Exception {
		//소분류 눌렀을때
		
		return session.selectList(NS + ".clickCategory2",category2);
	}
	
	@Override
	public List<ProductVO> bestCategory2List(String category2) throws Exception {
		//소분류 눌렀을때 베스트

		return session.selectList(NS + ".bestCategory2List",category2);
	}

	@Override
	public List<CategoryVO> category2Of1(String category1) throws Exception {
		//대분류 눌렀을때 소분류
		return session.selectList(NS + ".category2Of1", category1);
	}

	@Override
	public List<CategoryVO> navCategory() throws Exception {
		//네비에 올릴 분류리스트
		return session.selectList(NS + ".navCategory");
	}

	@Override
	public ProductVO selectByProductNo(int productNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NS + ".selectByProductNo",productNo);
	}

	@Override
	public List<CartListVO> selectMyCartList(String id) {
		// TODO Auto-generated method stub
		System.out.println();
		System.out.println("MainDAOImpl.java >>selectMyCartList");
		return session.selectList(NS + ".selectMyCartList",id);
	}
	@Override
	public ProductVO selectMyProduct(int num) {
		// TODO Auto-generated method stub
		System.out.println();
		System.out.println("MainDAOImpl.java >>selectMyProduct");
		return session.selectOne(NS + ".selectMyProduct", num);
	}


	@Override//카트리스트에 같은물건 존재하냐확인
	public List<CartListVO> alreadyMyCartList(String id, int productNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println();
		System.out.println("MainDAOImpl.java >>alreadyMyCartList");
		System.out.println("아이디 >> "+id);
		System.out.println("물건번호 >> "+productNo);
		System.out.println("들어온 값에 맞는 값이 있는지 확인할게요!");
		Map<String, Object> map =	new HashMap<String, Object>();
		map.put("id", id);
		map.put("productNo", productNo);
		return session.selectList(NS + ".alreadyMyCartList",map);
	}

	@Override// 있는물건 수량 업데이트!
	public void updateCartListPlus(String id, int productNo, int productQuantity) {
		System.out.println();
		System.out.println("MainDAOImpl.java >>updateCartListPlus");
		System.out.println("아이디 >> "+id);
		System.out.println("물건번호 >> "+productNo);
		System.out.println("물건수량 >> "+productQuantity);
		Map<String, Object> map =	new HashMap<String, Object>();
		map.put("id", id);
		map.put("productNo", productNo);
		map.put("productQuantity", productQuantity);
		
		session.update(NS + ".updateCartListPlus",map);
	}

	@Override//카트리스트에 신규번호 만들기
	public int getCartListNum() {
		// TODO Auto-generated method stub
		System.out.println("카트리스트에 신규번호 만들기");
		Integer select = session.selectOne(NS + ".getCartListNum");
		System.out.println("select >> " +select);
		if(select==null) {
			return 0;
		}
		
		return session.selectOne(NS + ".getCartListNum");
	}

	@Override //카트리스트에 등록
	public void makeCartList(CartListVO cartList) {
		// TODO Auto-generated method stub
		System.out.println();
		System.out.println("MainDAOImpl.java >>makeCartList");
		System.out.println("넣기시작 > "+cartList);
		session.insert(NS + ".makeCartList",cartList);
		System.out.println("저장완료");
		
	}
	@Override //카트리스트에서 하나 삭제
	public void deleteOneCartList(String id, int cartListNum) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("MainDAOImpl.java >>deleteOneCartList");
		Map<String, Object> map =	new HashMap<String, Object>();
		map.put("id", id);
		map.put("cartListNum", cartListNum);
		session.delete(NS + ".deleteOneCartList",map);
	}

	@Override //카트리스트에서 물건 다  삭제
	public void deleteAllCartList(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("MainDAOImpl.java >>deleteAllCartList 모두삭제");
		session.delete(NS + ".deleteAllCartList",id);
		
	}
	@Override//카트리스트에서 물건 수량변경
	public void updateCartListChange(String id, int cartListNum, int productQuantity) {
		// TODO Auto-generated method stub
		System.out.println();
		System.out.println("MainDAOImpl.java >>updateCartListChange");
		System.out.println("아이디 >> "+id);
		System.out.println("물건번호 >> "+cartListNum);
		System.out.println("물건수량 >> "+productQuantity);
		Map<String, Object> map =	new HashMap<String, Object>();
		map.put("id", id);
		map.put("cartListNum", cartListNum);
		map.put("productQuantity", productQuantity);
		
		session.update(NS + ".updateCartListChange",map);
		
	}

	@Override //베스트 페이징
	public int getBestListAmount() {
		return session.selectOne(NS + ".getBestListAmount");
	}

	@Override //베스트 페이징
	public List<ProductVO> bestListCriteria(BestListCriteria cri) throws Exception {
		RowBounds rowBounds = new RowBounds(cri.getStartNum() - 1, cri.getPerPage());
		return session.selectList(NS + ".bestList", 0, rowBounds);
	}



	
	
}
