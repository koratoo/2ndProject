package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.chargeHistory;
import kr.co.softsoldesk.mapper.PointMapper;

@Controller
@RequestMapping("/POINT")
public class PointController {

	@Autowired
	PointMapper point_mapper;
	
	
	//충전 페이지
	@GetMapping("/ChargePoint")
	public String chargePoint() {	
		
		return "POINT/ChargePoint";
	}
	
	//보유 포인트 정보 페이지
	@GetMapping("/PointInfo")
	public String PointInfo(Model model) {	
		try {
			chargeHistory ch = point_mapper.chargehistory();
			model.addAttribute("ch",ch);			
		} catch (Exception e) {
			System.out.println("예외 발생");
		}
		
		return "POINT/PointInfo";
	}
	
	//기부 페이지
	@GetMapping("/CharityPage")
	public String ChargePoint() {	
		
		return "POINT/CharityPage";
	}
	
	//충전 성공 페이지
	@GetMapping("/ChargeSuccess")
	public String ChargeSuccess(chargeHistory ch) {	
		try {
			
			ch.setCharge_amount(121212);
			ch.setUser_id("kjs002_testdat 230419");
			ch.setPayment_tool("kakao pay");
			
			point_mapper.chargePoint(ch);
		} catch (Exception e) {
			System.out.println("충전 페이지 예외 발생");
		}
		
		return "POINT/ChargeSuccess";
	}
	
	
	@GetMapping("/accountInfo")
	public String accountInfo() {
		
		return "POINT/accountInfo";
	}
	
}
