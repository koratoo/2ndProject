package kr.co.itfriend.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itfriend.beans.UserBean;
import kr.co.itfriend.beans.chargeHistory;
import kr.co.itfriend.mapper.PointMapper;

@Repository
public class PointDao {
	
	@Autowired
	private PointMapper pointMapper;
	
	/**
	 * @return
	 * chargeHistory테이블의 값들을 리턴한다.
	 */
	public chargeHistory getChargeHistory(int mb_no) {
		return pointMapper.chargehistory(mb_no);
	}
	
	/**
	 * @param mb_no
	 * @param amount
	 * @param payment_tool
	 * 파라미터 값을 chargeHistory테이블에 저장한다.
	 */
	public void insertChargeHistory(int mb_no,int amount,String payment_tool) {
		pointMapper.insertChargeHistory(mb_no, amount, payment_tool); 
	}
	
	/**
	 * point내역 조회때 사용하려고 가져다 놓음
	 * @param mb_no
	 * @return
	 */
	public UserBean getUserBean(int mb_no) {
		return pointMapper.getUserBeanByNo(mb_no);
	}
	
	public int getRecentChargeAmount(int mb_no) {
		return pointMapper.chargeAmount(mb_no);
	}
	
	public void updateTotalMoney(int mb_no) {
		int chargeAmount = pointMapper.chargeAmount(mb_no);
		pointMapper.updateUserTotalMoney(mb_no, chargeAmount);
	}
	
	
}
