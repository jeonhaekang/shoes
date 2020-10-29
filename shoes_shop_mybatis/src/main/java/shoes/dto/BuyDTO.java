package shoes.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BuyDTO {
	private String review;
	private String num;
	private String id;
	private String email;
	private String phone;
	private String pay;
	private int price;
	private String shoesize;
	private String name;
	private String add_name;
	private String add_address;
	private String add_phone;
	private String add_message;
	private int category;
	private String productname;
	private Date reg;
	private int state;
	private int save;
	private int savestate;
}
