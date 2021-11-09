package kr.erp.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.erp.vo.EmailVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/email/*")
@AllArgsConstructor
public class EmailController {

	@Autowired
	private JavaMailSender mailSender;

	
	@GetMapping("/send")
	public void send() {

	}
	@PostMapping("/send")
	public String send(EmailVO vo,Model model) 
	{
		try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */

            mailHelper.setFrom(vo.from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(vo.to);
            mailHelper.setSubject(vo.subject);
            mailHelper.setText(vo.content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            //파일 첨부
           // FileSystemResource file = new FileSystemResource(new File("D:\\test.txt")); 
           // mailHelper.addAttachment("업로드파일.형식", file);
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
            model.addAttribute("result", e.getMessage());
        }
		//
		model.addAttribute("result", "success");
		return "redirect:/email/result";
		
	}

	
	@GetMapping("/result")
	public void result() {

	}
}
