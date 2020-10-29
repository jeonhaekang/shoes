package shoes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IDeleteDAO {
	public void orderCancel(@Param("num")int num);
	public void productDelete(@Param("num")int i);
	public void userDelete(@Param("id")String id);
	public void basketDelete(@Param("id")String id);
	public void basketSearchDelete(@Param("num")String num);
}	
