package shoes.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int num;
	private Date reg;
	private String name;
	private int price;
	private int size220;
	private int size230;
	private int size240;
	private int size250;
	private int size260;
	private int size270;
	private int category;
	private int arrival;
	private int best;
	private int sale;
	private String size;
	private int index=0;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
}
