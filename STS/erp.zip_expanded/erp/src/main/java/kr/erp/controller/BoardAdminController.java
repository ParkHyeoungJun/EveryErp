package kr.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.erp.mapper.BoardAdminMapper;
import kr.erp.vo.BoardAdminVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/boardadmin/*")
@AllArgsConstructor
public class BoardAdminController {

	private BoardAdminMapper service; //mapper,service 인터페이스 둘다 씀
	
	@GetMapping("/list")
	public void list() 
	{
		
	}
	
	@GetMapping("/add")
	public void add() {
		
	}
	@PostMapping("/add")
	public void add(BoardAdminVO vo,Model model) {
		
	}
	
}
