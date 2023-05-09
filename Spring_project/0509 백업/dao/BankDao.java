package kr.co.itfriend.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itfriend.beans.fakeBank;
import kr.co.itfriend.mapper.BankMapper;

@Repository
public class BankDao {

	@Autowired
	private BankMapper bankMapper;
	
	/**
	 * fakeBank에서 계좌를 불러오는 로직으로
	 * mb_no값을 통해 값을 불러온다.
	 * @return
	 * List에 fakeBank를 담아 반환한다.
	 */
	public List<fakeBank> chargePoint(int mb_no) {	
		return bankMapper.selectFakeBankByMbno(mb_no);
	}
	
	/**
	 * 
	 * @param bankName
	 * @param accountNumber 공백이 포함될 수 있기 때문에 String속성
	 */
	public void insertFakeBank(String bankName, String accountNumber,int mb_no) {
		bankMapper.insertFakeBank(bankName, accountNumber,mb_no);
	}
	
	/**
	 * 2차 비밀번호를 저장하는 로직 
	 * 계좌 연동시 필요
	 * AES암호화되어 DB에 저장됨
	 * @param MB_PW2
	 */
	public void updateSecondPwd(String MB_PW2,int mb_no) {
		bankMapper.updateSecondPwd(MB_PW2,mb_no);
	}
	/**
	 * 충전 페이지에서 연동된 계좌를 삭제할 때 필요함
	 * @param accountNumber
	 */
	public void deleteAccount(String accountNumber) {
		bankMapper.deleteAccount(accountNumber);
	}
	
}
