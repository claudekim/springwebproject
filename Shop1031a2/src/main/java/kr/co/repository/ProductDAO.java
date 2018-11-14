package kr.co.repository;



import java.util.List;

import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;

public interface ProductDAO {
	
	void create (ProductVO pvo) throws Exception;
	List<String> category1List() throws Exception;
	List<String> category2List(String Category1) throws Exception;
}
