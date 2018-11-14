package kr.co.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	private final String NS = "team.Product.a";
	
	@Autowired
	private SqlSession session;	

	@Override
	public void create(ProductVO pvo) throws Exception {
		Integer productNo = session.selectOne(NS + ".getProductNo");
		if(productNo != null) {
			++productNo;
		} else {			
			productNo = 1;
		}
		pvo.setProductNo(productNo);
		session.insert(NS + ".create", pvo);
	}

	@Override
	public List<String> category1List() throws Exception {		
		return session.selectList(NS + ".category1List");
	}

	@Override
	public List<String> category2List(String Category1) throws Exception {
		return session.selectList(NS + ".category2List", Category1);
	}

	
}
