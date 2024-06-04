package com.bookshop.per;

import java.util.List;
import java.util.Map;

import com.bookshop.domain.Product;

public interface ProductMapper {
	public List<Product> getProductList(Map<String, Object> paramMap);
	public List<Product> getBigCategoryList(Map<String, Object> paramMap);
	public List<Product> getSmallCategoryList(Map<String, Object> paramMap);
	public int allProductCount();
	public int bigCount(String category1);
	public int smallCount(String category2);
	public Product getProduct(String pid);
	public void insProduct(Product product);
	public void upStar(Map<String, Object> paramMap);
	public void upProduct(Product product);
	public void delProduct(String pid);
} 
