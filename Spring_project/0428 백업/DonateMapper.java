package kr.co.itfriend.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface DonateMapper {

	@Insert("INSERT INTO DONATE_HISTORY (MB_NO, DN_DATE, DN_POINT, DN_MESSAGE, OG_NO) VALUES (#{mb_no}, sysdate, #{dn_point}, #{dn_message}, #{og_no})")
	void insertDonateHistory(@Param("mb_no") int mb_no,@Param("dn_point")int dn_point, @Param("dn_message") String dn_message, @Param("og_no") int og_no);
	
	
}
