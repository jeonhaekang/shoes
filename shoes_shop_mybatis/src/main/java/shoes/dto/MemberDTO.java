package shoes.dto;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberDTO {
	@Size(min=6, max=30, message="아이디는 6자 이상이여야 합니다")
	private String id;
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
    message = "비밀번호는 문자,숫자,기호를 조합한 8자 이상을 사용하세요")
	private String password;
	private String name;
	private String address;
	private String email;
	@Pattern(regexp="(?=.*[0-9]).{11,11}",
    message = "전화번호는 숫자로 11자리만 입력해주세요")
	private String phone;
	private String gender;
	private Date reg;
	private int point;
	private int rank;
	private int sale;
	private int save;
}
