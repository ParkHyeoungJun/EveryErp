package kr.erp.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Dept {
	public String code;
	public String name;
	
	public Dept(String code, String name) {
		this.code = code;
		this.name = name;
	}
}
