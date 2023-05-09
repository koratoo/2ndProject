package kr.co.itfriend.beans;


import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class chargeHistory {

    private int ch_no; 
    private int mb_no;
    private String charge_date;
    private int charge_amount;
    private int charge_now;
    private String payment_tool;

    
}