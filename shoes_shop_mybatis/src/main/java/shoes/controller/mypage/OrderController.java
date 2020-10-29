package shoes.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.BuyDTO;
import shoes.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;

	// 주문내역
	@RequestMapping("/BuyHistory")
	public String buyhistory(HttpSession session, Model model) {
		System.out.println("Mapping : /buyhistory");
		String id = (String) session.getAttribute("sessionID");
		List<BuyDTO> list = orderService.orderListMy(id);
		model.addAttribute("list", list);

		return "MyPage/BuyHistory";
	}
	
	// 주문상세 내역
	@RequestMapping("/BuyHistoryDetail")
	public String buyHistoryDetail(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /BuyHistoryDetail");
		String num = request.getParameter("num");
		BuyDTO dto = orderService.orderSearch(num);
		model.addAttribute("data", dto);
		return "MyPage/BuyHistoryDetail";
	}

	// 주문 취소
	@RequestMapping("/OrderCancel")
	public String ordercancel(HttpServletRequest request, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /ordercancel");
		int num = Integer.parseInt(request.getParameter("num"));
		orderService.orderCancel(num);
		redirectAttr.addFlashAttribute("msg", "주문이 취소되었습니다");
		return "redirect:BuyHistory";
	}

}
