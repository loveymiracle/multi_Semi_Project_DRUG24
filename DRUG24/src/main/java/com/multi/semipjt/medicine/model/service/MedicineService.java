package com.multi.semipjt.medicine.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.semipjt.medicine.model.mapper.MedicineMapper;
import com.multi.semipjt.medicine.model.vo.Medicine;
import com.multi.semipjt.medicine.model.vo.MedicineParam;
import com.multi.semipjt.medicine.model.vo.MedicineReply;
import com.multi.semipjt.pharmacy.model.vo.PharmacyReply;

@Service
public class MedicineService {

	@Autowired
	private MedicineMapper mapper;

	public int getMedicineCount(MedicineParam param) {
		return mapper.selectMedicineCount(param);
	}

	public List<Medicine> getMedicineList(MedicineParam param) {
		return mapper.selectMedicineList(param);
	}

	@Transactional(rollbackFor = Exception.class)
	public Medicine findMedicineByNo(int dno) {
		Medicine medicine = mapper.selectMedicineByNo(dno);

		return medicine;
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertMedicineReply(MedicineReply reply) {
		return mapper.insertMedicineReply(reply);
	}

	@Transactional(rollbackFor = Exception.class)
	public int deleteMedicineReply(int rNo) {
		return mapper.deleteMedicineReply(rNo);
	}

	public List<MedicineReply> getMedicineReplyList(int dNo) {
		return mapper.selectMedicineReplyList(dNo);
	}

	public int updateMedicineAVG(int dNo) {
		return mapper.updateMedicineAVG(dNo);
	}

	public int countMedicineReply(int dNo) {
		return mapper.countMedicineReply(dNo);
	}
	
	public int countMedicineReply5(int dNo) {
		return mapper.countMedicineReply5(dNo);
	}
	public int countMedicineReply4(int dNo) {
		return mapper.countMedicineReply4(dNo);
	}
	public int countMedicineReply3(int dNo) {
		return mapper.countMedicineReply3(dNo);
	}
	public int countMedicineReply2(int dNo) {
		return mapper.countMedicineReply2(dNo);
	}
	public int countMedicineReply1(int dNo) {
		return mapper.countMedicineReply1(dNo);
	}

}