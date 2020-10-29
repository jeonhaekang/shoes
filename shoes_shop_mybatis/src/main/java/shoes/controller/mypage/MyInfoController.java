package shoes.controller.mypage;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.MemberDTO;
import shoes.service.AccountService;

@Controller
public class MyInfoController {
	@Autowired
	AccountService accountService;

	// 내정보 페이지로 이동
	@RequestMapping("/MyInfo")
	public String myInfo(HttpSession session, Model model) {
		System.out.println("Mapping : /myInfo");
		String id = (String) session.getAttribute("sessionID");
		MemberDTO dto = accountService.idSearch(id);
		model.addAttribute("data", dto);
		return "MyPage/MyInfo";
	}

	// 내정보수정 페이지로 이동
	@RequestMapping("/MyInfoModify")
	public String modify(HttpSession session, Model model) {
		System.out.println("Mapping : /modify");
		String id = (String) session.getAttribute("sessionID");
		MemberDTO dto = accountService.idSearch(id);
		model.addAttribute("data", dto);
		return "MyPage/MyInfoModify";
	}

	// 내정보수정 유효성 검사
	@RequestMapping("/ModifyAction")
	public String modify(@Valid MemberDTO member, BindingResult result, Model model, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /modifyAction");
		if (result.hasErrors()) {
			model.addAttribute("data", member);
			String[] check = { "id", "password", "name", "address", "email", "phone", "gender" };
			for (int i = 0; i < check.length; i++) {
				if (result.getFieldError(check[i]) != null) {
					model.addAttribute("msg", result.getFieldError(check[i]).getDefaultMessage());
				}
			}
			return "MyPage/MyInfoModify";
		}
		accountService.userModify(member);
		redirectAttr.addFlashAttribute("msg", "정보가 수정되었습니다");
		return "redirect:MyInfo";
	}
}
