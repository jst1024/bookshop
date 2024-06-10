package com.bookshop.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.domain.Inventory;

@Repository
public class InventoryDAO implements InventoryMapper{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("Inventory.getTotalCount");
	}

	@Override
	public Inventory getInventory(int product_id) {
		return sqlSession.selectOne("Inventory.getInventory",product_id);
	}

	@Override
	public List<Inventory> getInventoryList() {
		return sqlSession.selectList("Inventory.getInventoryList");
	}

	@Override
	public void insInventory(Inventory inventory) {
		sqlSession.insert("Inventory.insInventory",inventory);
	}

	@Override
	public void upInventory(Inventory inventory) {
		sqlSession.update("Inventory.upInventory",inventory);
	}

	@Override
	public void delInventory(int ino) {
		sqlSession.delete("Inventory.delInventory",ino);
	}

	@Override
	public int priceCount(int ino) {
		return sqlSession.selectOne("Inventory.priceCount",ino);
	}

	@Override
	public int getAmount(int amount) {
		return sqlSession.selectOne("Inventory.getAmount",amount);
	}

	@Override
	public void upInventorystauc(int product_id, int statuc) {
		sqlSession.update("updateInventorystatuc",product_id);
		
	}

	@Override
    public void outInventory(int product_id, int amount) {
        sqlSession.update("outInventory",product_id);
	}
	
    @Override
    public void returnInventory(int product_id, int amount) {
        sqlSession.update("returnInventory",product_id);
    }
	
}
