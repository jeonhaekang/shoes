package shoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.BuyDTO;
import shoes.dto.ReviewDTO;

@Service
public class ReviewService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	public void reviewWrite(ReviewDTO dto) {
		insertDao.reviewWrite(dto);
	}
	
	public List<ReviewDTO> reviewListMy(String name){
		return selectDao.reviewListMy(name);
	}
	
	public BuyDTO reviewSearch(String name){
		return selectDao.reviewSearch(name);
	}
	
	public void reviewStateUpdate(String num) {
		updateDao.reviewStateUpdate(num);
	}
}
