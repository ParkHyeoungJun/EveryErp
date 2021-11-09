package kr.erp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.erp.mapper.BoardAdminMapper;
import kr.erp.vo.BoardAdminVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/boardadmin/*")
@AllArgsConstructor
public class BoardAdminController {
// 
	private BoardAdminMapper service;
	@GetMapping("/list")
	public void list() 
	{
		
	}
	
	@GetMapping("/add")
	public void add() 
	{
		
	}
	
	@PostMapping("/addajax")
	public ResponseEntity<String>  addajax(BoardAdminVO vo ,Model model) 
	{
		int row =service.add(vo);
		if(row>0)
		{
			return new ResponseEntity<String>("succuess", HttpStatus.OK);
		}
		else
		{
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
	}
	
}
