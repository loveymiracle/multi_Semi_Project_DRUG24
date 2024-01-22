package com.multi.semipjt.pharmacy.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pharmacy {
	private int phno;
    private String phname;
    private String phtel;
    private String phaddress;
    private String phop1;
    private String phop2;
    private String phop3;
    private String phop4;
    private String phop5;
    private String phop6;
    private String phop7;
    private String phop8;
    private String phlati;
    private String phlong;
    private int reviewcount;
    private int favcount;
    private int rating;
    private String status;

}
