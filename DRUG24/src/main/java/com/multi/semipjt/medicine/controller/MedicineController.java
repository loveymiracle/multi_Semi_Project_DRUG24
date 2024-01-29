package com.multi.semipjt.medicine.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.medicine.model.service.MedicineService;
import com.multi.semipjt.medicine.model.vo.Medicine;
import com.multi.semipjt.medicine.model.vo.MedicineParam;
import com.multi.semipjt.medicine.model.vo.MedicineReply;
import com.multi.semipjt.member.model.vo.Member;
import com.multi.semipjt.pharmacy.model.vo.PharmacyReply;
import com.multi.semipjt.shop.model.service.ShopService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MedicineController {
	
	@Autowired
	private MedicineService service;
	
	
	@Bean(initMethod = "init")
	void test() {
		System.out.println("!!!");
	}
	
	@RequestMapping("medicine/search")
	public String list(Model model, MedicineParam param) {
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
		
		return "medicine/medicineSearch";
	}

	
	@RequestMapping("/medicine/view")
	  public String view(Model model, @RequestParam("dno") int dno) {
		Medicine medicine = null;
		try {
			medicine = service.findMedicineByNo(dno);
		} catch (Exception e) {}
       if(medicine == null) {
    	   return "redirect:error";
       }
       List<MedicineReply> replyList = service.getMedicineReplyList(dno);
       int reviewCount = service.countMedicineReply(dno);
       int review5 = service.countMedicineReply5(dno);
       int review4 = service.countMedicineReply4(dno);
       int review3 = service.countMedicineReply3(dno);
       int review2 = service.countMedicineReply2(dno);
       int review1 = service.countMedicineReply1(dno);
       
       double rate5 = (review5 + 1) / (double)reviewCount * 100;
       double rate4 = (review4 + 1) / (double)reviewCount * 100;
       double rate3 = (review3 + 1) / (double)reviewCount * 100;
       double rate2 = (review2 + 1) / (double)reviewCount * 100;
       double rate1 = (review1 + 1) / (double)reviewCount * 100;
       
       double average = Math.round(((review5 * 5) + (review4 * 4) + (review3 * 3) + (review2 * 2) + (review1 * 1))/(double)reviewCount * 100) / 100.0;
       System.out.println("dbg1, rate5:" + rate5 +" review5:" + review5 + " reviewCount:" + reviewCount);
       int recommand = (int)((review5+review4)/ (double)reviewCount * 100);
       
       model.addAttribute("medicine", medicine);
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
       
       return "medicine/medicineView";
    }
	
	@PostMapping("/medicine/writeReply")
	public String writeReply(Model model, MedicineReply reply, HttpSession session) {
		System.out.println("#####" + reply);
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/medicine/view?dno=" + reply.getDno());
			return "common/msg";
		}
		
		reply.setMno(member.getMno());
		System.out.println(reply);
		int result = service.insertMedicineReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "댓글이 성공적으로 작성되었습니다.");
			model.addAttribute("location", "/medicine/view?dno=" + reply.getDno());
		}else {
			model.addAttribute("msg", "댓글 작성에 실패하였습니다.");
			model.addAttribute("location", "/medicine/view?dno=" + reply.getDno());
		}
		return "common/msg";
	}
	
	@PostMapping("/medicine/deleteReply")
	public String writeReply(Model model, int rno, String dno, HttpSession session) {
		Member member = (Member) session.getAttribute("loginMember");
		if(member == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("location", "/medicine/view?dno=" + dno);
			return "common/msg";
		}
		int result = service.deleteMedicineReply(rno);
		if(result > 0) {
			model.addAttribute("msg", "댓글이 삭제 되었습니다.");
			model.addAttribute("location", "/medicine/view?dno=" + dno);
		}else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
			model.addAttribute("location", "/medicine/view?dno=" + dno);
		}
		return "common/msg";
	}
	
	

}
