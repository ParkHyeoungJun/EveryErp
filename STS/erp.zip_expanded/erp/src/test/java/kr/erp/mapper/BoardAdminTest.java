package kr.erp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.erp.vo.BoardAdminVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardAdminTest {

	@Setter(onMethod_ =@ Autowired)
	private BoardAdminMapper mapper;
	
//	@Test
//	public void testSelect() {
//		mapper.select().forEach(vo->log.info(vo));
//	}
	
//	@Test
//	public void testAdd() {
//		
//	BoardAdminVO vo = new BoardAdminVO(); //객체 생성
//	vo.setReply("1");
//	vo.setAnswer("1");
//	vo.setEditor("1");
//	vo.setAttach("1");
//	vo.setDeclar("0");
//	vo.setNotice("1");
//	vo.setAuth("1");
//	vo.setTitle("새 제목");
//	vo.setWriter("새 작성자");
//	vo.setIp("112.218.158.250");
//	
//	mapper.add(vo);
//	log.info(vo);
//	}
	
//	@Test
//	public void testDelete() {
//	log.info("delete cnt: "+mapper.delete(1L));
//	}
	
	@Test
	public void testUpdate() {
		BoardAdminVO vo = new BoardAdminVO();
		vo.setCode(2L);
		vo.setReply("1");
		vo.setAnswer("1");
		vo.setEditor("1");
		vo.setAttach("1");
		vo.setDeclar("0");
		vo.setNotice("1");
		vo.setAuth("1");
		vo.setTitle("수정 제목");
		vo.setUpdater("수정자");
		vo.setIp("112.218.158.250");

		int count = mapper.update(vo);
		log.info("update cnt: " + count);
	}
}
