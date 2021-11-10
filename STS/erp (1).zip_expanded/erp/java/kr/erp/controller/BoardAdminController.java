package kr.erp.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
	
	@PostMapping(value="/listajax", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<BoardAdminVO>> listajax() {
		//List<BoardAdminVO> list=service.select()
		return new ResponseEntity<>(service.select(), HttpStatus.OK);
	}
	
	
	@PostMapping("/addajax")
	public ResponseEntity<String>  addajax(BoardAdminVO vo ,Model model) 
	{
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ip = local.getHostAddress();
		vo.setIp(ip);
			service.add(vo);
		
		
		
			return new ResponseEntity<String>("succuess", HttpStatus.OK);
//		}
//		else
//		{
//			
//		}
		
	}
	
}
