package com.multi.semipjt.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	
	private int mno;
	private int pno;
	private int amount;
	private int price;
	
}
