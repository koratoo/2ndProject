package kr.co.itfriend.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.itfriend.beans.DonateHistory;

public interface DonateMapper {

	@Insert("INSERT INTO DONATE_HISTORY (MB_NO, DN_DATE, DN_POINT, DN_MESSAGE) VALUES (#{mb_no}, sysdate, #{dn_point}, #{dn_message})")
	void insertDonateHistory(@Param("mb_no") int mb_no,@Param("dn_point")int dn_point, @Param("dn_message") String dn_message);
	
	
	@Select("Select SUM(dn_point) from donate_history")
	int getDnPoint();

	@Select("Select Sum(dn_point) from donate_history where mb_no=#{mb_no}")
	int getDnPointByMbNo(@Param("mb_no") int mb_no);
	
	
}
