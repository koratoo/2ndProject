package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	public String main() {
		return "main";
	}
	@GetMapping("/MAIN/main")
	public String Main() {
		return "MAIN/main";
	}
	

	@GetMapping("/MAIN/MainBookSearch")
	   public String MainBookSearch(){
	      
	      return "MAIN/MainBookSearch";
	   }
	
}
