package kr.co.itfriend.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.itfriend.beans.DonateHistory;

public interface DonateMapper {

	@Insert("INSERT INTO DONATE_HISTORY (MB_NO, DN_DATE, DN_POINT, DN_MESSAGE) VALUES (#{mb_no}, sysdate, #{dn_point}, #{dn_message})")
	void insertDonateHistory(@Param("mb_no") int mb_no,@Param("dn_point")int dn_point, @Param("dn_message") String dn_message);
	
	
	@Select("Select NVL(SUM(dn_point), 0) from donate_history")
	int getDnPoint();

	@Select("Select NVL(SUM(dn_point), 0) from donate_history where mb_no=#{mb_no}")
	int getDnPointByMbNo(@Param("mb_no") int mb_no);
	
	@Update("UPDATE MEMBER SET mb_money = mb_money - #{donate} WHERE mb_no = #{mb_no}")
	public void updateUserTotalMoney(@Param("mb_no") int mb_no, @Param("donate") int donate);
	
	@Select("SELECT NVL(dn_point, 0) FROM (SELECT dn_point FROM donate_history WHERE mb_no = #{mb_no} ORDER BY dn_date DESC) WHERE ROWNUM = 1")
	int getMostRecentDnPointByMbNo(@Param("mb_no") int mb_no);
}
