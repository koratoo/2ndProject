package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SideBarController {

	@GetMapping("/MYPAGE/MyPage")
	   public String mypage() {
	      
	      return "MYPAGE/MyPage";
	   }
	   
	   @GetMapping("MYPAGE/Change")
	   public String mypage_change() {
	      
	      return "MYPAGE/Change";
	   }
	  
	   
	   @GetMapping("MYPAGE/Mypage_QnA")
	   public String mypage_qna() {
	      
	      return "MYPAGE/Mypage_QnA";
	   }
	   
	   @GetMapping("NBQA/notice")
	   public String notice() {
	      
	      return "NBQA/notice";
	   }
	   
	   @GetMapping("NBQA/board")
	   public String board() {
	      
	      return "NBQA/board";
	   }
	   
	   @GetMapping("NBQA/q_a")
	   public String q_a(){
	      
	      return "NBQA/q_a";
	   }
	   
	   @GetMapping("NBQA/application")
	   public String application() {
	      
	      return "NBQA/application";
	   }
	   
	   @GetMapping("REVIEW/review")
	   public String review() {
	      
	      return "REVIEW/review";
	   }

}
