package shoes.controller.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.MemberDTO;
import shoes.service.AccountService;

@Controller
public class LoginController {
	@Autowired
	AccountService accountService;

	// 로그인 페이지로 이동
	@RequestMapping("/Login")
	public String login() {
		System.out.println("Mapping : /login");
		return "Member/Login";
	}

	// 로그인 실행
	@RequestMapping("/LoginAction")
	public String loginAction(MemberDTO member, Model model, HttpSession session,RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /loginAction");
		MemberDTO result = accountService.login(member);
		if (result != null)
			if (result.getPassword().equals(member.getPassword())) {
				session.setAttribute("sessionID", member.getId());
				redirectAttr.addFlashAttribute("msg", "로그인 되었습니다");
				return "redirect:Main";
			}
		redirectAttr.addFlashAttribute("data", member);
		redirectAttr.addFlashAttribute("msg", "비밀번호가 틀리거나 없는 아이디 입니다");
		return "redirect:Login";
	}

	// 로그아웃
	@RequestMapping("Logout")
	public String logout(HttpSession session, Model model,RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /logout");
		session.invalidate();
		redirectAttr.addFlashAttribute("msg", "로그아웃 되었습니다");
		return "redirect:Main";
	}
}
