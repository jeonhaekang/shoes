package shoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.FaqDTO;
import shoes.dto.QnaDTO;

@Service
public class CustomerService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;

	public void faqWrite(FaqDTO dto) {
		insertDao.faqWrite(dto);
	}

	public void qnaWrite(QnaDTO dto) {
		insertDao.qnaWrite(dto);
	}

	public List<QnaDTO> qnaListAll() {
		return selectDao.qnaListAll();
	}

	public List<FaqDTO> faqList() {
		return selectDao.faqList();
	}

	public List<QnaDTO> qnaListMy(String id) {
		return selectDao.qnaListMy(id);
	}

	public QnaDTO qnaSearch(String num) {
		return selectDao.qnaSearch(num);
	}
	
	public void answerWrite(String num, String answer) {
		updateDao.answerWrite(num, answer);
	}
}
