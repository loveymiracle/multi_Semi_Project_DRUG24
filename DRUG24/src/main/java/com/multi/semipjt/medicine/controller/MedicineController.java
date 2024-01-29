package com.multi.semipjt.medicine.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.medicine.model.service.MedicineService;
import com.multi.semipjt.medicine.model.vo.Medicine;
import com.multi.semipjt.medicine.model.vo.MedicineParam;
import com.multi.semipjt.member.model.vo.Member;
import com.multi.semipjt.shop.model.service.ShopService;
import com.multi.semipjt.shop.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MedicineController {
	
	@Autowired
	private MedicineService service;
	
	@Autowired
	private ShopService shopService;
	
	
	@Bean(initMethod = "init")
	void test() {
		System.out.println("!!!");
	}
	
	@RequestMapping("medicine/search")
	public String list(Model model, MedicineParam param, HttpSession session) {
		log.debug("@@ medicine list param :" + param);
		log.debug("@@ medicine list param :" + param);
	        
		
		int medicineCount = service.getMedicineCount(param);
		PageInfo pageInfo = new PageInfo(param.getPage(), 5, medicineCount, 6);
		param.setLimit(pageInfo.getListLimit());
		param.setOffset(pageInfo.getStartList()-1);
		List<Medicine> list = service.getMedicineList(param);
		
		System.out.println("@@" + list);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		
		return "medicine/medicineSearch";
	}

	
	@RequestMapping("/medicine/view")
	  public String view(Model model, HttpSession session,
			  @RequestParam("dno") int dno) {
		Medicine medicine = null;
		try {
			medicine = service.findMedicineByNo(dno);
		} catch (Exception e) {}
       if(medicine == null) {
    	   return "redirect:error";
       }
       
       model.addAttribute("medicine", medicine);
       
       Member member = (Member) session.getAttribute("loginMember");
       List<Product> cartList = new ArrayList<Product>();
       if(member != null) {
    	   cartList = shopService.getCartProductList(member.getMno());
       }
       model.addAttribute("cartList", cartList);
       model.addAttribute("cartSize", cartList.size());
       
       return "medicine/medicineView";
    }
	

	
	

}
