package kr.co.itfriend.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itfriend.beans.UserBean;
import kr.co.itfriend.beans.chargeHistory;
import kr.co.itfriend.mapper.DonateMapper;
import kr.co.itfriend.mapper.PointMapper;

@Repository
public class PointDao {
	
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private DonateMapper donateMapper;
	/**
	 * @return
	 * chargeHistory테이블의 값들을 리턴한다.
	 */
	public chargeHistory getChargeHistory(int mb_no) throws Exception{
		return pointMapper.chargehistory(mb_no);
	}
	
	/**
	 * @param mb_no
	 * @param amount
	 * @param payment_tool
	 * 파라미터 값을 chargeHistory테이블에 저장한다.
	 */
	public void insertChargeHistory(int mb_no,int amount,String payment_tool) throws Exception {
		pointMapper.insertChargeHistory(mb_no, amount, payment_tool); 
	}
	
	/**
	 * point내역 조회때 사용하려고 가져다 놓음
	 * @param mb_no
	 * @return
	 */
	public UserBean getUserBean(int mb_no) throws Exception {
		return pointMapper.getUserBeanByNo(mb_no);
	}
	
	/**
	 * @param mb_no
	 * @return 최근 충전한 금액
	 */
	public int getRecentChargeAmount(int mb_no) throws Exception {
		return pointMapper.chargeAmount(mb_no);
	}
	
	/**
	 * @param mb_no
	 * 최근 충전한 금액을 총액에 더함
	 */
	public void updateTotalMoney(int mb_no) throws Exception {
		int chargeAmount = pointMapper.chargeAmount(mb_no);
		pointMapper.updateUserTotalMoney(mb_no, chargeAmount);
	}
	
	
}
