package shoes.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BasketDTO {
	private int num;
	private String id;
	private String name;
	private String shoesize;
	private Date reg;
	private int category;
	private int price;
	private int sale;
}
