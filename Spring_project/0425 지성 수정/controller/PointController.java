package kr.co.itfriend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itfriend.beans.chargeHistory;
import kr.co.itfriend.beans.fakeBank;
import kr.co.itfriend.mapper.BankMapper;
import kr.co.itfriend.mapper.PointMapper;
import kr.co.itfriend.service.PasswordEncryptorService;
import kr.co.itfriend.service.PointService;

@Controller
@RequestMapping("/POINT")
public class PointController {

	@Autowired
	PointMapper point_mapper;
	
	@Autowired
	private BankMapper bankMapper;
	
	@Autowired
    private PointService pointService;

	
	@GetMapping("/ChargePoint")
	public String chargePoint(Model model ) {	
		
		try {
			List<fakeBank> fb = bankMapper.selectFakeBankByUserId();
			model.addAttribute("fakeBank", fb);
			
		} catch (Exception e) {
			System.out.println("chargePoint >> 에러 발생");
			e.printStackTrace();
		}
	    
	    return "POINT/ChargePoint";
	}
	
	//보유 포인트 정보 페이지
	@GetMapping("/PointInfo")
	public String PointInfo(Model model) {	
		try {
			chargeHistory ch = point_mapper.chargehistory();
			model.addAttribute("ch", ch);			
		} catch (Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
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
	

	
	@GetMapping("/ChargeSuccess/{amount}/{mb_no}")
	public String chargeSuccess(@PathVariable int amount, @PathVariable int mb_no) {    
	    // amount 값과 merchant_id 값을 이용해 할 일을 처리하는 코드 작성
	    try {
	        String payment_tool = "card";
	        System.out.println(amount);
	        System.out.println(mb_no);
	        point_mapper.insertChargeHistory(mb_no, amount, payment_tool); 
	    } catch (Exception e) {
	        // TODO: 예외 처리
	    	e.printStackTrace();
	    }
	    return "POINT/ChargeSuccess";
	}
	
	@GetMapping("/pwd_enhance")
	public String secondPwdPage() {
		
		
		return "POINT/pwd_enhance";
	}
	
	
	@PostMapping("/pwd_enhance")
	public String secondPwdPage_post(@RequestParam String pwd1, @RequestParam String pwd2) throws Exception {

		boolean isValidPwd = pointService.validatePassword(pwd1, pwd2);
        if(isValidPwd) {
        	String MB_PW2 = PasswordEncryptorService.encrypt(pwd1);
        	
        	try {
				
        		bankMapper.updateSecondPwd(MB_PW2);
			} catch (Exception e) {
				System.out.println("secondPwdPage_post >> 에러 발생");
				e.printStackTrace();
				}
        	
            return "POINT/account_enroll";
        } else {
            return "redirect:/pwd_enhance"; // 비밀번호 입력 페이지로 다시 이동
        }
	}
	

	
	
    @PostMapping("/account_enroll")
    public String registerAccount( @RequestParam String bankName, @RequestParam String accountNumber) {
        try {
            // fakeBank 객체 생성
            fakeBank fb = new fakeBank();
            fb.setBankName(bankName);
            fb.setAccountNumber(accountNumber);
            System.out.println("bankName : " + bankName);
            System.out.println("accountNumber : " + accountNumber);
            try {
            	// 매퍼를 통해 fakeBank 정보 DB에 등록
            	bankMapper.insertFakeBank(bankName, accountNumber);
				
			} catch (Exception e2) {
				System.out.println("registerAccount >> 에러 발생");
				e2.printStackTrace();
			}
            // 계좌 등록 완료 후 포인트 충전 페이지로 이동
            return "redirect:/POINT/ChargePoint";
        } catch (Exception e) {
            System.out.println("계좌 등록 중 오류 발생");
            e.printStackTrace();
            return "error"; // 에러 페이지로 이동
        }
    }
	
   
}
