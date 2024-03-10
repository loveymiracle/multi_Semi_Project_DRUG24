package com.multi.semipjt.shop.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductReply {
	
	private int rno;
	private int mno;
	private int pno;
	private String content;
	private String name;
	private int rating;
	private Date createDate;
	private Date modifyDate;
}
