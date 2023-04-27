package kr.co.itfriend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.itfriend.beans.fakeBank;


public interface BankMapper {

	
	    
		@Insert("INSERT INTO fakeBank (bankName, accountNumber, mb_no) VALUES (#{bankName}, #{accountNumber}, 1)")
		void insertFakeBank(@Param("bankName") String bankName, @Param("accountNumber") String accountNumber);
	    
	    @Update("UPDATE Member SET MB_PW2 = #{MB_PW2} WHERE mb_no= 1 ")
	    void updateSecondPwd(String MB_PW2);
	    
	    @Select("SELECT * FROM fakeBank WHERE mb_no =1")
	    List<fakeBank> selectFakeBankByUserId();
	    
	    @Delete("DELETE FROM fakeBank WHERE accountNumber = #{accountNumber}")
	    void deleteAccount(@Param("accountNumber") String accountNumber);
}
