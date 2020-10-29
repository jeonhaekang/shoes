package shoes.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.FaqDTO;
import shoes.dto.QnaDTO;
import shoes.service.CustomerService;

@Controller
public class AdminCustomerController {
	@Autowired
	CustomerService customerService;
	
	// 문의리스트
	@RequestMapping("/QnaList")
	public String qnalist(Model model) {
		System.out.println("Mapping : /QnaList");
		List<QnaDTO> list = customerService.qnaListAll();
		model.addAttribute("list", list);
		return "AdminPage/QnaList";
	}

	// QnA 답변작성페이지
	@RequestMapping("/QnaAnser")
	public String qnadetail(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /qnaanser");
		String num = request.getParameter("num");
		QnaDTO dto = customerService.qnaSearch(num);
		model.addAttribute("data", dto);
		return "AdminPage/QnaAnser";
	}

	// QnA 답변작성
	@RequestMapping("/AnswerAction")
	public String answerAction(HttpServletRequest request, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /AnswerAction");
		String num = request.getParameter("num");
		String answer = request.getParameter("answer");
		customerService.answerWrite(num, answer);
		redirectAttr.addFlashAttribute("msg", "답변을 등록했습니다");
		return "redirect:QnaList";
	}

	// FAQ 작성 페이지 이동
	@RequestMapping("/FaqInsert")
	public String faqInsert(Model model) {
		System.out.println("Mapping : /faqInsert");
		return "CustomerService/FaqInsert";
	}

	// FAQ 작성
	@RequestMapping("/FaqInsertAction")
	public String faqInsertAction(FaqDTO dto, Model model) {
		customerService.faqWrite(dto);
		return "redirect:FaqInsert";
	}
}
