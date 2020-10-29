package shoes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shoes.dto.BasketDTO;
import shoes.dto.BuyDTO;
import shoes.dto.FaqDTO;
import shoes.dto.MemberDTO;
import shoes.dto.Pagination;
import shoes.dto.ProductDTO;
import shoes.dto.QnaDTO;
import shoes.dto.ReviewDTO;

@Mapper
public interface ISelectDAO {
	public List<QnaDTO> qnaListAll();
	public List<BuyDTO> orderListMy(@Param("id") String id);
	public List<FaqDTO> faqList();
	public MemberDTO idSearch(@Param("id")String id);
	public MemberDTO login(@Param("member")MemberDTO member);
	public List<MemberDTO> userList();
	public List<BuyDTO> orderList();
	public BuyDTO orderSearch(@Param("num") String num);
	public List<BuyDTO> orderSearchList(@Param("keyword") String keyword, @Param("category") String category);
	public List<ProductDTO> productSearchList(@Param("keyword") String keyword, @Param("category") String category);
	public int pointGet(@Param("id") String id);
	public List<ProductDTO> align(@Param("page")String page,
								  @Param("state")String state);
	public ProductDTO productSearch(@Param("name")String name);
	public List<ProductDTO> productStateList(@Param("page")String page);
	public List<ProductDTO> productList();
	public List<ProductDTO> search(@Param("search")String search);
	public QnaDTO qnaSearch(@Param("num")String num);
	public List<QnaDTO> qnaListMy(@Param("id")String id);
	public BuyDTO reviewSearch(@Param("name") String name);
	public int stockGet(@Param("name")String name,
					    @Param("size") String size);
	public List<ReviewDTO> reviewListMy(@Param("name") String name);
	public List<BasketDTO> basketListMy(@Param("id") String id);
	
	
	
	public List<ProductDTO> productPagination(@Param("pagination") Pagination pagination);
}	
