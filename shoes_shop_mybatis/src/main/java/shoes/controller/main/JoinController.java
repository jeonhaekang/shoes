package shoes.controller.main;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shoes.dto.MemberDTO;
import shoes.service.AccountService;

@Controller
public class JoinController {
	@Autowired
	AccountService accountService;

	// 회원가입 페이지 이동
	@RequestMapping("/Join")
	public String join() {
		System.out.println("Mapping : /join");
		return "Member/Join";
	}

	// 회원가입 유효성 검사
	@RequestMapping("/JoinAction")
	public String write(@Valid MemberDTO member, BindingResult result, Model model, RedirectAttributes redirectAttr) {
		System.out.println("Mapping : /joinAction");
		if (result.hasErrors()) {
			model.addAttribute("data", member);
			String[] check = { "id", "password", "name", "address", "email", "phone", "gender" };
			for (int i = 0; i < check.length; i++) {
				if (result.getFieldError(check[i]) != null) {
					redirectAttr.addFlashAttribute("msg", result.getFieldError(check[i]).getDefaultMessage());
				}
			}
			return "redirect:Join";
		}
		System.out.println("성별:"+member.getGender());
		member.setReg(new Date());
		accountService.joinInsert(member);
		redirectAttr.addFlashAttribute("msg", "회원가입에 성공 했습니다!");
		return "redirect:Main";
	}

	// 아이디 중복 검사
	@RequestMapping("/IdCheckAction")
	public void idCheck(@RequestParam("id") String id, HttpServletResponse response) throws IOException {
		System.out.println("Mapping : /IdCheckAction");
		MemberDTO check = accountService.idSearch(id);

		if (check != null) // 1 = 중복됨, 0 = 중복안됨
			response.getWriter().print("1");
		else
			response.getWriter().print("0");

	}

}
