package com.multi.semipjt.pharmacy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.semipjt.pharmacy.model.mapper.PharmacyMapper;
import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.pharmacy.model.vo.PharmacyParam;

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
}