package shoes.dto;

import lombok.Data;

@Data
public class ReviewDTO {
	String id;
	String name;
	String shoesize;
	String title;
	String content;
	int score;
}
