package shoes.controller.mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.MemberDTO;
import shoes.service.AccountService;

@Controller
public class UserDeleteController {
	@Autowired
	AccountService accountService;

	// 회원탈퇴 이동
	@RequestMapping("/UserDelete")
	public String delete() {
		System.out.println("Mapping : /UserDelete");
		return "MyPage/UserDelete";
	}

	// 회원탈퇴 실행
	@RequestMapping("/UserDeleteAction")
	public String deleteAction(HttpServletRequest request, Model model, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /deleteAction");
		String password = request.getParameter("password");
		String id = (String) request.getSession().getAttribute("sessionID");
		MemberDTO idCheck = accountService.idSearch(id);
		if (idCheck.getPassword().equals(password)) {
			accountService.userDelete(id);
			redirectAttr.addFlashAttribute("msg", "정상적으로 회원탈퇴 되었습니다");
			request.getSession().invalidate();
			return "redirect:Main";
		}
		redirectAttr.addFlashAttribute("msg", "비밀번호가 틀립니다");
		return "redirect:UserDelete";

	}
}
