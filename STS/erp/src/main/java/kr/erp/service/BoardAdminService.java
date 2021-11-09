package kr.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.erp.mapper.BoardAdminMapper;
import kr.erp.vo.BoardAdminVO;
import lombok.Setter;

public class BoardAdminService implements BoardAdminMapper{
	@Setter(onMethod_ = @Autowired)	
private BoardAdminMapper mapper;
	@Override
	public int add(BoardAdminVO vo) {
		// TODO Auto-generated method stub
		return mapper.add(vo);
	}

	@Override
	public List<BoardAdminVO> select() {
		// TODO Auto-generated method stub
		return mapper.select();
	}

	@Override
	public int update(BoardAdminVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long code) {
		// TODO Auto-generated method stub
		return mapper.delete(code);
	}

}
