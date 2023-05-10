package kr.co.itfriend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.itfriend.beans.DonateHistory;


public interface DonateMapper {

	/**
	 * 후원 내역을 테이블에 저장한다.
	 * @param mb_no
	 * @param dn_point
	 * @param dn_message
	 */
	@Insert("INSERT INTO DONATE_HISTORY (MB_NO, DN_DATE, DN_POINT, DN_MESSAGE) VALUES (#{mb_no}, sysdate, #{dn_point}, #{dn_message})")
	void insertDonateHistory(@Param("mb_no") int mb_no,@Param("dn_point")int dn_point, @Param("dn_message") String dn_message);
	
	/**
	 * NVL은 NULL값을 처리하기 위해 사용하였다.
	 * @return 후원 받은 금액의 총 합을 리턴한다.
	 */
	@Select("Select NVL(SUM(dn_point), 0) from donate_history")
	int getDnPoint();
	
	
	/**
	 * @param mb_no
	 * @return 로그인 한 사람의 후원액을 리턴한다.
	 */
	@Select("Select NVL(SUM(dn_point), 0) from donate_history where mb_no=#{mb_no}")
	int getDnPointByMbNo(@Param("mb_no") int mb_no);
	
	/**
	 * @param mb_no
	 * @param donate 로그인한 멤버의 충전 총액을 리턴한다.
	 */
	@Update("UPDATE MEMBER SET mb_money = mb_money - #{donate} WHERE mb_no = #{mb_no}")
	public void updateUserTotalMoney(@Param("mb_no") int mb_no, @Param("donate") int donate);
	
	/**
	 * @param mb_no
	 * @return 로그인 한 멤버가 최근 기부한 금액 1건을 리턴한다.
	 */
	@Select("SELECT NVL(dn_point, 0) FROM (SELECT dn_point FROM donate_history WHERE mb_no = #{mb_no} ORDER BY dn_date DESC) WHERE ROWNUM = 1")
	int getMostRecentDnPointByMbNo(@Param("mb_no") int mb_no);
	
	@Select("SELECT * FROM (SELECT ROWNUM rn, dh.* FROM (SELECT * FROM donate_history WHERE mb_no = #{mb_no} ORDER BY dn_date DESC) dh) WHERE rn <= 3")
	public List<DonateHistory> getAllHisByMbno(@Param("mb_no") int mb_no);
}
