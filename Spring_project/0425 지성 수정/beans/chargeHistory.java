package kr.co.itfriend.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class chargeHistory {

    private int ch_no; 
    private int mb_no;
    private String charge_date;
    private int charge_amount;
    private String payment_tool;

    public String getChargeDateStr() {
    	
    	 if (this.charge_date == null) {
    	        return "";
    	    }
    	 
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(this.charge_date);
    }
}