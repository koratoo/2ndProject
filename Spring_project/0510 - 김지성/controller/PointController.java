package kr.co.itfriend.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.transaction.annotation.Transactional;

import kr.co.itfriend.beans.DonateHistory;
import kr.co.itfriend.beans.UserBean;
import kr.co.itfriend.beans.chargeHistory;
import kr.co.itfriend.beans.fakeBank;
import kr.co.itfriend.dao.BankDao;
import kr.co.itfriend.dao.DonateDao;
import kr.co.itfriend.dao.PointDao;
import kr.co.itfriend.service.PasswordEncryptorService;
import kr.co.itfriend.service.PointService;

@Controller
@RequestMapping("/POINT")
public class PointController {
	
	@Autowired
    private PointService pointService;

	@Autowired
	private PointDao pointDao;
	
	@Autowired
	private BankDao bankDao;
	
	@Autowired
	private DonateDao donateDao;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	int mb_no;
	//mb_no가 가지고 있는 계좌를 조회한다.
	@GetMapping("/charge_point")
	public String chargePoint(Model model) {	
		try {
			mb_no=loginUserBean.getMb_no();
			List<fakeBank> fb = bankDao.chargePoint(mb_no);		
			model.addAttribute("fakeBank", fb);
		} catch (Exception e) {
			System.out.println("등록된 계좌 없음");
			 return "POINT/charge_point";
		}

		
	    return "POINT/charge_point";
	}
	
	//보유 포인트 정보 페이지
	@GetMapping("/point_info")
	public String PointInfo(Model model) throws Exception {	
		
		
		try {
			mb_no=loginUserBean.getMb_no();
			chargeHistory ch = pointDao.getChargeHistory(mb_no);
			UserBean ub = pointDao.getUserBean(mb_no);
			int RecentchargeAmount = pointDao.getRecentChargeAmount(mb_no);
			
			int donate = donateDao.getDnPointByMbNO(mb_no);
			
			model.addAttribute("ub",ub);
			model.addAttribute("ch", ch);	
			model.addAttribute("donate",donate);
			model.addAttribute("recent", RecentchargeAmount);
		} catch (Exception e) {
			System.out.println("로그인이 안돼서 생기는 에러");
		}
			
		
		return "POINT/point_info";
	}
	
	//이용약관
	@GetMapping("/account_info")
	public String accountInfo() {
		
		return "POINT/account_info";
	}
	

	//충전 성공시 amount/mb_no/payment_tool을 전하고 redirect함
	@Transactional
	@GetMapping("/charge_success/{amount}/{mb_no}/{payment_tool}")
	public String chargeSuccess(@PathVariable int amount, @PathVariable int mb_no, 
								@PathVariable String payment_tool) throws Exception {    
		    mb_no=loginUserBean.getMb_no();
	        pointDao.insertChargeHistory(mb_no, amount, payment_tool); 
	        pointDao.updateTotalMoney(mb_no);
	    return "redirect:/POINT/point_info";
	}
	
	
	//2차 비밀번호 등록
	@GetMapping("/pwd_enhance")
	public String secondPwdPage() {
		
		
		return "POINT/pwd_enhance";
	}
	
	
	@PostMapping("/pwd_enhance")
	public String secondPwdPage_post(@RequestParam String pwd1, @RequestParam String pwd2) throws Exception {
		boolean isValidPwd = pointService.validatePassword(pwd1, pwd2);
        if(isValidPwd) {
        	String MB_PW2 = PasswordEncryptorService.encrypt(pwd1);
        	
        	mb_no=loginUserBean.getMb_no();
        	bankDao.updateSecondPwd(MB_PW2,mb_no);
			
        	
            return "POINT/account_enroll";
        } else {
            return "redirect:/pwd_enhance"; // 비밀번호 입력 페이지로 다시 이동
        }
	}
	
	
    @PostMapping("/account_enroll")
    public String registerAccount( @RequestParam String bankName, @RequestParam String accountNumber) {
        
    	    mb_no=loginUserBean.getMb_no();
            fakeBank fb = new fakeBank();
            fb.setBankName(bankName);
            fb.setAccountNumber(accountNumber);
            System.out.println("bankName : " + bankName);
            System.out.println("accountNumber : " + accountNumber);
           
            bankDao.insertFakeBank(bankName, accountNumber,mb_no);
			
            // 계좌 등록 완료 후 포인트 충전 페이지로 이동
            return "redirect:/POINT/charge_point";
  
    }
    
    @GetMapping("/charge_point/{accountNumber}")
    public String deleteAccount( @PathVariable  String accountNumber) {
    	
    	System.out.println("삭제요청 들어옴 >>  " + accountNumber);
        bankDao.deleteAccount(accountNumber);
        
        return "redirect:/POINT/charge_point"; 
    }
	
    //기부 페이지
  	@GetMapping("/charity_page")
  	public String ChargePoint(Model model) throws Exception {	
  		
  		try {
  			mb_no=loginUserBean.getMb_no();
  			int donate = donateDao.getDnPointByMbNO(mb_no);
  			int point = donateDao.getDnPoint();
  			UserBean ub = pointDao.getUserBean(mb_no);
  			model.addAttribute("ub",ub);
  			model.addAttribute("donate",donate);
  			model.addAttribute("point",point);
  		} catch (Exception e) {
  			System.out.println("기부금 없음");
  		}
  		return "POINT/charity_page";
  	}
    @Transactional
    @PostMapping("/donateSuccess")
    public String donateSuccess(@RequestParam int dn_point, @RequestParam String dn_message ) throws Exception {
    	mb_no=loginUserBean.getMb_no();
    	donateDao.setDonateHistory(mb_no,dn_point, dn_message);
    	
    	donateDao.updateMoney(mb_no);
    	System.out.println("Donate 성공 >> " +dn_point);
    	
    	return "redirect:/POINT/charity_page"; 
    }
    
    @GetMapping("/charge_list")
    public String chargeList(Model model) {
    	try {
    		mb_no=loginUserBean.getMb_no();
        	List<chargeHistory> ch = pointDao.getChargeHist(mb_no); 
        	List<DonateHistory> dh = donateDao.getDonateHistory(mb_no);
        	model.addAttribute("ch",ch);
        	model.addAttribute("dh",dh);
		} catch (Exception e) {
			System.out.println("chargeList 에러");
		}
    	
    	
    	return "POINT/charge_list";
    }
  
   
}
