package com.bookshop.per;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.domain.Product;

@Repository
public class ProductDAO implements ProductMapper {

	private SqlSession sqlSession; 

	@Autowired
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Product> getProductList(Map<String, Object> paramMap) {
		return sqlSession.selectList("product.getProductList", paramMap);
	}

	@Override
	public List<Product> getBigCategoryList(Map<String, Object> paramMap) {
		return sqlSession.selectList("product.getBigCategoryList", paramMap);
	}

	@Override
	public List<Product> getSmallCategoryList(Map<String, Object> paramMap) {
		return sqlSession.selectList("product.getSmallCategoryList", paramMap);
	}

	@Override
	public int allProductCount() {
		return sqlSession.selectOne("product.allProductCount");
	}

	@Override
	public int bigCount(String category1) {
		return sqlSession.selectOne("product.bigCount", category1);
	}

	@Override
	public int smallCount(String category2) {
		return sqlSession.selectOne("product.smallCount", category2);
	}

	@Override
	public Product getProduct(String pid) {
		return sqlSession.selectOne("product.getProduct", pid);
	}

	@Override
	public void insProduct(Product product) {
		sqlSession.insert("product.insProduct", product);
	}

	@Override
	public void upStar(Map<String, Object> paramMap) {
		sqlSession.update("product.upStar", paramMap);
	}
	
	@Override
	public void upProduct(Product product) {
		sqlSession.update("product.upProduct", product);
	}

	@Override
	public void delProduct(String pid) {
		sqlSession.delete("product.delProduct", pid);
	}

}
