package shoes.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnaDTO {
	private String id;
	private String category;
	private String writer;
	private String email;
	private String phone;
	private String title;
	private String content;
	private Date reg;
	private String answer;
	private int num;
}
