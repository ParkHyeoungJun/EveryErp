package kr.erp.mapper;

import kr.erp.vo.MemberVO;

public interface MemberMapper {
	public void register(MemberVO vo);
	public String id_check(String userid);

}
