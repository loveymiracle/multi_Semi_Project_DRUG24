package com.multi.semipjt.medicine.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.semipjt.medicine.model.vo.Medicine;
import com.multi.semipjt.medicine.model.vo.MedicineParam;

@Mapper
public interface MedicineMapper {
	 List<Medicine> selectMedicineList(MedicineParam Param);
	 int selectMedicineCount(MedicineParam Param);
	 Medicine selectMedicineByNo(int dno);
}
