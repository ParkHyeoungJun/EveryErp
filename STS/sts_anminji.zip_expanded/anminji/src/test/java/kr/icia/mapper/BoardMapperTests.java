package kr.icia.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ =@ Autowired)
	private BoardMapper mapper;
	
	//getList 테스트
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board->log.info(board));
//	}
	
	//insert 테스트
//	@Test
//	public void testInsert() {
//		
//	BoardVO board = new BoardVO();
//	board.setTitle("새로 작성하는 글");
//	board.setContent("새로 작성하는 내용");
//	board.setWriter("새로운 작성자");
//	
//	mapper.insert(board);
//	log.info(board);
//	}

	//insertSelectKey 테스트
//	@Test
//	public void testInsertSelectKey() {
//		
//	BoardVO board = new BoardVO();
//	board.setTitle("새로 작성하는 글SelectKey");
//	board.setContent("새로 작성하는 내용SelectKey");
//	board.setWriter("새로운 작성자SelectKey");
//	
//	mapper.insertSelectKey(board);
//	log.info(board);
//	}

	//read 테스트
//	@Test
//	public void testRead() {
//		
//	BoardVO board = mapper.read(4L);
//	
//	log.info(board); 
//	}

	//delete 테스트
//	@Test
//	public void testDelete() {
//	log.info("delete cnt: "+mapper.delete(2L));
//	}

	//update 테스트
//	@Test
//	public void testUpdate() {
//		BoardVO board = new BoardVO();
//		board.setBno(5L);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된 내용");
//		board.setWriter("user99");
//
//		int cnt = mapper.update(board);
//		log.info("update cnt: " + cnt);
//	}
	
	//페이징. 10개의 행이 출력 잘 되는지
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getBno()));
	}
	
}
