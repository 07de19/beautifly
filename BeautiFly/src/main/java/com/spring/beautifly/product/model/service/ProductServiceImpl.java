package com.spring.beautifly.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beautifly.common.exception.ProductException;
import com.spring.beautifly.product.model.dao.ProductDAO;
import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Override
	public int insertProduct(Product product, List<Attachment> attachList) {
		// 인서트가 가져와야 할 것이 많음(게시글을 등록할 때 첨부파일들도 가져와야 함)
		int result1 = productDAO.insertProduct(product);
		
		if (result1 == 0) {
			// 잘 안 된 것
			throw new ProductException();
		}
		
		if (attachList.size() > 0) {
			// 즉 첨부파일이 하나라도 들어왔다면(게시글의 첨부파일이 있다면 실행해라!)
			for (Attachment a : attachList) {
				// 반복문으로
				int result2 = productDAO.insertAttachment(a); // a 정보를 주고
				if (result2 == 0) {
					// 첨부파일이 추가가 안되었다면
					throw new ProductException("첨부파일 추가 실패!");
				}
			}
		}
		return result1;
	}

	@Override
	public List<Product> selectProductBestList() {
		return productDAO.selectProductBestList();
	}
	
	@Override
	public List<Product> selectProductNewList() {
		return productDAO.selectProductNewList();
	}

	@Override
	public List<Product> selectProductMainTopList() {
		return productDAO.selectProductMainTopList();
	}

	@Override
	public List<Product> selectProductMainNewList() {
		return productDAO.selectProductMainNewList();
	}

	@Override
	public Product selectOneProduct(int productNo) {
		Product product = productDAO.selectOneProduct(productNo);
		
		return product;
	}

	@Override
	public List<Attachment> selectProductAttachmentList(int productNo) {
		return productDAO.selectProductAttachmentList(productNo);
	}

	@Override
	public List<Attachment> selectProductAttachmentList2(int productNo) {
		return productDAO.selectProductAttachmentList2(productNo);
	}

	@Override
	public List<Product> selectProductCategorySkinList() {
		return productDAO.selectProductCategorySkinList();
	}

	@Override
	public List<Product> selectProductCategoryMakeUpList() {
		return productDAO.selectProductCategoryMakeUpList();
	}

	@Override
	public List<Product> selectProductCategoryBodyList() {
		return productDAO.selectProductCategoryBodyList();
	}

	@Override
	public List<Product> selectProductCategoryHairList() {
		return productDAO.selectProductCategoryHairList();
	}

	@Override
	public List<Product> selectProductCategoryPerfumeList() {
		return productDAO.selectProductCategoryPerfumeList();
	}

	@Override
	public List<Product> selectProductMainBrandList() {
		return productDAO.selectProductMainBrandList();
	}

	@Override
	public List<Product> AdminProductList() {
		return productDAO.AdminProductList();
	}

	@Override
	public Product productUpdateView(int productNo) {
		Product product = productDAO.selectOneProduct(productNo);
		
		return product;
	}

	@Override
	public int updateProduct(Product product, List<Attachment> attachList) {
		int totalResult = 0;
	      
	    List<Attachment> originList = productDAO.selectProductAttachmentList(product.getProductNo()); // 원본을 먼저 받아오기
	      
	    totalResult = productDAO.updateProduct(product);
	      
	    if(totalResult == 0) throw new ProductException("게시글 수정 실패!");
	      
	    // 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
	    if( originList.size() > 0 ) {
	       totalResult = productDAO.deleteAttachment(product.getProductNo());
	         
	       // 삭제가 제대로 되지 않았다면
	       if(totalResult == 0) throw new ProductException("첨부 파일 삭제 실패!");
	    }
	    
	    // 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
	    if (attachList.size() > 0) {
			for (Attachment a : attachList) { // Attachment를 attachList로 하나씩 끄집어 낸다
				totalResult = productDAO.updateAttachment(a); // update라고 쓰지만, SQL은 insert로 적어야함(새로 파일을 넣는 것이기 때문)
				
				if (totalResult == 0) throw new ProductException("첨부파일 추가 실패!");
			}
		}
	      
	    return totalResult; // 결과를 보내주면 컨트롤러에서 결과가 맞으면 성공, 아니면 실패로 보내줌
	}

	@Override
	public int updateProduct2(Product product, List<Attachment> attachList2) {
		int totalResult = 0;
	      
	    List<Attachment> originList = productDAO.selectProductAttachmentList2(product.getProductNo()); // 원본을 먼저 받아오기
	      
	    totalResult = productDAO.updateProduct(product);
	      
	    if(totalResult == 0) throw new ProductException("게시글 수정 실패!");
	      
	    // 이전 첨부파일이 있다면, DB의 이전 파일 기록을 삭제하기
	    if( originList.size() > 0 ) {
	       totalResult = productDAO.deleteAttachment(product.getProductNo());
	         
	       // 삭제가 제대로 되지 않았다면
	       if(totalResult == 0) throw new ProductException("첨부 파일 삭제 실패!");
	    }
	    
	    // 이전의 첨부파일은 없고, 새로 추가한 첨부파일이 있다면
	    if (attachList2.size() > 0) {
			for (Attachment a : attachList2) { // Attachment를 attachList로 하나씩 끄집어 낸다
				totalResult = productDAO.updateAttachment(a); // update라고 쓰지만, SQL은 insert로 적어야함(새로 파일을 넣는 것이기 때문)
				
				if (totalResult == 0) throw new ProductException("첨부파일 추가 실패!");
			}
		}
	      
	    return totalResult; // 결과를 보내주면 컨트롤러에서 결과가 맞으면 성공, 아니면 실패로 보내줌
	}

	@Override
	public int deleteProduct(int productNo) {
		return productDAO.deleteProduct(productNo);
	}

	
	

}
