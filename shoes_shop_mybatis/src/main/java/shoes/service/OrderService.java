package shoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.BuyDTO;

@Service
public class OrderService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	public void orderCancel(int num) {
		deleteDao.orderCancel(num);
	}
	
	public List<BuyDTO> orderList(){
		return selectDao.orderList();
	}
	
	public List<BuyDTO> orderListMy(String id){
		return selectDao.orderListMy(id);
	}
	
	public List<BuyDTO> orderSearchList(String keyword, String category){
		return selectDao.orderSearchList(keyword, category);
	}
	
	public BuyDTO orderSearch(String num) {
		return selectDao.orderSearch(num);
	}
	
	public void orderModify(BuyDTO dto) {
		updateDao.orderModify(dto);
	}
	
	public void orderStateChange(String state, Integer num) {
		updateDao.orderStateChange(state, num);
	}
}
