package com.spring.beautifly.pay.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Pay {
	
	private int payNo;
	private String memberId;
	//private int productNo;
	private int orderNo;
	//private String orderName;
	private Date payDate;

}
