package com.multi.semipjt.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.semipjt.common.util.PageInfo;
import com.multi.semipjt.shop.model.mapper.ShopMapper;
import com.multi.semipjt.shop.model.vo.Cart;
import com.multi.semipjt.shop.model.vo.Product;
import com.multi.semipjt.shop.model.vo.ProductReply;

@Service
public class ShopService {
	@Autowired
	ShopMapper mapper;
	
	@Transactional(rollbackFor = Exception.class)
	public int insertProduct(Product p) {
		return mapper.insertProduct(p);
	}
	
	public int getProductCount(Map<String, Object> param) {
		return mapper.selectProductCount(param);
	}
	
	public List<Product> getProductList(PageInfo pageInfo, Map<String, Object> param){
		param.put("limit", ""+pageInfo.getListLimit());
		param.put("offset", ""+(pageInfo.getStartList() - 1));
		return mapper.selectProductList(param);
	}
	
	public Product getProductById(int pId){
		return mapper.selectProductById(pId);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertProductReply(ProductReply reply) {
		return mapper.insertProductReply(reply);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteProductReply(int rNo) {
		return mapper.deleteProductReply(rNo);
	}
	
	public List<ProductReply> getProductReplyList(int pNO){
		return mapper.selectProductReplyList(pNO);
	}
	
	public int updateProductAVG(int pNO) {
		return mapper.updateProductAVG(pNO);
	}
	
	public int countProductReply(int pNO) {
		return mapper.countProductReply(pNO);
	}
	
	public int countProductReply5(int pNO) {
		return mapper.countProductReply5(pNO);
	}
	public int countProductReply4(int pNO) {
		return mapper.countProductReply4(pNO);
	}
	public int countProductReply3(int pNO) {
		return mapper.countProductReply3(pNO);
	}
	public int countProductReply2(int pNO) {
		return mapper.countProductReply2(pNO);
	}
	public int countProductReply1(int pNO) {
		return mapper.countProductReply1(pNO);
	}
	
	public List<Cart> getCart(Map<String, String> map){
		return mapper.selectCart(map);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertCart(Cart cart) {
		return mapper.insertCart(cart);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int updateCart(Cart cart) {
		return mapper.updateCart(cart);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteCart(Cart cart) {
		return mapper.deleteCart(cart);
	}
	
	public List<Product> getCartProductList(int mno){
		return mapper.selectCartProductList(mno);
	}

}
