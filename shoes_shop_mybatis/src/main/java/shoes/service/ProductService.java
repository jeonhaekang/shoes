package shoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.IDeleteDAO;
import shoes.dao.IInsertDAO;
import shoes.dao.ISelectDAO;
import shoes.dao.IUpdateDAO;
import shoes.dto.Pagination;
import shoes.dto.ProductDTO;

@Service
public class ProductService {
	@Autowired
	IInsertDAO insertDao;
	@Autowired
	IDeleteDAO deleteDao;
	@Autowired
	ISelectDAO selectDao;
	@Autowired
	IUpdateDAO updateDao;
	
	public void productInsert(ProductDTO product) {
		insertDao.productInsert(product);
	}
	
	public void productDelete(int i) {
		deleteDao.productDelete(i);
	}
	
	public List<ProductDTO> align(String page, String state) {
		return selectDao.align(page, state);
	}
	
	public List<ProductDTO> productList(){
		return selectDao.productList();
	}
	
	// 카테고리별로 여러건 검색
	public List<ProductDTO> productSearchList(String keyword, String category){
		return selectDao.productSearchList(keyword, category);
	}
	
	// 이름으로 단건 검색
	public ProductDTO productSearch(String name) {
		return selectDao.productSearch(name);
	}
	
	// 페이지에 따른 모든 리스트
	public List<ProductDTO> productStateList(String page) {
		return selectDao.productStateList(page);
	}
	
	public List<ProductDTO> productPagination(Pagination pagination){
		return selectDao.productPagination(pagination);
	}
	
	public int stockGet(String name, String size) {
		return selectDao.stockGet(name, size);
	}
	public void productModify(ProductDTO product) {
		updateDao.productModify(product);
	}
	
	public void stockUpdate(String name, String size, int stocknum) {
		updateDao.stockUpdate(name, size, stocknum);
	}
}
