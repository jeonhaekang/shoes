package shoes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;

@Service
public class MemberShipService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	public int pointGet(String id) {
		return selectDao.pointGet(id);
	}
	
	public void pointUpdate(String id, int point) {
		updateDao.pointUpdate(id, point);
	}
	
	public void userRankUpdate(String id, int rank) {
		updateDao.userRankUpdate(id, rank);
	}
}
