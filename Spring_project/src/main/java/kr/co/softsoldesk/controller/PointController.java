package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pointApi")
public class PointController {

	
	//가상계좌 연동 API
	//경로는 토스 API문서의 이름과 동일하게 만들었음 ex) Api문서 virtual_account(가상계좌)
	@GetMapping("/virtual_account")
	public String chargeByVirtualAccount() {
		
		return "pointApi/virtual_account";
	}
	
	
	//충전 페이지
	@GetMapping("/ChargePoint")
	public String chargePoint() {	
		
		return "pointApi/ChargePoint";
	}
	
	//보유 포인트 정보 페이지
	@GetMapping("/PointInfo")
	public String PointInfo() {	
		
		return "pointApi/PointInfo";
	}
	
	//충전 페이지
	@GetMapping("/CharityPage")
	public String ChargePoint() {	
		
		return "pointApi/CharityPage";
	}
	
}
