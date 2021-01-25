package com.spring.beautifly.product.model.vo;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {

	private int imageNo;
	private int productNo;
	private String originFileName;
	private String renameFileName;
	private int imageLevel;
	private Date uploadDate;
	private String imageStatus;
	
}
