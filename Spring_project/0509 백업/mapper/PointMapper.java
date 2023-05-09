package kr.co.itfriend.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.itfriend.beans.UserBean;
import kr.co.itfriend.beans.chargeHistory;



//chargeHistory(포인트 충전이력) 테이블관련
public interface PointMapper {

	@Insert("insert into chargeHistory (ch_no, mb_no,charge_date,charge_amount,payment_tool) values(ch_seq.nextval,#{mb_no},sysdate,#{charge_amount}, #{payment_tool})")
	public void chargePoint(chargeHistory ch,@Param("mb_no") int mb_no);
	
	@Select("SELECT mb_no, SUM(charge_amount) AS charge_amount, "
	        + "(SELECT payment_tool FROM (SELECT payment_tool FROM chargehistory ORDER BY ch_no DESC) WHERE ROWNUM = 1) AS payment_tool, "
	        + "MAX(charge_date) AS charge_date "
	        + "FROM chargeHistory "
	        + "WHERE mb_no = #{mb_no} AND EXTRACT(MONTH FROM charge_date) = 5 "
	        + "GROUP BY mb_no")
	public chargeHistory chargehistory(@Param("mb_no") int mb_no);
	
	
	/**
	 * 최근 충전한 금액을 불러오는 쿼리문
	 * @param mb_no
	 * @return
	 */
	@Select("SELECT charge_amount "
			+ "FROM chargeHistory "
			+ "WHERE mb_no = #{mb_no} "
			+ "AND charge_date = (SELECT MAX(charge_date) FROM chargeHistory WHERE mb_no = #{mb_no})")
	public int chargeAmount(@Param("mb_no") int mb_no);
	
	/**
	 * 최근 충전한 금액과 충전 방법을 저장하는 쿼리문
	 * @param mb_no
	 * @param charge_amount
	 * @param payment_tool
	 */
	@Insert("insert into chargeHistory (ch_no, mb_no, charge_date, charge_amount, payment_tool) values (ch_seq.nextval, #{mb_no}, sysdate, #{charge_amount}, #{payment_tool})")
	public void insertChargeHistory(@Param("mb_no") int mb_no, @Param("charge_amount") int charge_amount, @Param("payment_tool") String payment_tool);
	
	/**
	 * 현재 로그인한 유저테이블의 정보를 불러오는 메서드
	 * @param mb_no
	 * @return
	 */
	@Select("select * from member where mb_no = #{mb_no}")
	public UserBean getUserBeanByNo(@Param("mb_no") int mb_no);
	
	/**
	 * 총 금액을 업데이트 하는 쿼리문
	 * @param mb_no
	 * @param chargeAmount
	 */
	@Update("UPDATE MEMBER SET mb_money = mb_money + #{recentAmount} WHERE mb_no = #{mb_no}")
	public void updateUserTotalMoney(@Param("mb_no") int mb_no, @Param("recentAmount") int chargeAmount);
	
}
