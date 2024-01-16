package com.multi.mvc.kakao;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MapInfo {
	private String name;
	private String address;
	private double x; //longitude 경도
	private double y; // latitude 위도
}
