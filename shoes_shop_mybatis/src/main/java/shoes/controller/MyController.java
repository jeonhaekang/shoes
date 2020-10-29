package shoes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shoes.service.CustomerService;
import shoes.service.ProductService;

@Controller
public class MyController {
	@Autowired
	ProductService productService;
	@Autowired
	CustomerService customerService;

	// 초기 메인페이지로
	@RequestMapping("/")
	public String root() throws Exception {
		System.out.println("Mapping : /");
		return "redirect:/Main";
	}

	// 메인 페이지로 이동
	@RequestMapping("/Main")
	public String main(Model model) {
		model.addAttribute("list", productService.productList());
		System.out.println("Mapping : /main");
		return "Main";
	}

	// 관리자 페이지로 이동
	@RequestMapping("/Admin")
	public String admin() {
		System.out.println("Mapping : /Admin");
		return "AdminPage/AdminPage";
	}
	
	// 고객센터로 이동
	@RequestMapping("/CustomerService")
	public String customerService(Model model) {
		System.out.println("Mapping : /customerService");
		model.addAttribute("list", customerService.faqList());
		return "CustomerService/CustomerService";
	}

}