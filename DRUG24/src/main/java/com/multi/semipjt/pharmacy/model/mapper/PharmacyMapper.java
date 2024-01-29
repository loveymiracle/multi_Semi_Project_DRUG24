package com.multi.semipjt.pharmacy.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.semipjt.pharmacy.model.vo.Pharmacy;
import com.multi.semipjt.pharmacy.model.vo.PharmacyParam;
import com.multi.semipjt.pharmacy.model.vo.PharmacyReply;
import com.multi.semipjt.shop.model.vo.ProductReply;

@Mapper
public interface PharmacyMapper {
	 List<Pharmacy> selectPharmacyList(PharmacyParam Param);
	 int selectPharmacyCount(PharmacyParam param);
	 Pharmacy selectPharmacyByNo(int phno);
	 int insertPharmacy(Pharmacy p);
	 
	 int insertPharmacyReply(PharmacyReply reply);
	 int deletePharmacyReply(int rNO);
	 List<PharmacyReply> selectPharmacyReplyList(int pNo);
	 int updatePharmacyAVG(int pNo);
	 int countPharmacyReply(int pNo);
	 
	 int countPharmacyReply5(int pNo);
	 int countPharmacyReply4(int pNo);
	 int countPharmacyReply3(int pNo);
	 int countPharmacyReply2(int pNo);
	 int countPharmacyReply1(int pNo);
}
