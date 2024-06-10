package com.bookshop.per;

import java.util.List;

import com.bookshop.domain.Inventory;

public interface InventoryMapper {
	public int getTotalCount();
	public Inventory getInventory(int product_id);
	public List<Inventory> getInventoryList();
	public void insInventory(Inventory inventory);
	public void upInventory(Inventory inventory);
	public void delInventory(int ino);
	public int priceCount(int ino);
	public int getAmount(int amount);
	
	void upInventorystauc(int product_id,int statuc);
	void outInventory(int productId, int amount);
	void returnInventory(int productId, int amount);
}
