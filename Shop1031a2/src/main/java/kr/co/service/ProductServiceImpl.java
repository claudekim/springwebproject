package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.CategoryVO;
import kr.co.domain.ProductVO;
import kr.co.repository.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO dao;

	@Override
	public void create(ProductVO pvo) throws Exception {
		dao.create(pvo);
	}

	@Override
	public List<String> category1List() throws Exception {
		return dao.category1List();
	}

	@Override
	public List<String> category2List(String Category1) throws Exception {
		return dao.category2List(Category1);
	}

}
