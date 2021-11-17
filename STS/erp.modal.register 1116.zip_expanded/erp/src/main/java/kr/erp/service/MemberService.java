package kr.erp.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.erp.mapper.MemberMapper;
import kr.erp.vo.MemberVO;
import lombok.Setter;

public class MemberService implements MemberMapper {
	@Setter(onMethod_ = @Autowired)	
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO vo) {
		// TODO Auto-generated method stub
		 mapper.register(vo);
	}

	@Override
	public String id_check(String userid) {
		// TODO Auto-generated method stub
		String result = mapper.id_check(userid);
		return result;
	}

}
