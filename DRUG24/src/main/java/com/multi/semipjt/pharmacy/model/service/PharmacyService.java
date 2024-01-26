package com.multi.semipjt.pharmacy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.semipjt.pharmacy.model.mapper.PharmacyMapper;
import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.pharmacy.model.vo.PharmacyParam;
import com.multi.semipjt.pharmacy.model.vo.PharmacyReply;
import com.multi.semipjt.shop.model.vo.ProductReply;

@Service
public class PharmacyService {
	
	@Autowired
	private PharmacyMapper mapper;
	
	public int getPharmacyCount(PharmacyParam param){
		return mapper.selectPharmacyCount(param);
	}
	
	public List<Pharmacy> getPharmacyList(PharmacyParam param){
		return mapper.selectPharmacyList(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Pharmacy findPharmacyByNo(int phno) {
		Pharmacy pharmacy = mapper.selectPharmacyByNo(phno);
		
		return pharmacy;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int savePharmacy(Pharmacy p) {
		return mapper.insertPharmacy(p);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertPharmacyReply(PharmacyReply reply) {
		return mapper.insertPharmacyReply(reply);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public int deletePharmacyReply(int rNo) {
		return mapper.deletePharmacyReply(rNo);
	}
	
	public List<PharmacyReply> getPharmacyReplyList(int phNo){
		return mapper.selectPharmacyReplyList(phNo);
	}
	
	public int updatePharmacyAVG(int phNo) {
		return mapper.updatePharmacyAVG(phNo);
	}
	
	public int countPharmacyReply(int phNo) {
		return mapper.countPharmacyReply(phNo);
	}
}