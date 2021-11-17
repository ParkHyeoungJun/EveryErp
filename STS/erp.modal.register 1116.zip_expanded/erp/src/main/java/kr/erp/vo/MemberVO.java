package kr.erp.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	public String userid;
	public String userpw;
	public String username;
	public String sex;
	public String birth;
	public String email; 
	public String zip;
	public String addr1;
	public String addr2;
	public String phone;
	public String hp;
	public String dept;
	public String job;
	public Date day;
}
