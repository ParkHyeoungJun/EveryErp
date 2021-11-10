package kr.erp.mapper;

import java.util.List;

import kr.erp.vo.BoardAdminVO;

public interface BoardAdminMapper {

	public int add(BoardAdminVO vo); //추가 여부
		
	public List<BoardAdminVO> select();
	
	public int update(BoardAdminVO vo);
	
	public int delete(Long code);
	
}
