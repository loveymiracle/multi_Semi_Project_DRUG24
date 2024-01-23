package com.multi.semipjt.pharmacy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.pharmacy.model.vo.PharmacyParam;

@Mapper
public interface PharmacyMapper {
	 List<Pharmacy> selectPharmacyList(PharmacyParam Param);
	 int selectPharmacyCount(PharmacyParam param);
	 Pharmacy selectPharmacyByNo(int phno);
	 int insertPharmacy(Pharmacy p);
}
