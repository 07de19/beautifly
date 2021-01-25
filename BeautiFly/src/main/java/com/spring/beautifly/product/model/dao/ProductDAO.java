package com.spring.beautifly.product.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;

public interface ProductDAO {

	int insertProduct(Product product);

	int insertAttachment(Attachment a);

	/**
	 * Menubar 화면에 있는 베스트 list
	 * @return views/product/MainBestProductList
	 */
	List<Product> selectProductBestList();
	
	/**
	 * Menubar 화면에 있는 신상품 list
	 * @return views/product/MainNewProductList
	 */
	List<Product> selectProductNewList();

	/**
	 * Main(index) 화면에 있는 top 6
	 * @return index
	 */
	List<Product> selectProductMainTopList();

	/**
	 * Main(index) 화면에 있는 신상품 3
	 * @return index
	 */
	List<Product> selectProductMainNewList();
	
	/**
	 * 화장품 상세 조회 페이지 product vo 용
	 * @param no
	 * @return views/product/ProductDetailView
	 */
	Product selectOneProduct(int productNo);

	/**
	 * 화장품 상세 조회 페이지 AttachmentList 용
	 * @param no
	 * @return views/product/ProductDetailView
	 */
	List<Attachment> selectProductAttachmentList(int productNo);
	
	/**
	 * 화장품 상세 조회 페이지 AttachmentList 용
	 * ImageLevel = 1
	 * @param no
	 * @return views/product/ProductDetailView
	 */
	List<Attachment> selectProductAttachmentList2(int productNo);

	/**
	 * Menubar Skin 카테고리 list
	 * @param productType
	 * @return  views/product/ProductCategoryList
	 */
	List<Product> selectProductCategorySkinList();

	/**
	 * Menubar MakeUp 카테고리 list
	 * @param productType
	 * @return  views/product/ProductCategoryList
	 */
	List<Product> selectProductCategoryMakeUpList();
	
	/**
	 * Menubar Body 카테고리 list
	 * @param productType
	 * @return  views/product/ProductCategoryList
	 */
	List<Product> selectProductCategoryBodyList();
	
	/**
	 * Menubar Hair 카테고리 list
	 * @param productType
	 * @return  views/product/ProductCategoryList
	 */
	List<Product> selectProductCategoryHairList();
	
	/**
	 * Menubar Perfume 카테고리 list
	 * @param productType
	 * @return  views/product/ProductCategoryList
	 */
	List<Product> selectProductCategoryPerfumeList();

	
	/**
	 * Menubar 화면에 있는 브랜드샵 list
	 * @return views/product/MainBrandProductList
	 */
	List<Product> selectProductMainBrandList();

	/**
	 * 관리자 페이지에 있는 상품 목록 조회 list
	 * @return
	 */
	List<Product> AdminProductList();

	/**
	 * 상품 정보 업데이트
	 * @param product
	 * @return
	 */
	int updateProduct(Product product);

	/**
	 * 상품 정보 수정 페이지에서 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
	 * @param productNo
	 * @return
	 */
	int deleteAttachment(int productNo);

	/**
	 * 상품 정보 수정 페이지에서 새로 받아온 첨부파일을 db에 넣는 것
	 * @param a
	 * @return
	 */
	int updateAttachment(Attachment a);

	/**
	 * 상품 상세 페이지에서 상품 삭제 버튼을 눌렀을 때 상품 삭제하기
	 * @param productNo
	 * @return index
	 */
	int deleteProduct(int productNo);


}
