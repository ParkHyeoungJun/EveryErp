package kr.erp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.erp.mapper.MemberMapper;
import kr.erp.vo.Dept;
import kr.erp.vo.Job;
import kr.erp.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberMapper service;
	
	
	   @GetMapping("/membership")
	   public void membership() {
		   
	   }

	
	// 부서 
	   @PostMapping(value = "/dept", produces = MediaType.APPLICATION_JSON_VALUE)
	   public ResponseEntity<List<Dept>> dept() {
	      List<Dept> list = new ArrayList<>();
	       Dept d1 = new Dept("10","인사부");
	       Dept d2 = new Dept("20","총무부");
	       Dept d3 = new Dept("30","회계부");
	       Dept d4 = new Dept("40","기획부");
	       Dept d5 = new Dept("50","영업부");
	       
	       list.add(d1);
	       list.add(d2);
	       list.add(d3);
	       list.add(d4);
	       list.add(d5);
	      return new ResponseEntity<>(list, HttpStatus.OK);
	   }
	   
	   ///직책
	   @PostMapping(value = "/job", produces = MediaType.APPLICATION_JSON_VALUE)
	   public ResponseEntity<List<Job>> job() {
	      List<Job> list = new ArrayList<>();
	       Job d1 = new Job("01","사원");
	       Job d2 = new Job("02","주임");
	       Job d3 = new Job("03","전임");
	       Job d4 = new Job("04","선임");
	       Job d5 = new Job("05","대리");
	       Job d6 = new Job("06","과장");
	       Job d7 = new Job("07","차장");
	       Job d8 = new Job("08","부장");
	       Job d9 = new Job("09","이사");
	       Job d10 = new Job("10","상무");
	       Job d11 = new Job("11","전무");
	       Job d12 = new Job("12","부사장");
	       Job d13 = new Job("13","사장");
	       Job d14 = new Job("14","부회장");
	       Job d15 = new Job("15","회장");
	       list.add(d1);
	       list.add(d2);
	       list.add(d3);
	       list.add(d4);
	       list.add(d5);
	       list.add(d6);
	       list.add(d7);
	       list.add(d8);
	       list.add(d9);
	       list.add(d10);
	       list.add(d11);
	       list.add(d12);
	       list.add(d13);
	       list.add(d14);
	       list.add(d15);
	      return new ResponseEntity<>(list, HttpStatus.OK);
	   }
	   

//	   @GetMapping("/register")
//	   public void register() {
//
//	   }
	   
	@PostMapping("/register")
	public ResponseEntity<String> register(MemberVO vo, Model model) {

		   service.register(vo);
		   return new ResponseEntity<String>("succuess", HttpStatus.OK);
	}
	   
	   //아이디 중복 체크
	   @PostMapping("/id_check")
	   public ResponseEntity<String> AjaxView(String userid){
		   String str = "";
		   String idcheck = service.id_check(userid);
		  if(idcheck != null)
		  {
			  return new ResponseEntity<String>("no", HttpStatus.OK);  	  
		  }
		  else return new ResponseEntity<String>("ok", HttpStatus.OK); 
	   }

}

