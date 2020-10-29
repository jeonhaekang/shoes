package shoes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shoes.dto.BuyDTO;
import shoes.dto.MemberDTO;
import shoes.dto.ProductDTO;

@Mapper
public interface IUpdateDAO {
	public void answerWrite(@Param("num") String num,
							 @Param("answer") String answer);
	public void userModify(@Param("member") MemberDTO member);
	public void orderModify(@Param("dto") BuyDTO dto);
	public void passwordChange(@Param("id") String id,
							@Param("password")String password);
	public void pointUpdate(@Param("id") String id,
							@Param("point") int point);
	public void productModify(@Param("product") ProductDTO product);
	public void reviewStateUpdate(@Param("num") String num);
	public void stockUpdate(@Param("name") String name,
							@Param("size") String size,
							@Param("stock") int stocknum);
	public void userRankUpdate(@Param("id") String id, @Param("rank") int rank);
	public void orderStateChange(@Param("state") String state,@Param("num") Integer num);
}	
