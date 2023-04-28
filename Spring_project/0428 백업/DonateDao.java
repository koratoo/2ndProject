package kr.co.itfriend.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itfriend.mapper.DonateMapper;

@Repository
public class DonateDao {

	@Autowired
	private DonateMapper donateMapper;
	
	public void setDonateHistory( int mb_no,int dn_point, String dn_message, int og_no) {
		donateMapper.insertDonateHistory(mb_no,dn_point, dn_message, og_no);
	}
	
	
}
