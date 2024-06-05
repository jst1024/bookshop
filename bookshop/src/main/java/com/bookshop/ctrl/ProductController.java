package com.bookshop.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.biz.ProductBiz;
import com.bookshop.domain.Product;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	private ProductBiz productService;
	private String uploadLoc = "/resources/upload";

	@Autowired
	public ProductController(ProductBiz productService) {
		this.productService = productService;
	}
	
	@GetMapping("productList.do")
	public String productList(@RequestParam(defaultValue = "pdate") String sortMethod, Model model) {
		List<Product> productList = productService.getProductList(sortMethod);
		int allProductCount = productService.allProductCount();
		model.addAttribute("productList",productList);
		model.addAttribute("productCount", allProductCount);
		model.addAttribute("title", "종합");
		return "product/productList";
	}
	
	@GetMapping("bigCategoryList.do")
	public String bigCategoryList(@RequestParam(defaultValue = "pdate") String sortMethod, @RequestParam("category1") String category1, Model model) {
		List<Product> bigCategoryList = productService.getBigCategoryList(sortMethod, category1);
		int bigCount = productService.bigCount(category1);
		model.addAttribute("productList", bigCategoryList);
		model.addAttribute("productCount", bigCount);
		
		String title = "";
		
		if(category1.equals("Literature")) {
			title = "문학";
		} else if(category1.equals("TripleSubject")) {
			title = "인문·사회·과학";
		} else if(category1.equals("Art")) {
			title = "예술";
		}
		
		model.addAttribute("title", title);
		
		return "product/productList";
	}
	
	@GetMapping("smallCategoryList.do")
	public String smallCategoryList(@RequestParam(defaultValue = "pdate") String sortMethod, @RequestParam("category2") String category2, Model model) {
		List<Product> smallCategoryList = productService.getSmallCategoryList(sortMethod, category2);
		int smallCount = productService.smallCount(category2);
		model.addAttribute("productList", smallCategoryList);
		model.addAttribute("productCount", smallCount);
		
		String title = "";
		
		if(category2.equals("Novels")) {
			title = "소설";
		} else if(category2.equals("Poetry")) {
			title = "시";
		} else if(category2.equals("ChildrenStories")) {
			title = "동화";
		} else if(category2.equals("Essays")) {
			title = "시";
		} else if(category2.equals("Humanities")) {
			title = "인문";
		} else if(category2.equals("SocialSciences")) {
			title = "사회";
		} else if(category2.equals("Science")) {
			title = "과학";
		} else if(category2.equals("Illustrations")) {
			title = "일러스트";
		} else if(category2.equals("PhotoAlbums")) {
			title = "사진집";
		} else if(category2.equals("Comics")) {
			title = "만화";
		}
		
		model.addAttribute("title", title);
		
		return "product/productList";
	}
	
	@GetMapping("getProduct.do")
	public String getProduct(@RequestParam("pid") String pid, Model model) {
		Product product = productService.getProduct(pid);
		//나중에 리뷰 리스트 받아서 model로 보내야함
		
		model.addAttribute("product",product);
		return "product/getProduct";
	}
	
	@GetMapping("insProduct.do")
	public String insProduct(Model model) {
		return "product/insProduct";
	}
	
	@PostMapping("insProductPro.do")
	public String insProductPro(@RequestParam("category1") String category1,
			@RequestParam("category2") String category2,
			@RequestParam("pname") String pname,
			@RequestParam("subtitle") String subtitle,
			@RequestParam("price") int price,
			@RequestParam("author") String author,
			@RequestParam("content") String content,
			@RequestParam("company") String company,
			@RequestParam("img1") MultipartFile img1,
			@RequestParam("img2") MultipartFile img2,
			@RequestParam("img3") MultipartFile img3,
			@RequestParam("img4") MultipartFile img4,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String uploadDir = request.getServletContext().getRealPath(uploadLoc);
		File dir = new File(uploadDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String img1Name = "";
		String img2Name = "";
		String img3Name = "";
		String img4Name = "";
		
		try {
			if(!img1.isEmpty()) {
				img1Name = saveFile(img1, uploadDir);
			}
			
			if(!img2.isEmpty()) {
				img2Name = saveFile(img2, uploadDir);
			}
			
			if(!img3.isEmpty()) {
				img3Name = saveFile(img3, uploadDir);
			}
			
			if(!img4.isEmpty()) {
				img4Name = saveFile(img4, uploadDir);
			}
		} catch(IOException e) {
			log.error("예외 : {}", e);
		}
		
		Product product = new Product();
		product.setCategory1(category1);
		product.setCategory2(category2);
		product.setPname(pname);
		product.setSubtitle(subtitle);
		product.setPrice(price);
		product.setAuthor(author);
		product.setContent(content);
		product.setCompany(company);
		product.setImg1(img1Name);
		product.setImg2(img2Name);
		product.setImg3(img3Name);
		product.setImg4(img4Name);
		
		productService.insProduct(product);
		
		return "redirect:productList.do";
	}
	
	public String saveFile(MultipartFile file, String uploadDir) throws IllegalStateException, IOException {
		String originalFileName = file.getOriginalFilename();
		String newFilename = UUID.randomUUID().toString() + "_" + originalFileName;
		File serverFile = new File(uploadDir + File.separator + newFilename);
		file.transferTo(serverFile);
		return newFilename;
	}
	
	@GetMapping("editProduct.do")
	public String editProduct(@RequestParam("pid") String pid, Model model) {
		Product product = productService.getProduct(pid);
		model.addAttribute("product", product);
		return "product/editProduct";
	}
	
	@PostMapping("editProductPro.do")
	public String editProductPro(@RequestParam("pid") String pid,
			@RequestParam("category1") String category1,
			@RequestParam("category2") String category2,
			@RequestParam("pname") String pname,
			@RequestParam("subtitle") String subtitle,
			@RequestParam("price") int price,
			@RequestParam("author") String author,
			@RequestParam("content") String content,
			@RequestParam("company") String company,
			@RequestParam("img1") MultipartFile img1,
			@RequestParam("img2") MultipartFile img2,
			@RequestParam("img3") MultipartFile img3,
			@RequestParam("img4") MultipartFile img4,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		
		Product before = productService.getProduct(pid);
		
		String uploadDir = request.getServletContext().getRealPath(uploadLoc);
		File dir = new File(uploadDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String img1Name = "";
		String img2Name = "";
		String img3Name = "";
		String img4Name = "";
		
		try {
			if(!img1.isEmpty()) {
				img1Name = saveFile(img1, uploadDir);
			} else {
				img1Name = before.getImg1();
			}
			
			if(!img2.isEmpty()) {
				img2Name = saveFile(img2, uploadDir);
			} else {
				img2Name = before.getImg2();
			}
			
			if(!img3.isEmpty()) {
				img3Name = saveFile(img3, uploadDir);
			} else {
				img3Name = before.getImg3();
			}
			
			if(!img4.isEmpty()) {
				img4Name = saveFile(img4, uploadDir);
			} else {
				img4Name = before.getImg4();
			}
			
			Product product = new Product();
			product.setPid(pid);
			product.setCategory1(category1);
			product.setCategory2(category2);
			product.setPname(pname);
			product.setSubtitle(subtitle);
			product.setPrice(price);
			product.setAuthor(author);
			product.setContent(content);
			product.setCompany(company);
			product.setImg1(img1Name);
			product.setImg2(img2Name);
			product.setImg3(img3Name);
			product.setImg4(img4Name);
		} catch(IOException e) {
			log.error("예외 : {}", e);
		}
		
		return "redirect:productList.do";
	}
	
	@GetMapping("delProduct.do")
	public String delProduct(@RequestParam("pid") String pid, Model model) {
		productService.delProduct(pid);
		return "redirect:productList.do";
	}
}



























