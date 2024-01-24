package com.multi.semipjt.pharmacy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.kakao.MapInfo;
import com.multi.semipjt.pharmacy.model.service.PharmacyService;
import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.pharmacy.model.vo.PharmacyParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PharmacyController {
	
	@Autowired
	private PharmacyService service;
	
	
	@RequestMapping("/pharmacy/search")
	public String list(Model model, PharmacyParam param) {
		log.debug("@@ pharmacy list 요청 param :" + param);
		
		int pharmacyCount = service.getPharmacyCount(param);
		PageInfo pageInfo = new PageInfo(param.getPage(), 5, pharmacyCount, 9);
		param.setLimit(pageInfo.getListLimit());
		param.setOffset(pageInfo.getStartList()-1);
		List<Pharmacy> list = service.getPharmacyList(param);
		
		// 맵코드
		List<MapInfo> mapList = new ArrayList<>();
		for(Pharmacy p : list) {
			double x = Double.parseDouble(p.getPhlati()); 
			double y = Double.parseDouble(p.getPhlong()); 
			mapList.add(new MapInfo(p.getPhname(), p.getPhaddress(), x, y,"/pharmacy/view?phno="+p.getPhno()));
		}

		double x = 0.0;
		double y = 0.0;
		for(MapInfo map : mapList ) {
			x += map.getX();
			y += map.getY();
		}
		
		x = x / mapList.size();
		y = y / mapList.size();
		
		model.addAttribute("mapList",mapList);
		model.addAttribute("x", x);
		model.addAttribute("y", y);
		// 맴코드 끝
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		
		return "pharmacy/pharmacysearch";
	}

	
	@RequestMapping("/pharmacy/view")
	  public String view(Model model, @RequestParam("phno") int phno) {
		Pharmacy pharmacy = null;
		try {
			pharmacy = service.findPharmacyByNo(phno);
		} catch (Exception e) {}
       if(pharmacy == null) {
    	   return "redirect:error";
       }
       
       model.addAttribute("pharmacy", pharmacy);
       
       return "pharmacy/pharmacyview";
    }
	

	
	

}
