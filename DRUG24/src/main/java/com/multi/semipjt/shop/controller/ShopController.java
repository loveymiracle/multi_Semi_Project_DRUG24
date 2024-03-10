package com.multi.semipjt.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.member.model.vo.Member;
import com.multi.semipjt.shop.model.service.ShopService;
import com.multi.semipjt.shop.model.vo.Cart;
import com.multi.semipjt.shop.model.vo.Product;
import com.multi.semipjt.shop.model.vo.ProductReply;

@Controller
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/shop/main")
	public String mainPage(Model model, HttpSession session,
			@RequestParam Map<String, Object> paramMap,
			@RequestParam(required = false) String[] kinds,
			@RequestParam(required = false) String[] brands
			) {
		int page = 1;
		System.out.println(page);
		System.out.println(paramMap);
		System.out.println(Arrays.toString(kinds));
		System.out.println(Arrays.toString(brands));
		
		if(paramMap.get("page") != null) {
			try {
				page = Integer.parseInt((String) paramMap.get("page"));
			} catch (Exception e) {}
		}
		if(kinds != null && kinds.length > 0) {
			paramMap.put("kinds", Arrays.asList(kinds));
		} else {
			paramMap.remove("kinds");
		}
		
		if(brands != null && brands.length > 0) {
			paramMap.put("brands", Arrays.asList(brands));
		} else {
			paramMap.remove("brands");
		}
		
		int count = shopService.getProductCount(paramMap);
		PageInfo pageInfo = new PageInfo(page, 5, count, 12);
		List<Product> list = shopService.getProductList(pageInfo,  paramMap);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("parammap", paramMap);
		
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		
		return "/shop/shop-main";
	}
	
	public static int pageCount = 0;
	
	@GetMapping("/shop/product")
	public String productView(Model model, int pno, HttpSession session) {
		Product product = shopService.getProductById(pno);
		List<ProductReply> replyList = shopService.getProductReplyList(pno);
		
		
		// 대표상품 4개, - 비타민C, 프로바이오틱스 2세트
		Map<String, Object> map = new HashMap<>();
		map.put("title", "비타민C");
		int count = shopService.getProductCount(map);
		System.out.println(count);
		PageInfo pageInfo = new PageInfo(pageCount++ % 5 + 1, 6, count, 6);
		List<Product> plist1 = shopService.getProductList(pageInfo, map);
		
		map.put("title", "프로바이오틱스");
		count = shopService.getProductCount(map);
		System.out.println(count);
		pageInfo = new PageInfo(pageCount++ % 5 + 1, 6, count, 6);
		List<Product> plist2 = shopService.getProductList(pageInfo, map);
		plist1.addAll(plist2);
		Collections.shuffle(plist1);
		
		int reviewCount = shopService.countProductReply(pno);
        int review5 = shopService.countProductReply5(pno);
        int review4 = shopService.countProductReply4(pno);
        int review3 = shopService.countProductReply3(pno);
        int review2 = shopService.countProductReply2(pno);
        int review1 = shopService.countProductReply1(pno);
       
        double rate5 = (review5 + 1) / (double)reviewCount * 100;
        double rate4 = (review4 + 1) / (double)reviewCount * 100;
        double rate3 = (review3 + 1) / (double)reviewCount * 100;
        double rate2 = (review2 + 1) / (double)reviewCount * 100;
        double rate1 = (review1 + 1) / (double)reviewCount * 100;
       
        double average = Math.round(((review5 * 5) + (review4 * 4) + (review3 * 3) + (review2 * 2) + (review1 * 1))/(double)reviewCount * 100) / 100.0;
        System.out.println("dbg1, rate5:" + rate5 +" review5:" + review5 + " reviewCount:" + reviewCount);
        int recommand = (int)((review5+review4)/ (double)reviewCount * 100);
		
		model.addAttribute("plist1", plist1);
		model.addAttribute("product", product);
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
		return "/shop/shop-single";
	}
	
	@PostMapping("/shop/writeReply")
	public String writeReply(Model model, ProductReply reply, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/shop/product?pno=" + reply.getPno());
			return "common/msg";
		}
		
		reply.setMno(member.getMno());
		System.out.println(reply);
		int result = shopService.insertProductReply(reply);
		shopService.updateProductAVG(reply.getPno());
		
		if(result > 0) {
			model.addAttribute("msg", "댓글이 성공적으로 작성되었습니다.");
			model.addAttribute("location", "/shop/product?pno=" + reply.getPno());
		}else {
			model.addAttribute("msg", "댓글 작성에 실패하였습니다.");
			model.addAttribute("location", "/shop/product?pno=" + reply.getPno());
		}
		return "common/msg";
	}
	
	@PostMapping("/shop/deleteReply")
	public String writeReply(Model model, int rno, int pno, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/shop/product?pno=" + pno);
			return "common/msg";
		}
		int result = shopService.deleteProductReply(rno);
		if(result > 0) {
			model.addAttribute("msg", "댓글이 삭제 되었습니다.");
			model.addAttribute("location", "/shop/product?pno=" + pno);
		}else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
			model.addAttribute("location", "/shop/product?pno=" + pno);
		}
		return "common/msg";
	}
	
	@RequestMapping("/shop/cart")
	public String cartView(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		List<Product> list = shopService.getCartProductList(member.getMno());
		
		Map<String, Object> map = new HashMap<>();
		map.put("title", "비타민C");
		int count = shopService.getProductCount(map);
		System.out.println(count);
		PageInfo pageInfo = new PageInfo(pageCount++ % 5 + 1, 6, count, 6);
		List<Product> plist1 = shopService.getProductList(pageInfo, map);
		
		map.put("title", "프로바이오틱스");
		count = shopService.getProductCount(map);
		System.out.println(count);
		pageInfo = new PageInfo(pageCount++ % 5 + 1, 6, count, 6);
		List<Product> plist2 = shopService.getProductList(pageInfo, map);
		plist1.addAll(plist2);
		Collections.shuffle(plist1);
		model.addAttribute("plist1", plist1);
		model.addAttribute("list", list);
		
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		return "shop/shop-cart";
	}
	

	// 장바구니 기능은 AJAX로 구현할것!! 아래 임시 코드나 급할때만 사용하세요.
	@RequestMapping("/shop/addCart")
	String addCart(Model model, HttpSession session, int pno) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("pno", ""+pno);
		map.put("mno", ""+member.getMno());
		
		int result = 0;
		List<Cart> list = shopService.getCart(map);
		if(list == null || list.size() == 0) {
			Cart cart = new Cart(member.getMno(), pno, 1, 0);
			result = shopService.insertCart(cart);
		}else {
			Cart cart = list.get(0);
			cart.setAmount(cart.getAmount() + 1);
			result = shopService.updateCart(cart);
		}
		
		if(result >0) {
			model.addAttribute("msg", "장바구니에 담겼습니다.");
			model.addAttribute("location", "/shop/main");
		} else {
			model.addAttribute("msg", "장바구니 담기에 실패하였습니다.");
			model.addAttribute("location", "/shop/main");
		}
		return "common/msg";
	}
	
	
	
	@RequestMapping("/shop/deleteCart")
	String dleteCart(Model model, HttpSession session, int pno, String url) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		Cart cart = new Cart(member.getMno(), pno, 0, 0);
		int result = shopService.deleteCart(cart);
		
		if(result >0) {
			model.addAttribute("msg", "장바구니가 삭제되었습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "장바구니 삭제에 실패하였습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
}