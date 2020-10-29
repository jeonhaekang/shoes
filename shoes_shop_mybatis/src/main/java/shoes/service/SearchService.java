package shoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoes.dao.ISelectDAO;
import shoes.dto.ProductDTO;

@Service
public class SearchService {
	
	@Autowired
	ISelectDAO dao;
	
	public List<ProductDTO> search(String search){
		return dao.search(search);
	}
}
