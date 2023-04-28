package kr.co.itfriend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.itfriend.beans.fakeBank;


public interface BankMapper {
	    
		@Insert("INSERT INTO fakeBank (bankName, accountNumber, mb_no) VALUES (#{bankName}, #{accountNumber}, #{mb_no})")
		void insertFakeBank(@Param("bankName") String bankName, @Param("accountNumber") String accountNumber,@Param("mb_no") int mb_no);
	    
	    @Update("UPDATE Member SET MB_PW2 = #{MB_PW2} where mb_no= #{mb_no} ")
	    void updateSecondPwd(@Param("MB_PW2") String MB_PW2,@Param("mb_no") int mb_no);
	    
	    @Select("SELECT * FROM fakeBank WHERE mb_no =#{mb_no}")
	    List<fakeBank> selectFakeBankByMbno(@Param("mb_no") int mb_no);
	    
	    @Delete("DELETE FROM fakeBank WHERE accountNumber = #{accountNumber}")
	    void deleteAccount(@Param("accountNumber") String accountNumber);
}
