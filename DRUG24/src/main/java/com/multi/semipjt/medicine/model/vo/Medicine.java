package com.multi.semipjt.medicine.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medicine {
	private String dno;
	private String dname;
	private String dcompany;
	private int    price;
	private String deffect;
	private String dusage;
	private String dwarn;
	private String dinteraction;
	private String dnegative;
	private String dsave;
	private String dimgurl;
	private String d1type;
	private String d1prohbt;
	private String d2type;
	private String d2prohbt;
	private String d3type;
	private String d3prohbt;
	private String d4type;
	private String d4prohbt;
	private String d5type;
	private String d5prohbt;
	private Date create_date;
	private Date modify_date;
	private String status;
	private String dotc_code;

}
