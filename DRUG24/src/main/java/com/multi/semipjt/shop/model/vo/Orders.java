package com.multi.semipjt.shop.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
	
	private int ono;
	private int mno;
	private int pno;
	private int price;
	private String requests;
	private String status;

}
