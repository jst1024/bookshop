package com.bookshop.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.domain.Product;
import com.bookshop.per.ProductMapper;

@Service
public class ProductService implements ProductBiz {

	private ProductMapper productDAO;
	
	@Autowired
	public ProductService(ProductMapper productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<Product> getProductList(String sortMethod) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("sortMethod", sortMethod);
		return productDAO.getProductList(paramMap);
	}

	@Override
	public List<Product> getBigCategoryList(String sortMethod, String category1) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("sortMethod", sortMethod);
		paramMap.put("category1", category1);
		return productDAO.getBigCategoryList(paramMap);
	}

	@Override
	public List<Product> getSmallCategoryList(String sortMethod, String category2) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("sortMethod", sortMethod);
		paramMap.put("category2", category2);
		return productDAO.getSmallCategoryList(paramMap);
	}

	@Override
	public int allProductCount() {
		return productDAO.allProductCount();
	}

	@Override
	public int bigCount(String category1) {
		return productDAO.bigCount(category1);
	}

	@Override
	public int smallCount(String category2) {
		return productDAO.smallCount(category2);
	}

	@Override
	public Product getProduct(String pid) {
		return productDAO.getProduct(pid);
	}

	@Override
	public void insProduct(Product product) {
		productDAO.insProduct(product);
	}

	@Override
	public void upProduct(Product product) {
		productDAO.upProduct(product);
	}
	
	@Override
	public void delProduct(String pid) {
		productDAO.delProduct(pid);;
	}

}
