package com.multi.semipjt.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	
	private int pno;
	private String title;
	private String link;
	private String image;
	private int lprice;
	private int hprice;
	private String productId;
	private String productType;
	private String mallName;
	private String brand;
	private String maker;
	private String category1;
	private String category2;
	private String category3;
	private String category4;
	private double rating;
	private int amount;

}
