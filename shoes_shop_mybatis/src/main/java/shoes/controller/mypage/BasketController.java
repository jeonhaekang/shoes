package shoes.controller.mypage;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.BasketDTO;
import shoes.service.BasketService;
import shoes.service.ProductService;

@Controller
public class BasketController {
	@Autowired
	BasketService basketService;
	@Autowired
	ProductService porductService;

	// 장바구니
	@RequestMapping("/Basket")
	public String basket(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /basket");
		String id = request.getSession().getAttribute("sessionID").toString();
		List<BasketDTO> list = basketService.basketListMy(id);
		model.addAttribute("list", list);
		return "MyPage/Basket";
	}

	// 장바구니 추가
	@RequestMapping("/BasketAction")
	public String basketAction(BasketDTO dto, HttpServletRequest request, Model model) {
		System.out.println("Mapping : /basketAction");
		String id = request.getSession().getAttribute("sessionID").toString();
		String name = request.getParameter("name");
		String size = request.getParameter("size");
		dto.setId(id);
		dto.setName(name);
		dto.setShoesize(size);
		dto.setReg(new Date());
		basketService.basketInsert(dto);
		model.addAttribute("data", porductService.productSearch(name));
		model.addAttribute("msg", "장바구니에 담았습니다");
		return "Product/Detail";
	}

	// 장바구니 삭제
	@RequestMapping("/BasketDelete")
	public String basketdelete(HttpServletRequest request, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /basketDelete");
		String num = request.getParameter("num");
		basketService.basketSearchDelete(num);
		redirectAttr.addFlashAttribute("msg", "장바구니에서 삭제했습니다");
		return "redirect:Basket";
	}
}
