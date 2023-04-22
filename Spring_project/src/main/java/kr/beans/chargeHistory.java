package kr.co.softsoldesk.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class chargeHistory {

    private int ch_no; 
    private String user_id;
    private Date charge_date;
    private int charge_amount;
    private String payment_tool;

    public String getChargeDateStr() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(this.charge_date);
    }
}