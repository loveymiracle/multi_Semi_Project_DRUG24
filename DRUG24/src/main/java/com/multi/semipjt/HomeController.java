package com.multi.semipjt;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.api.naver.NaverSearchAPI;
import com.multi.semipjt.api.pharmacy.PharmacyInfoApi;
import com.multi.semipjt.board.controller.BoardController;
import com.multi.semipjt.board.model.service.BoardService;
import com.multi.semipjt.board.model.vo.Board;
import com.multi.semipjt.board.model.vo.BoardCategory;
import com.multi.semipjt.board.model.vo.BoardParam;
import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.member.model.service.MemberService;
import com.multi.semipjt.member.model.vo.Member;
import com.multi.semipjt.pharmacy.model.service.PharmacyService;
import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.shop.model.service.ShopService;
import com.multi.semipjt.shop.model.vo.Product;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BoardController boardController;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private PharmacyService pharmacyService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session,
			@RequestParam Map<String, String> param) {
		logger.info("Welcome home!");
		System.out.println("@@@@@@@@@@@@@@@@@");
//		Member loginMember = memberService.login("admin", "1234");
//		session.setAttribute("loginMember", loginMember);
		
		
		if(param.get("init") != null) {
			int result = initDB();
			model.addAttribute("msg", "초기화 결과 : " + result);
			model.addAttribute("location", "/");
			return "/common/msg";
		}
		
		if(param.get("initPharmacy") != null) {
			int result = initPharmacy();
			model.addAttribute("msg", "초기화 결과 : " + result);
			model.addAttribute("location", "/");
			return "/common/msg";
		}
		
		if(param.get("test") != null) {
			int result = test();
			model.addAttribute("msg", "초기화 결과 : " + result);
			model.addAttribute("location", "/");
			return "/common/msg";
		}
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("title", "프로바이오틱스");
			int count = shopService.getProductCount(map);
			PageInfo pageInfo = new PageInfo(1, 10, count, 4);
			List<Product> plist1 = shopService.getProductList(pageInfo, map);
			
			map.put("title", "멀티비타민");
			count = shopService.getProductCount(map);
			pageInfo = new PageInfo(1, 10, count, 4);
			List<Product> plist2 = shopService.getProductList(pageInfo, map);
			plist1.addAll(plist2);
			model.addAttribute("plist1", plist1);
			
			BoardParam param1 = new BoardParam(null, null, new String[]{"NBOARD"}, 1, 6, 0);
			List<Board> blist1 = service.getBoardList(param1);
			model.addAttribute("blist1", blist1);
			param1 = new BoardParam(null, null, new String[]{"QUESTION"}, 1, 8, 0);
			List<Board> blist2 = service.getBoardList(param1);
			model.addAttribute("blist2", blist2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Member member = (Member) session.getAttribute("loginMember");
		List<Product> cartList = new ArrayList<Product>();
		if(member != null) {
			cartList = shopService.getCartProductList(member.getMno());
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartSize", cartList.size());
		
		return "home";
	}
	
	@Autowired
	ShopService shopService;
	
	private int initDB() {
		int result = 0;
		List<Product> plist = new ArrayList<>();
		plist.addAll(NaverSearchAPI.getProductList("프로바이오틱스", 50, 1));
		plist.addAll(NaverSearchAPI.getProductList("유산균", 20, 1));
		plist.addAll(NaverSearchAPI.getProductList("비타민", 50, 1));
		plist.addAll(NaverSearchAPI.getProductList("마그네슘", 20, 1));
		Collections.shuffle(plist);
		
		for(Product p : plist) {
			int result2 = shopService.insertProduct(p);
			result += result2;
		}
		
		return result;
	}
	
	
	public int initPharmacy() {
		List<Pharmacy> list = PharmacyInfoApi.parsePharmacyByXML();
		for(Pharmacy p : list) {
			System.out.println(p);
			pharmacyService.savePharmacy(p);
		}
		return list.size();
	}

	public int test() {
		int result = 0;
		Map<String, Object> map = new HashMap<>();
		map.put("title", "프로바이오틱스");
		
		int count = shopService.getProductCount(map);
		PageInfo pageInfo = new PageInfo(1, 10, count, 10);
		List<Product> list = shopService.getProductList(pageInfo, map);
		for(Product p : list) {
			System.out.println(p);
		}
		result += list.size();
		
		return result;
	}
	
}
