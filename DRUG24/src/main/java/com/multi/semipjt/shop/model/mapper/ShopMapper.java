package com.multi.semipjt.shop.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.semipjt.shop.model.vo.Cart;
import com.multi.semipjt.shop.model.vo.Product;
import com.multi.semipjt.shop.model.vo.ProductReply;

@Mapper
public interface ShopMapper {
	int insertProduct(Product p);
	int selectProductCount(Map<String, Object> param);
	List<Product> selectProductList(Map<String, Object> param);
	Product selectProductById(int pId);
	int insertProductReply(ProductReply reply);
	int deleteProductReply(int rNO);
	List<ProductReply> selectProductReplyList(int pNo);
	int updateProductAVG(int pNo);
	List<Cart> selectCart(Map<String, String> map);
	int insertCart(Cart cart);
	int updateCart(Cart cart);
	int deleteCart(Cart cart);
	List<Product> selectCartProductList(int mno);
}
