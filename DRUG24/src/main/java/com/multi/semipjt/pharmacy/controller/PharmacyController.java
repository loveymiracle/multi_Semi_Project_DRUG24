package com.multi.semipjt.pharmacy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.common.util.PageInfo;
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
		log.debug("@@ pharmacy list 요청 param :" + param);
	        
		
		int pharmacyCount = service.getPharmacyCount(param);
		PageInfo pageInfo = new PageInfo(param.getPage(), 5, pharmacyCount, 8);
		param.setLimit(pageInfo.getListLimit());
		param.setOffset(pageInfo.getStartList()-1);
		List<Pharmacy> list = service.getPharmacyList(param);
		
		System.out.println("@@" + list);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		
		return "pharmacy/pharmacysearch";
	}

	
	@RequestMapping("/pharmacy/view")
	  public String view(Model model, @RequestParam("no") int no) {
		Pharmacy pharmacy = null;
		try {
			pharmacy = service.findPharmacyByNo(no);
		} catch (Exception e) {}
       if(pharmacy == null) {
    	   return "redirector:error";
       }
       
       model.addAttribute("pharmacy", pharmacy);
       
       return "pharmacy/pharmacyview";
    }
	
	

}
