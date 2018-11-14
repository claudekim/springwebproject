package kr.co.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;

public interface ProductService {
	void create (ProductVO pvo) throws Exception;
	List<String> category1List() throws Exception;
	List<String> category2List(String Category1) throws Exception;
}
