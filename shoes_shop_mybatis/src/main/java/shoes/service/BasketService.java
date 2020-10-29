package shoes.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.BasketDTO;

@Service
public class BasketService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	public void basketInsert(BasketDTO dto) {
		insertDao.basketInsert(dto);
	}
	
	public List<BasketDTO> basketListMy(String id){
		return selectDao.basketListMy(id);
	}
	
	public void basketDelete(@Param("id")String id) {
		deleteDao.basketDelete(id);
	}
	
	public void basketSearchDelete(String num) {
		deleteDao.basketSearchDelete(num);
	}
}
