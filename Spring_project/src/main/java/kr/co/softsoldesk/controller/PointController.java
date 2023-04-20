package kr.co.softsoldesk.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String chargeDateFormatted = dateFormat.format(ch.getCharge_date());
			ch.setCharge_date(dateFormat.parse(chargeDateFormatted));
			model.addAttribute("ch", ch);			
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
	
	
	@GetMapping("/accountInfo")
	public String accountInfo() {
		
		return "POINT/accountInfo";
	}
	
//	@GetMapping("/ChargeSuccess")
//	public String ChargeSuccess(chargeHistory ch) {	
//		try {
//			
//			point_mapper.chargePoint(ch);
//		} catch (Exception e) {
//			System.out.println("충전 페이지 예외 발생");
//		}
//		
//		return "POINT/ChargeSuccess";
//	}
	
	
	@GetMapping("/ChargeSuccess/{amount}/{merchant_id}")
	public String chargeSuccess(@PathVariable int amount, @PathVariable String merchant_id) {    
	    // amount 값과 merchant_id 값을 이용해 할 일을 처리하는 코드 작성
	    try {
	        System.out.println(amount);
	        System.out.println(merchant_id);
	    } catch (Exception e) {
	        // TODO: 예외 처리
	    }
	    return "POINT/ChargeSuccess";
	}
	
}
