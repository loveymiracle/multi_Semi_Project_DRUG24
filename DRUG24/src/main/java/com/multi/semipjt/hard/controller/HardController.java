package com.multi.semipjt.hard.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.semipjt.member.model.vo.Member;
import com.multi.semipjt.shop.model.service.ShopService;
import com.multi.semipjt.shop.model.vo.Product;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class HardController {
	@Autowired
	ShopService shopService;
	
	@RequestMapping("/news/card01")
	public String cardnews(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		return "/hard/cardnews-1";
	}
	@RequestMapping("/news/card02")
	public String cardnews2(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		return "/hard/cardnews-2";
	}
	@RequestMapping("/news/card03")
	public String cardnews3(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		return "/hard/cardnews-3";
	}
	@RequestMapping("/drug/instruction")
	public String usemethod(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		return "/hard/instruction";
	}
	@RequestMapping("/drug/safetyletter")
	public String safetyletter(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		return "/hard/safetyletter";
	}
}
