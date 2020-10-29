package shoes.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.BuyDTO;
import shoes.service.OrderService;

@Controller
public class AdminOrderController {
	@Autowired
	OrderService orderService;

	// 주문정보 페이지
	@RequestMapping("/OrderList")
	public String orderlist(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /orderlist");
		String keyword="";
		String category="num";
		if (request.getParameter("keyword") != null) 
			keyword = request.getParameter("keyword");
		if (request.getParameter("category") != null) 
			category = request.getParameter("category");
		List<BuyDTO> list = orderService.orderSearchList(keyword, category);
		List<BuyDTO> orderList = new ArrayList<BuyDTO>();
		
		int ea;
		if(request.getParameter("ea") != null)
			ea = Integer.parseInt(request.getParameter("ea"));
		else
			ea = 5;
		
		//표기할 페이지
		int count;
		if(request.getParameter("count") != null) { 
			count = Integer.parseInt(request.getParameter("count"));
		}
		else {
			count = 1;
		}
		//페이지로 넘길 물건 정보
		int k = (count*ea)-ea;
		for(int i = k; i < k+ea; i++) {
			if(i<list.size()) {
				orderList.add(list.get(i));
			}
		}
		//전체 페이지수 카운터
		int i = list.size()/ea;
		if(list.size()%ea != 0)
			i++;
		
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		model.addAttribute("ordercount", list.size());
		model.addAttribute("list", orderList);
		model.addAttribute("count", count);
		model.addAttribute("page", i);
		model.addAttribute("ea", ea);
		return "AdminPage/OrderList";
	}

	// 주문정보 수정 페이지
	@RequestMapping("/OrderModify")
	public String ordermodify(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /ordermodify");
		String num = request.getParameter("num");
		BuyDTO dto = orderService.orderSearch(num);
		model.addAttribute("data", dto);
		return "AdminPage/OrderModify";
	}

	// 주문정보 수정
	@RequestMapping("/OrderModifyAction")
	public String ordermodifyAction(BuyDTO dto, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /ordermodifyAction");
		orderService.orderModify(dto);
		redirectAttr.addFlashAttribute("msg", "정보를 수정했습니다");
		return "redirect:OrderList";
	}
	
	// 배송상태 변경
	@RequestMapping("/OrderStateChange")
	public String orderStateChange(@RequestParam("select") List<Integer> list,
								   HttpServletRequest request,
								   RedirectAttributes redirectAttr) {
		
		System.out.println("Mapping : /OrderStateChange");
		String state = request.getParameter("state");
		System.out.println("상태:"+state);
		for(int i = 0; i < list.size(); i++) {
			orderService.orderStateChange(state,list.get(i));
		}
		redirectAttr.addFlashAttribute("msg", "배송상태를 수정했습니다");
		return "redirect:OrderList";
	}
}
