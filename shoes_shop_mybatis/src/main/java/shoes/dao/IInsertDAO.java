package shoes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shoes.dto.BasketDTO;
import shoes.dto.BuyDTO;
import shoes.dto.FaqDTO;
import shoes.dto.MemberDTO;
import shoes.dto.ProductDTO;
import shoes.dto.QnaDTO;
import shoes.dto.ReviewDTO;

@Mapper
public interface IInsertDAO {
	public void buyInsert(@Param("dto") BuyDTO dto);
	public void faqWrite(@Param("faqdto")FaqDTO dto);
	public void joinInsert(@Param("member")MemberDTO member);
	public void productInsert(@Param("product")ProductDTO product);
	public void qnaWrite(@Param("qnadto")QnaDTO dto);
	public void reviewWrite(@Param("dto") ReviewDTO dto);
	public void basketInsert(@Param("dto") BasketDTO dto);
}	
