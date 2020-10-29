package shoes.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import shoes.dto.MemberDTO;
import shoes.service.AccountService;

@Controller
public class AdminUserController {
	@Autowired
	AccountService accountService;
	
	// 유저 리스트로 이동
	@RequestMapping("/UserList")
	public String userlist(Model model) {
		System.out.println("Mapping : /UserList");
		List<MemberDTO> list = (List<MemberDTO>) accountService.UserList();
		model.addAttribute("list", list);
		return "AdminPage/UserList";
	}
}
