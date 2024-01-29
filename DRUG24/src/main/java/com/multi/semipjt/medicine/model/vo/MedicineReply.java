package com.multi.semipjt.medicine.model.vo;

import java.util.Date;

import com.multi.semipjt.shop.model.vo.ProductReply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MedicineReply {
	private int rno;
	private int mno;
	private String dno;
	private String content;
	private String name;
	private int rating;
	private Date createDate;
	private Date modifyDate;
}
