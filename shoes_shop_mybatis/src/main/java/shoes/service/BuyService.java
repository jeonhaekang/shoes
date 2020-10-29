package shoes.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.BuyDTO;

@Service
public class BuyService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	public void buyInsert(@Param("dto") BuyDTO dto) {
		insertDao.buyInsert(dto);
	}
}
