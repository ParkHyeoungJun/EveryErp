package kr.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.erp.mapper.BoardAdminMapper;
import kr.erp.vo.BoardAdminVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardAdminService implements BoardAdminMapper {

	@Setter(onMethod_=@Autowired)
	private BoardAdminMapper mapper;
	
	@Override
	public int add(BoardAdminVO vo) {
		log.info("add..."+vo);
		return mapper.add(vo);
	}

	@Override
	public List<BoardAdminVO> select() {
		log.info("select...");
		return mapper.select();
	}

	@Override
	public int update(BoardAdminVO vo) {
		log.info("update..."+vo);
		return mapper.update(vo);
	}

	@Override
	public int delete(Long code) {
		log.info("delete..."+code);
		return mapper.delete(code);
	}

}
