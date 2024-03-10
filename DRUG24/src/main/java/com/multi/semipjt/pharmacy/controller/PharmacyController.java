package com.multi.semipjt.pharmacy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.kakao.MapInfo;
import com.multi.semipjt.member.model.vo.Member;
import com.multi.semipjt.pharmacy.model.service.PharmacyService;
import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.pharmacy.model.vo.PharmacyParam;
import com.multi.semipjt.pharmacy.model.vo.PharmacyReply;
import com.multi.semipjt.shop.model.service.ShopService;
import com.multi.semipjt.shop.model.vo.Product;
import com.multi.semipjt.shop.model.vo.ProductReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PharmacyController {
	
	@Autowired
	private PharmacyService service;
	
	@Autowired
	ShopService shopService;
	
	
	@RequestMapping("/pharmacy/search")
	public String list(Model model, PharmacyParam param, HttpSession session) {
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
		
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		
		return "pharmacy/pharmacysearch";
	}

	
	@RequestMapping("/pharmacy/view")
	  public String view(Model model, @RequestParam("phno") int phno, HttpSession session) {
		Pharmacy pharmacy = null;
		try {
			pharmacy = service.findPharmacyByNo(phno);
		} catch (Exception e) {}
       if(pharmacy == null) {
    	   return "redirect:error";
       }
       List<PharmacyReply> replyList = service.getPharmacyReplyList(phno);
       int reviewCount = service.countPharmacyReply(phno);
       int review5 = service.countPharmacyReply5(phno);
       int review4 = service.countPharmacyReply4(phno);
       int review3 = service.countPharmacyReply3(phno);
       int review2 = service.countPharmacyReply2(phno);
       int review1 = service.countPharmacyReply1(phno);
       
       double rate5 = (review5 + 1) / (double)reviewCount * 100;
       double rate4 = (review4 + 1) / (double)reviewCount * 100;
       double rate3 = (review3 + 1) / (double)reviewCount * 100;
       double rate2 = (review2 + 1) / (double)reviewCount * 100;
       double rate1 = (review1 + 1) / (double)reviewCount * 100;
       
       double average = Math.round(((review5 * 5) + (review4 * 4) + (review3 * 3) + (review2 * 2) + (review1 * 1))/(double)reviewCount * 100) / 100.0;
       System.out.println("dbg1, rate5:" + rate5 +" review5:" + review5 + " reviewCount:" + reviewCount);
       int recommand = (int)((review5+review4)/ (double)reviewCount * 100);
       
       
       model.addAttribute("pharmacy", pharmacy);
       model.addAttribute("replyList", replyList);
       model.addAttribute("replyCount", reviewCount);
       model.addAttribute("reply5", review5);
       model.addAttribute("reply4", review4);
       model.addAttribute("reply3", review3);
       model.addAttribute("reply2", review2);
       model.addAttribute("reply1", review1);
       model.addAttribute("rate5", rate5);
       model.addAttribute("rate4", rate4);
       model.addAttribute("rate3", rate3);
       model.addAttribute("rate2", rate2);
       model.addAttribute("rate1", rate1);
       model.addAttribute("average", average);
       model.addAttribute("recommand", recommand);
       
       
       
       Member member = (Member) session.getAttribute("loginMember");
       List<Product> cartList = new ArrayList<Product>();
       if(member != null) {
    	   cartList = shopService.getCartProductList(member.getMno());
       }
       model.addAttribute("cartList", cartList);
       model.addAttribute("cartSize", cartList.size());
       
       return "pharmacy/pharmacyview";
    }
	
	@PostMapping("/pharmacy/writeReply")
	public String writeReply(Model model, PharmacyReply reply, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/pharmacy/view?phno=" + reply.getPhno());
			return "common/msg";
		}
		
		reply.setMno(member.getMno());
		System.out.println(reply);
		int result = service.insertPharmacyReply(reply);
		shopService.updateProductAVG(reply.getPhno());
		
		if(result > 0) {
			model.addAttribute("msg", "댓글이 성공적으로 작성되었습니다.");
			model.addAttribute("location", "/pharmacy/view?phno=" + reply.getPhno());
		}else {
			model.addAttribute("msg", "댓글 작성에 실패하였습니다.");
			model.addAttribute("location", "/pharmacy/view?phno=" + reply.getPhno());
		}
		return "common/msg";
	}
	
	@PostMapping("/pharmacy/deleteReply")
	public String writeReply(Model model, int rno, int phno, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/phmarcy/view?phno=" + phno);
			return "common/msg";
		}
		int result = service.deletePharmacyReply(rno);
		if(result > 0) {
			model.addAttribute("msg", "댓글이 삭제 되었습니다.");
			model.addAttribute("location", "/pharmacy/view?phno=" + phno);
		}else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
			model.addAttribute("location", "/pharmacy/view?phno=" + phno);
		}
		return "common/msg";
	}

	
	

}
