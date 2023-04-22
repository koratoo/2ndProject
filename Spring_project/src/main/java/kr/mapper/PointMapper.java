package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.chargeHistory;



public interface PointMapper {

	@Insert("insert into chargeHistory (ch_no, user_id,charge_date,charge_amount,payment_tool) values(ch_seq.nextval,#{user_id},sysdate,#{charge_amount}, #{payment_tool})")
	public void chargePoint(chargeHistory ch);
	
	@Select("SELECT user_id, SUM(charge_amount) AS charge_amount, payment_tool, MAX(charge_date) AS charge_date\r\n"
			+ "FROM chargeHistory \r\n"
			+ "WHERE user_id = 'lears01@naver.com' AND EXTRACT(MONTH FROM charge_date) = 4\r\n"
			+ "GROUP BY user_id, payment_tool")
	public chargeHistory chargehistory();
	
	
	
}
