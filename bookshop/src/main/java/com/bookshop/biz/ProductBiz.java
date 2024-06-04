package com.bookshop.biz;

import java.util.List;

import com.bookshop.domain.Product;

public interface ProductBiz {
	public List<Product> getProductList(String sortMethod);
	public List<Product> getBigCategoryList(String sortMethod, String category1);
	public List<Product> getSmallCategoryList(String sortMethod, String category2);
	public int allProductCount();
	public int bigCount(String category1);
	public int smallCount(String category2);
	public Product getProduct(String pid);
	public void insProduct(Product product);
	public void upProduct(Product product);
	public void delProduct(String pid);
}
