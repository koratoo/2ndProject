package kr.co.softsoldesk.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.chargeHistory;
import kr.co.softsoldesk.beans.fakeBank;
import kr.co.softsoldesk.mapper.BankMapper;
import kr.co.softsoldesk.mapper.PointMapper;

@Controller
@RequestMapping("/POINT")
public class PointController {

	@Autowired
	PointMapper point_mapper;
	
	@Autowired
	private BankMapper bankMapper;
	
	@GetMapping("/ChargePoint")
	public String chargePoint(Model model) {	
		
		
		List<fakeBank> fb = bankMapper.selectFakeBankByUserId();
	    model.addAttribute("fakeBank", fb);
	    
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
	
	@GetMapping("/pwd_enhance")
	public String secondPwdPage() {
		
		
		return "POINT/pwd_enhance";
	}
	
	@PostMapping("/pwd_enhance")
	public String secondPwdPage_post(@RequestParam String pwd1, @RequestParam String pwd2) throws Exception {

	    try {
	        if(pwd1.equals(pwd2)) {
	            // 두 비밀번호가 일치하는 경우
	            String encryptedPwd = AesEncryptor.encrypt(pwd1);
	            System.out.println("암호화된 비밀번호 : " + encryptedPwd);
	            
	            // 암호화된 비밀번호를 DB에 저장하는 로직 구현
	            // ...

	            String decryptedPwd = AesEncryptor.decrypt(encryptedPwd);
	            System.out.println("복호화된 비밀번호 : " + decryptedPwd);
	            System.out.println("비밀번호 일치");
	            return "POINT/account_enroll";
	        } else {
	            // 두 비밀번호가 일치하지 않는 경우
	            System.out.println("비밀번호 불일치");
	            return "redirect:/pwd_enhance"; // 비밀번호 입력 페이지로 다시 이동
	        }
	    } catch (Exception e) {
	        System.out.println("비밀번호 암호화/복호화 중 오류 발생");
	        e.printStackTrace();
	        return "POINT/account_enroll";
	    }
	}
	

	
	 
    @PostMapping("/account_enroll")
    public String registerAccount(@RequestParam String user_id, @RequestParam String bankName, @RequestParam String accountNumber, @RequestParam int accountPwd) {
        try {
            // fakeBank 객체 생성
            fakeBank fb = new fakeBank();
            fb.setBankName(bankName);
            fb.setAccountNumber(accountNumber);
            fb.setAccountPwd(accountPwd);
            fb.setUser_id(user_id);
            
            // 매퍼를 통해 fakeBank 정보 DB에 등록
            bankMapper.insertFakeBank(fb);

            // 계좌 등록 완료 후 포인트 충전 페이지로 이동
            return "redirect:/POINT/ChargePoint";
        } catch (Exception e) {
            System.out.println("계좌 등록 중 오류 발생");
            e.printStackTrace();
            return "error"; // 에러 페이지로 이동
        }
    }
	
}
