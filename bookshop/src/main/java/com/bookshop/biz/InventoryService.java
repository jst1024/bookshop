package com.bookshop.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.domain.Inventory;
import com.bookshop.per.InventoryMapper;

@Service
public class InventoryService implements InventoryBiz{

	@Autowired
	private InventoryMapper inventoryDAO;

	@Override
	public int getTotalCount() {
		return inventoryDAO.getTotalCount();
	}

	@Override
	public Inventory getInventory(int product_id) {
		return inventoryDAO.getInventory(product_id);
	}

	@Override
	public List<Inventory> getInventoryList() {
		return inventoryDAO.getInventoryList();
	}

	@Override
	public void insInventory(Inventory inventory) {
		inventoryDAO.insInventory(inventory);
	}

	@Override
	public void upInventory(Inventory inventory) {
		inventoryDAO.upInventory(inventory);
	}

	@Override
	public void delInventory(int ino) {
		inventoryDAO.delInventory(ino);
	}

	@Override
	public int priceCount(int ino) {
		return inventoryDAO.priceCount(ino);
	}

	@Override
	public int getAmount(int amount) {
		return inventoryDAO.getAmount(amount);
	}

	@Override
	public void upInventorystauc(int product_id, int statuc) {
		inventoryDAO.upInventorystauc(product_id, statuc);
	}

	@Override
    public void outInventory(int product_id, int amount) {
        inventoryDAO.outInventory(product_id,amount);
	}
	
    @Override
    public void returnInventory(int product_id, int amount) {
        inventoryDAO.returnInventory(product_id,amount);
    }
	
}