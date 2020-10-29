package shoes.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.MemberDTO;

@Service
public class AccountService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	// 회원탈퇴
	public void userDelete(@Param("id")String id) {
		deleteDao.userDelete(id);
	}
	
	public void joinInsert(MemberDTO member) {
		insertDao.joinInsert(member);
	}
	
	public MemberDTO idSearch(@Param("id")String id) {
		return selectDao.idSearch(id);
	}
	
	public MemberDTO login(@Param("member") MemberDTO member) {
		return selectDao.login(member);
	}
	
	public List<MemberDTO> UserList(){
		return selectDao.userList();
	}
	
	public void userModify(MemberDTO member) {
		updateDao.userModify(member);
	}
	
	public void passwordChange(String id, String password) {
		updateDao.passwordChange(id, password);
	}
}
