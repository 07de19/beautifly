package com.spring.beautifly.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertProduct(Product product) {
		return sqlSession.insert("productMapper.insertProduct", product);
	}
	
	@Override
	public int insertAttachment(Attachment a) {
		return sqlSession.insert("productMapper.insertAttachment", a);
	}
	
	@Override
	public List<Product> selectProductBestList() {
		return sqlSession.selectList("productMapper.selectProductBestList");
	}

	@Override
	public List<Product> selectProductNewList() {
		return sqlSession.selectList("productMapper.selectProductNewList");
	}

	@Override
	public List<Product> selectProductMainTopList() {
		return sqlSession.selectList("productMapper.selectProductMainTopList");
	}

	@Override
	public List<Product> selectProductMainNewList() {
		return sqlSession.selectList("productMapper.selectProductMainNewList");
	}

	@Override
	public Product selectOneProduct(int productNo) {
		return sqlSession.selectOne("productMapper.selectOneProduct", productNo);
	}

	@Override
	public List<Attachment> selectProductAttachmentList(int productNo) {
		return sqlSession.selectList("productMapper.selectProductAttachmentList", productNo);
	}

	@Override
	public List<Attachment> selectProductAttachmentList2(int productNo) {
		return sqlSession.selectList("productMapper.selectProductAttachmentList2", productNo);
	}

	@Override
	public List<Product> selectProductCategorySkinList() {
		return sqlSession.selectList("productMapper.selectProductCategorySkinList");
	}

	@Override
	public List<Product> selectProductCategoryMakeUpList() {
		return sqlSession.selectList("productMapper.selectProductCategoryMakeUpList");
	}

	@Override
	public List<Product> selectProductCategoryBodyList() {
		return sqlSession.selectList("productMapper.selectProductCategoryBodyList");
	}

	@Override
	public List<Product> selectProductCategoryHairList() {
		return sqlSession.selectList("productMapper.selectProductCategoryHairList");
	}

	@Override
	public List<Product> selectProductCategoryPerfumeList() {
		return sqlSession.selectList("productMapper.selectProductCategoryPerfumeList");
	}

	@Override
	public List<Product> selectProductMainBrandList() {
		return sqlSession.selectList("productMapper.selectProductMainBrandList");
	}

	@Override
	public List<Product> AdminProductList() {
		return sqlSession.selectList("productMapper.AdminProductList");
	}

	@Override
	public int updateProduct(Product product) {
		return sqlSession.update("productMapper.updateProduct", product);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("productMapper.updateAttachment", a);
	}
	
	@Override
	public int deleteAttachment(int productNo) {
		return sqlSession.insert("productMapper.deleteAttachment", productNo);
	}

	@Override
	public int deleteProduct(int productNo) {
		return sqlSession.delete("productMapper.deleteProduct", productNo);
	}


	
	
	

}
