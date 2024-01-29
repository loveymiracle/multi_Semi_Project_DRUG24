package com.multi.semipjt.medicine.model.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.multi.semipjt.medicine.model.vo.Medicine;
import com.multi.semipjt.medicine.model.vo.MedicineParam;
import com.multi.semipjt.medicine.model.vo.MedicineReply;
import com.multi.semipjt.pharmacy.model.vo.PharmacyReply;

@Mapper
public interface MedicineMapper {
	 List<Medicine> selectMedicineList(MedicineParam Param);
	 int selectMedicineCount(MedicineParam Param);
	 Medicine selectMedicineByNo(int dno);
	 
	 int insertMedicineReply(MedicineReply reply);
	 int deleteMedicineReply(int rNO);
	 List<MedicineReply> selectMedicineReplyList(int dNo);
	 int updateMedicineAVG(int dNo);
	 int countMedicineReply(int dNo);
	 int countMedicineReply5(int dNo);
	 int countMedicineReply4(int dNo);
	 int countMedicineReply3(int dNo);
	 int countMedicineReply2(int dNo);
	 int countMedicineReply1(int dNo);
}
