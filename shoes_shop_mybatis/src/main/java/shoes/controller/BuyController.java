package shoes.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.BasketDTO;
import shoes.dto.BuyDTO;
import shoes.dto.MemberDTO;
import shoes.service.AccountService;
import shoes.service.BasketService;
import shoes.service.BuyService;
import shoes.service.ProductService;

@Controller
public class BuyController {
	@Autowired
	BasketService basketService;
	@Autowired
	AccountService accountService;
	@Autowired
	ProductService productService;
	@Autowired
	BuyService buyService;


	// 결제페이지
	@RequestMapping("/BuyPage")
	public String buypage(HttpSession session, Model model) {
		System.out.println("Mapping : /buypage");
		String id = session.getAttribute("sessionID").toString();
		List<BasketDTO> list = basketService.basketListMy(id);
		model.addAttribute("list", list);
		MemberDTO data = accountService.idSearch(id);
		model.addAttribute("data", data);
		return "Buy/BuyPage";
	}
	
	// 결제버튼 클릭
	@RequestMapping("/BuyBtn")
	public String BuyBtn(BasketDTO dto, HttpServletRequest request) {
		System.out.println("Mapping : /BuyBtn");
		String id = request.getSession().getAttribute("sessionID").toString();
		String name = request.getParameter("name");
		String size = request.getParameter("size");
		dto.setId(id);
		dto.setName(name);
		dto.setShoesize(size);
		dto.setReg(new Date());
		basketService.basketInsert(dto);
		return "redirect:BuyPage";
	}

	// 결제 실행
	@RequestMapping("/BuyExcuteAction")
	public String buyexcuteAction(BuyDTO dto, HttpSession session, Model model,RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /buyexcuteAction");
		String id = session.getAttribute("sessionID").toString();
		MemberDTO user = accountService.idSearch(id);
		int userSale =  user.getSale();
		int userSave = user.getSave();
		List<BasketDTO> basket = basketService.basketListMy(id);
		for (int i = 0; i < basket.size(); i++) {
			int price = basket.get(i).getPrice();
			int productSale = basket.get(i).getSale();
			dto.setId(id);
			System.out.println("등급할인액:"+(price/100)*userSale);
			System.out.println("상품할인액:"+((price/100)*productSale));
			price = price - (price/100)*productSale;
			price = price - (price/100)*userSale;
			dto.setPrice(price);
			dto.setSave((price/100)*userSave);
			dto.setShoesize(basket.get(i).getShoesize());
			dto.setCategory(basket.get(i).getCategory());
			dto.setProductname(basket.get(i).getName());
			dto.setReg(new Date());
			String name = basket.get(i).getName();
			String size = "size"+basket.get(i).getShoesize();
			int stocknum = productService.stockGet(name, size);
			productService.stockUpdate(name,size,stocknum-1);
			buyService.buyInsert(dto);
		}
		redirectAttr.addFlashAttribute("msg", "결제가 완료되었습니다");
		session.setAttribute("basket", null);
		basketService.basketDelete(id);
		return "redirect:BuyHistory";
	}
}

