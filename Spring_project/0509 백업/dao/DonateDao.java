package kr.co.itfriend.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itfriend.beans.DonateHistory;
import kr.co.itfriend.mapper.DonateMapper;

@Repository
public class DonateDao {

	@Autowired
	private DonateMapper donateMapper;
	
	/**
	 * 
	 * @param mb_no
	 * @param dn_point 기부액
	 * @param dn_message 응원메시지
	 * @param og_no 후원할 단체 번호
	 */
	public void setDonateHistory( int mb_no,int dn_point, String dn_message) {
		donateMapper.insertDonateHistory(mb_no,dn_point, dn_message);
	}
	/**
	 * 
	 * @return 전체 후원금액
	 */
	public int getDnPoint() {
		return donateMapper.getDnPoint();
	}
	
	/**
	 * 
	 * @param mb_no
	 * @return 개별 후원 금액
	 */
	public int getDnPointByMbNO(int mb_no) {
		return donateMapper.getDnPointByMbNo(mb_no);
	}
	
	public void updateMoney(int mb_no) {
		int donate = donateMapper.getMostRecentDnPointByMbNo(mb_no);
		donateMapper.updateUserTotalMoney(mb_no, donate);
	}
}
