package com.multi.semipjt.api.medicine;

import java.util.Date;

public class Medicine {
	int dNO;
	String dNAME;
	String 	dCOMPANY;
	int 	price;
	String 	dEFFECT;
	String 	dUSAGE;
	String 	dWARNC;
	String 	dWARN;
	String 	dintERACTION;
	String 	dNEGATIVE;
	String 	dSAVE;
	String 	dIMGURL;
	String 	d1TYPE;
	String 	d1PROHBT;
	String 	d2TYPE;
	String 	d2PROHBT;
	String 	d3TYPE;
	String 	d3PROHBT;
	String 	d4TYPE;
	String 	d4PROHBT;
	String 	d5TYPE;
	String d5PROHBT;
	Date CREATE_DATE;
	Date MODIFY_DATE;
	String status;
	String dOTC_CODE;
	@Override
	public String toString() {
		return "Medicine [dNO=" + dNO + ", dNAME=" + dNAME + ", dCOMPANY=" + dCOMPANY + ", price=" + price
				+ ", dEFFECT=" + dEFFECT + ", dUSAGE=" + dUSAGE + ", dWARNC=" + dWARNC + ", dWARN=" + dWARN
				+ ", dintERACTION=" + dintERACTION + ", dNEGATIVE=" + dNEGATIVE + ", dSAVE=" + dSAVE + ", dIMGURL="
				+ dIMGURL + ", d1TYPE=" + d1TYPE + ", d1PROHBT=" + d1PROHBT + ", d2TYPE=" + d2TYPE + ", d2PROHBT="
				+ d2PROHBT + ", d3TYPE=" + d3TYPE + ", d3PROHBT=" + d3PROHBT + ", d4TYPE=" + d4TYPE + ", d4PROHBT="
				+ d4PROHBT + ", d5TYPE=" + d5TYPE + ", d5PROHBT=" + d5PROHBT + ", CREATE_DATE=" + CREATE_DATE
				+ ", MODIFY_DATE=" + MODIFY_DATE + ", status=" + status + ", dOTC_CODE=" + dOTC_CODE + "]";
	}
	public int getdNO() {
		return dNO;
	}
	public void setdNO(int dNO) {
		this.dNO = dNO;
	}
	public String getdNAME() {
		return dNAME;
	}
	public void setdNAME(String dNAME) {
		this.dNAME = dNAME;
	}
	public String getdCOMPANY() {
		return dCOMPANY;
	}
	public void setdCOMPANY(String dCOMPANY) {
		this.dCOMPANY = dCOMPANY;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getdEFFECT() {
		return dEFFECT;
	}
	public void setdEFFECT(String dEFFECT) {
		this.dEFFECT = dEFFECT;
	}
	public String getdUSAGE() {
		return dUSAGE;
	}
	public void setdUSAGE(String dUSAGE) {
		this.dUSAGE = dUSAGE;
	}
	public String getdWARNC() {
		return dWARNC;
	}
	public void setdWARNC(String dWARNC) {
		this.dWARNC = dWARNC;
	}
	public String getdWARN() {
		return dWARN;
	}
	public void setdWARN(String dWARN) {
		this.dWARN = dWARN;
	}
	public String getDintERACTION() {
		return dintERACTION;
	}
	public void setDintERACTION(String dintERACTION) {
		this.dintERACTION = dintERACTION;
	}
	public String getdNEGATIVE() {
		return dNEGATIVE;
	}
	public void setdNEGATIVE(String dNEGATIVE) {
		this.dNEGATIVE = dNEGATIVE;
	}
	public String getdSAVE() {
		return dSAVE;
	}
	public void setdSAVE(String dSAVE) {
		this.dSAVE = dSAVE;
	}
	public String getdIMGURL() {
		return dIMGURL;
	}
	public void setdIMGURL(String dIMGURL) {
		this.dIMGURL = dIMGURL;
	}
	public String getD1TYPE() {
		return d1TYPE;
	}
	public void setD1TYPE(String d1type) {
		d1TYPE = d1type;
	}
	public String getD1PROHBT() {
		return d1PROHBT;
	}
	public void setD1PROHBT(String d1prohbt) {
		d1PROHBT = d1prohbt;
	}
	public String getD2TYPE() {
		return d2TYPE;
	}
	public void setD2TYPE(String d2type) {
		d2TYPE = d2type;
	}
	public String getD2PROHBT() {
		return d2PROHBT;
	}
	public void setD2PROHBT(String d2prohbt) {
		d2PROHBT = d2prohbt;
	}
	public String getD3TYPE() {
		return d3TYPE;
	}
	public void setD3TYPE(String d3type) {
		d3TYPE = d3type;
	}
	public String getD3PROHBT() {
		return d3PROHBT;
	}
	public void setD3PROHBT(String d3prohbt) {
		d3PROHBT = d3prohbt;
	}
	public String getD4TYPE() {
		return d4TYPE;
	}
	public void setD4TYPE(String d4type) {
		d4TYPE = d4type;
	}
	public String getD4PROHBT() {
		return d4PROHBT;
	}
	public void setD4PROHBT(String d4prohbt) {
		d4PROHBT = d4prohbt;
	}
	public String getD5TYPE() {
		return d5TYPE;
	}
	public void setD5TYPE(String d5type) {
		d5TYPE = d5type;
	}
	public String getD5PROHBT() {
		return d5PROHBT;
	}
	public void setD5PROHBT(String d5prohbt) {
		d5PROHBT = d5prohbt;
	}
	public Date getCREATE_DATE() {
		return CREATE_DATE;
	}
	public void setCREATE_DATE(Date cREATE_DATE) {
		CREATE_DATE = cREATE_DATE;
	}
	public Date getMODIFY_DATE() {
		return MODIFY_DATE;
	}
	public void setMODIFY_DATE(Date mODIFY_DATE) {
		MODIFY_DATE = mODIFY_DATE;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getdOTC_CODE() {
		return dOTC_CODE;
	}
	public void setdOTC_CODE(String dOTC_CODE) {
		this.dOTC_CODE = dOTC_CODE;
	}
	public Medicine(int dNO, String dNAME, String dCOMPANY, int price, String dEFFECT, String dUSAGE, String dWARNC,
			String dWARN, String dintERACTION, String dNEGATIVE, String dSAVE, String dIMGURL, String d1type,
			String d1prohbt, String d2type, String d2prohbt, String d3type, String d3prohbt, String d4type,
			String d4prohbt, String d5type, String d5prohbt, Date cREATE_DATE, Date mODIFY_DATE, String status,
			String dOTC_CODE) {
		super();
		this.dNO = dNO;
		this.dNAME = dNAME;
		this.dCOMPANY = dCOMPANY;
		this.price = price;
		this.dEFFECT = dEFFECT;
		this.dUSAGE = dUSAGE;
		this.dWARNC = dWARNC;
		this.dWARN = dWARN;
		this.dintERACTION = dintERACTION;
		this.dNEGATIVE = dNEGATIVE;
		this.dSAVE = dSAVE;
		this.dIMGURL = dIMGURL;
		d1TYPE = d1type;
		d1PROHBT = d1prohbt;
		d2TYPE = d2type;
		d2PROHBT = d2prohbt;
		d3TYPE = d3type;
		d3PROHBT = d3prohbt;
		d4TYPE = d4type;
		d4PROHBT = d4prohbt;
		d5TYPE = d5type;
		d5PROHBT = d5prohbt;
		CREATE_DATE = cREATE_DATE;
		MODIFY_DATE = mODIFY_DATE;
		this.status = status;
		this.dOTC_CODE = dOTC_CODE;
	}
	
	public Medicine() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}