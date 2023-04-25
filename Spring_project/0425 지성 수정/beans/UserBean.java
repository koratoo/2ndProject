package kr.co.itfriend.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean {

	private int mb_no;
	
	@Size(min=4, max=20)
	@Pattern(regexp="[a-zA-Z0-9]*") 
	private String mb_id;
	
	@Size(min=4, max=20)
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}") 
	private String mb_pw;
	
	@Size(min=4, max=20)
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}") 
	private String mb_pw2;
	
	@Size(min=2,max=4)
	@Pattern(regexp="[가-힣]*")
	private String mb_name;
	
	private String mb_tel;
	
	private String mb_birthday_y;
	
	private String mb_birthday_m;
	
	private String mb_birthday_d;
	
	private String mb_gender;
	
	private String mb_addr;
	
	private String mb_point;
	
	private String mb_Ad;
	
	private boolean userIdExist;
	
	private boolean userLogin;
	
	private String MB_PW2;
	
	
	

	
	
}
