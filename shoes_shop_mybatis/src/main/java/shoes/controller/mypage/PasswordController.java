package shoes.controller.mypage;

import javax.servlet.http.HttpServletRequest;
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
public class PasswordController {
	@Autowired
	AccountService accountService;

	// 비밀번호 변경 페이지로 이동
	@RequestMapping("/PasswordChange")
	public String passwordChange() {
		System.out.println("Mapping : /passwordChange");
		return "MyPage/PasswordChange";
	}

	// 비밀번호 변경
	@RequestMapping("/PasswordChangeAction")
	public String passwordChangeAction(@Valid MemberDTO member, BindingResult result, Model model,
			HttpServletRequest request, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /passwordChangeAction");
		if (result.hasErrors()) {
			model.addAttribute("data", member);
			if (result.getFieldError("password") != null) {
				model.addAttribute("msg", result.getFieldError("password").getDefaultMessage());
			}
			return "MyPage/PasswordChange";
		}
		String id = (String) request.getSession().getAttribute("sessionID");
		String password = member.getPassword();
		String nowpass = (String) request.getParameter("nowPassword");

		MemberDTO data = accountService.idSearch(id);
		if (!data.getPassword().equals(nowpass)) {
			model.addAttribute("msg", "현재 비밀번호가 틀립니다");
			return "MyPage/PasswordChange";
		} else
			accountService.passwordChange(id, password);
		redirectAttr.addFlashAttribute("msg", "비밀번호가 변경되었습니다");
		return "redirect:MyInfo";
	}
}
