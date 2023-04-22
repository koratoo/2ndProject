package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.fakeBank;

public interface BankMapper {

		@Insert("INSERT INTO fakeBank (bankName, accountNumber, accountPwd, user_id) VALUES (#{bankName}, #{accountNumber}, #{accountPwd}, #{user_id})")
	    void insertFakeBank(fakeBank fakeBank);
	    
	    @Select("SELECT * FROM fakeBank WHERE user_id = #{user_id}")
	    fakeBank selectFakeBankByUserId(String userId);
}
