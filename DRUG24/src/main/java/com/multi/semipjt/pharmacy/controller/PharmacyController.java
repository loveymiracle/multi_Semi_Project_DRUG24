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
       
       model.addAttribute("pharmacy", pharmacy);
       model.addAttribute("replyList", replyList);
       
       Member member = (Member) session.getAttribute("loginMember");
       List<Product> cartList = new ArrayList<Product>();
       if(member != null) {
    	   cartList = shopService.getCartProductList(member.getMno());
       }
       model.addAttribute("cartList", cartList);
       model.addAttribute("cartSize", cartList.size());
       
       return "pharmacy/pharmacyView";
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
