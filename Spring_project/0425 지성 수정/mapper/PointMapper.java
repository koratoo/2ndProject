package kr.co.itfriend.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.itfriend.beans.chargeHistory;



//chargeHistory(포인트 충전이력) 테이블관련
public interface PointMapper {

	@Insert("insert into chargeHistory (ch_no, mb_no,charge_date,charge_amount,payment_tool) values(ch_seq.nextval,1,sysdate,#{charge_amount}, #{payment_tool})")
	public void chargePoint(chargeHistory ch);
	
	@Select("SELECT mb_no, SUM(charge_amount) AS charge_amount, "
			+ "count(distinct payment_tool) as payment_tool, MAX(charge_date) AS latest_charge_date "
			+ "FROM chargeHistory "
			+ "WHERE mb_no = 1 AND EXTRACT(MONTH FROM charge_date) = 4 "
			+ "GROUP BY mb_no")
	public chargeHistory chargehistory();
	
	
	@Insert("insert into chargeHistory (ch_no, mb_no, charge_date, charge_amount, payment_tool) values (ch_seq.nextval, 1, sysdate, #{charge_amount}, #{payment_tool})")
	public void insertChargeHistory(@Param("mb_no") int mb_no, @Param("charge_amount") int charge_amount, @Param("payment_tool") String payment_tool);
	
	
	
}
