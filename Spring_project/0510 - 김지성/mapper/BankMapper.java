package kr.co.itfriend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.itfriend.beans.fakeBank;


public interface BankMapper {
	    
		/**
		 * 
		 * @param bankName 은행이름	
		 * @param accountNumber 계좌번호
		 * @param mb_no
		 */
		@Insert("INSERT INTO fakeBank (bankName, accountNumber, mb_no) VALUES (#{bankName}, #{accountNumber}, #{mb_no})")
		void insertFakeBank(@Param("bankName") String bankName, @Param("accountNumber") String accountNumber,@Param("mb_no") int mb_no);
	    /**
	     * 
	     * @param MB_PW2 2차 비밀번호를 등록합니다.
	     * @param mb_no
	     */
	    @Update("UPDATE Member SET MB_PW2 = #{MB_PW2} where mb_no= #{mb_no} ")
	    void updateSecondPwd(@Param("MB_PW2") String MB_PW2,@Param("mb_no") int mb_no);
	    
	    /**
	     * 
	     * @param mb_no
	     * @return 로그인한 사용자가 등록한 계좌들을 불러옵니다.
	     */
	    @Select("SELECT * FROM fakeBank WHERE mb_no =#{mb_no}")
	    List<fakeBank> selectFakeBankByMbno(@Param("mb_no") int mb_no);
	    
	    /**
	     * 계좌를 삭제합니다.
	     * @param accountNumber
	     */
	    @Delete("DELETE FROM fakeBank WHERE accountNumber = #{accountNumber}")
	    void deleteAccount(@Param("accountNumber") String accountNumber);
}
