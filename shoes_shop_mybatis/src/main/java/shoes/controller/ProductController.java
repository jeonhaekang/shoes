package shoes.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shoes.dto.ProductDTO;
import shoes.dto.ReviewDTO;
import shoes.service.ProductService;
import shoes.service.ReviewService;
import shoes.service.SearchService;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	SearchService searchSer;
	@Autowired
	ReviewService reviewListMy;

	// 항목별 모든 상품
	@RequestMapping("/All")
	public String all(Model model, HttpServletRequest request) {
		System.out.println("Mapping : /all");
		String page = request.getParameter("page");
		List<ProductDTO> list = productService.productStateList(page);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "Product/AllProduct";
	}

	// 검색결과페이지로 이동
	@RequestMapping("/SearchAction")
	public String serch(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /SearchAction");
		String search = request.getParameter("search");
		model.addAttribute("list", searchSer.search(search));
		model.addAttribute("data", search);
		return "Product/Search";
	}

	// 상세페이지로 이동
	@RequestMapping("/Detail")
	public String detail(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /detailAction");
		String name = request.getParameter("productname");
		ProductDTO data = productService.productSearch(name);
		List<ReviewDTO> list = reviewListMy.reviewListMy(name);
		model.addAttribute("data", data);
		model.addAttribute("list", list);
		return "Product/Detail";
	}
	
	// 정렬기능
	@RequestMapping("/AlignAction")
	public String alignAction(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /alignAction");
		String page = request.getParameter("page");
		String state = request.getParameter("state");
		String order;
		if (state.equals("high"))
			order = "desc";
		else
			order = "asc";
		List<ProductDTO> list = productService.align(page, order);
		model.addAttribute("list", list);
		model.addAttribute("page",page);
		return "Product/AllProduct";
	}
}
