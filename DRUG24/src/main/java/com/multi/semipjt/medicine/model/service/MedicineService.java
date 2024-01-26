package com.multi.semipjt.medicine.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.semipjt.medicine.model.mapper.MedicineMapper;
import com.multi.semipjt.medicine.model.vo.Medicine;
import com.multi.semipjt.medicine.model.vo.MedicineParam;

@Service
public class MedicineService {
	
	@Autowired
	private MedicineMapper mapper;
	
	public int getMedicineCount(MedicineParam param){
		return mapper.selectMedicineCount(param);
	}
	
	public List<Medicine> getMedicineList(MedicineParam param){
		return mapper.selectMedicineList(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Medicine findMedicineByNo(int dno) {
		Medicine medicine = mapper.selectMedicineByNo(dno);
		
		return medicine;
	}
}