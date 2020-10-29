package shoes.controller.mypage;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.QnaDTO;
import shoes.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	CustomerService customerService;

	// QnA
	@RequestMapping("/Qna")
	public String qna(Model model) {
		System.out.println("Mapping : /customerService");
		return "CustomerService/Qna";
	}

	// QnA작성
	@RequestMapping("/QnaAction")
	public String qnaAction(QnaDTO dto, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /qnaAction");
		dto.setId(session.getAttribute("sessionID").toString());
		dto.setReg(new Date());
		customerService.qnaWrite(dto);
		redirectAttr.addFlashAttribute("msg", "빠른 시간안에 답변드리겠습니다 감사합니다");
		return "redirect:Qna";
	}

	// 나의문의내역
	@RequestMapping("/MyQna")
	public String myqna(HttpSession session, Model model) {
		System.out.println("Mapping : /myqna");
		String id = session.getAttribute("sessionID").toString();
		List<QnaDTO> list = customerService.qnaListMy(id);
		model.addAttribute("list", list);
		return "CustomerService/MyQna";
	}

	// 답변보기
	@RequestMapping("/QnaDetail")
	public String qnadetail(HttpServletRequest request, Model model) {
		System.out.println("Mapping : /qnadetail");
		String num = request.getParameter("num");
		QnaDTO dto = customerService.qnaSearch(num);
		model.addAttribute("data", dto);
		return "CustomerService/QnaDetail";
	}
}
