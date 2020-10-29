package shoes.controller.mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.BuyDTO;
import shoes.dto.ReviewDTO;
import shoes.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	// 리뷰페이지로 이동
	@RequestMapping("/Review")
	public String review(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /review");
		String buynum = request.getParameter("num");
		BuyDTO dto = reviewService.reviewSearch(buynum);
		model.addAttribute("data", dto);
		model.addAttribute("buynum", buynum);
		return "MyPage/Review";
	}

	// 리뷰 작성 이동
	@RequestMapping("/ReviewWrite")
	public String reviewwrite(ReviewDTO dto, HttpServletRequest request, Model model, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /reviewwrite");
		String id = request.getSession().getAttribute("sessionID").toString();
		dto.setId(id);
		reviewService.reviewWrite(dto);
		String num = request.getParameter("num");
		System.out.println(num);
		reviewService.reviewStateUpdate(num);
		redirectAttr.addFlashAttribute("msg", "리뷰를 작성했습니다.");
		return "redirect:Main";
	}

}
