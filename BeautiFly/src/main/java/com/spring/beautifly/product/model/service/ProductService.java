package com.spring.beautifly.product.model.service;

import java.util.List;
import java.util.Map;

import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;

public interface ProductService {
	
	int insertProduct(Product product, List<Attachment> attachList);

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
	 * ImageLevel = 0
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
	 * @return  views/product/Category/CategorySkinCareList
	 */
	List<Product> selectProductCategorySkinList();

	/**
	 * Menubar MakeUp 카테고리 list
	 * @param productType
	 * @return  views/product/Category/CategoryMakeUpList
	 */
	List<Product> selectProductCategoryMakeUpList();

	/**
	 * Menubar Body 카테고리 list
	 * @param productType
	 * @return  views/product/Category/CategoryBodyCareList
	 */
	List<Product> selectProductCategoryBodyList();
	
	/**
	 * Menubar Hair 카테고리 list
	 * @param productType
	 * @return  views/product/Category/CategoryHairCareList
	 */
	List<Product> selectProductCategoryHairList();
	
	/**
	 * Menubar Perfume 카테고리 list
	 * @param productType
	 * @return  views/product/Category/CategoryPerfumeList
	 */
	List<Product> selectProductCategoryPerfumeList();

	
	
	/**
	 * Menubar 화면에 있는 브랜드샵 list
	 * @return views/product/MainBrandProductList
	 */
	List<Product> selectProductMainBrandList();

	/**
	 * 관리자 페이지에 있는 상품 목록 조회 list
	 * @return views/mypage/admin/AdminProductView
	 */
	List<Product> AdminProductList();

	/**
	 * 관리자 계정으로 로그인 후 상품 상세 페이지에서 상품 수정 페이지 들어갔을 때 나오는 상품 수정 페이지 데이터 조회 
	 * @param productNo
	 * @return views/mypage/admin/AdminProductUpdate
	 */
	Product productUpdateView(int productNo);

	/**
	 * 상품 수정 페이지에서 수정한 값을 받아와서 db에 넣는 과정 (대표 이미지)
	 * @param originProduct
	 * @param attachList
	 * @return /product/AdminProductList.do
	 */
	int updateProduct(Product product, List<Attachment> attachList);

	/**
	 * 상품 수정 페이지에서 수정한 값을 받아와서 db에 넣는 과정 (상세 이미지)
	 * @param originProduct
	 * @param attachList2
	 * @return /product/AdminProductList.do
	 */
	int updateProduct2(Product product, List<Attachment> attachList2);

	/**
	 * 상품 상세 페이지에서 상품 삭제 버튼을 눌렀을 때 상품 삭제하기
	 * @param productNo
	 * @return index
	 */
	int deleteProduct(int productNo);
	
	
}
