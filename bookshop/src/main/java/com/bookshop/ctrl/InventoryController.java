package com.bookshop.ctrl;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop.biz.InventoryService;
import com.bookshop.biz.ProductService;
import com.bookshop.domain.Inventory;
import com.mysql.cj.Session;

@Controller
@RequestMapping("/inventory/")
public class InventoryController {

	private static final Logger log = LoggerFactory.getLogger(InventoryController.class);
	
	@Autowired
	private InventoryService inventoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private HttpSession session;	
	
	
	//재고 업데이트(Product Table)
	@GetMapping("upstock.do")   
	public String upstock(Model model) {
		return "";
	}
	
	//입/출고 총합 조회
	@GetMapping("total.do")
    public String total(Model model) {
        return "inventory/total";
    }
	
	//입고 싱픔 리스트 추가
	@RequestMapping("listInventory.do")
    public String getInventoryList(Model model) {
        model.addAttribute("list", inventoryService.getInventoryList());
        return "admin/inventory/list";
    }

    @GetMapping("insertInventory.do")
    public String insInventory(Model model) {
        return "admin/inventory/insert";
    }

    @PostMapping("insertInventoryPro.do")
    public String insInventoryPro(Inventory inventory, Model model) {
        inventoryService.insInventory(inventory);
        return "redirect:listInventory.do";
    }
	
    // 출고 및 반품을 처리하는 관리자 페이지로 이동 필요하면 사용하기!
    @GetMapping("adminInventory.do")
    public String manageInventory(Model model) {
        return "admin/inventory/admin";
    }

    // 출고 및 반품 처리
    @PostMapping("processInventory.do")
    public String processInventory(@RequestParam("product_id") int productId, @RequestParam("amount") int amount,@RequestParam("statuc") String statuc,Model model) {
        if ("out".equals(statuc)) {
            try {
                inventoryService.outInventory(productId, amount);
            } catch (IllegalArgumentException e) {
                model.addAttribute("error", e.getMessage());
                return "admin/inventory/admin";
            }
        } else if ("return".equals(statuc)) {
            try {
                inventoryService.returnInventory(productId, amount);
            } catch (IllegalArgumentException e) {
                model.addAttribute("error", e.getMessage());
                return "admin/inventory/admin";
            }
        }
        return "redirect:listInventory.do";
    }
}