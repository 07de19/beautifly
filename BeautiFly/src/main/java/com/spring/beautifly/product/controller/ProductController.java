package com.spring.beautifly.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;
import com.spring.beautifly.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/product/AdminProductInsert.do")
	public String AdminProductInsert() { // AdminProductInsert.jsp 화면으로 이동
		return "views/mypage/admin/AdminProductInsert";
	}
	
	@RequestMapping("/product/productInsertEnd.do")
	public String insertProduct(Product product, Model model, HttpServletRequest req,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		
		// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
		String saveDirectory = req.getServletContext().getRealPath("/resources/productUpload"); // 파일 저장 경로 찾아가게 저장해주기
		List<Attachment> attachList = new ArrayList<Attachment>(); // 첨부 파일을 저장할 객체 리스트 생성
		
		/*** MultipartFile 로 파일 업로드 처리하기 ***/
		
		// 위에서 목록으로 가져온 upFiles에서 for-each 문 돌리기
		for (MultipartFile f : upFiles) {
			
			if (f.isEmpty() == false) { // f가 null 값으로 들어온게 아니라면(첨부파일을 추가했다면 다음을 실행해라)
				// 2. 파일명 재 생성
				String originName = f.getOriginalFilename(); // 원래 파일 이름 받아오기
				String changeName = fileNameChanger(originName); // 이름이 바뀌어서 들어옴 (밑에서 만들어 놓은 함수 실행하는 것)
				
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
					// 파일을 saveDirectory + "/" + changeName로 변경하겠다.
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				
				// 3. (어태치먼트) list에 담기
				Attachment at = new Attachment();
				// 담아주기
				at.setOriginFileName(originName); 
				at.setRenameFileName(changeName);
				
				attachList.add(at); // 추가해서 파일 업로드 끝내기
				
			}
			
		}
		/**************************************/
		
		// 4. 비즈니스(서비스) 로직 수행
		int result = productService.insertProduct(product, attachList);
		
		// 5. 처리 결과에 따른 view 처리 (성공 실패 화면이 다르다면)
		String loc = "/product/AdminProductInsert.do";
		String msg = "";
		if (result > 0) {
			msg = "상품 등록 성공";
		} else {
			msg = "상품 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "views/common/msg";
	}
	
	// 단순 파일 이름 변경용 메소드
	public String fileNameChanger(String oldFileName) {
		// 확장자 추출하기
		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		// 연월을 시분초 기준으로 뽑아줌
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		// 혹시 밀리 세컨까지 똑같은 경우가 있을 수 있으니 랜덤 숫자를 준비하기
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		// Date는 util로 임포트하기. 컴퓨터의 현재시간 값을 정확하게 불러오고 랜덤한 수 + 확장자 까지 넣어주기
	}
	
	// menubar에 있는 베스트 List 조회
	@RequestMapping("/product/productBestList.do")
	public String selectProductBestList(Model model) {
		List<Product> productBestList = productService.selectProductBestList();
		
		model.addAttribute("productBestList", productBestList);
		
		return "views/product/MainBestProductList";
	}
	
	// menubar에 있는 신상품 List 조회
	@RequestMapping("/product/productNewList.do")
	public String selectProductNewList(Model model) {
		List<Product> productNewList = productService.selectProductNewList();
		
		model.addAttribute("productNewList", productNewList);
		
		return "views/product/MainNewProductList";
	}

	//  Main(index) 화면에 있는 top 6, 신상품 3
	@RequestMapping("/index")
	public String selectProductMainList(Model model) {
		List<Product> productMainTopList = productService.selectProductMainTopList();
		List<Product> productMainNewList = productService.selectProductMainNewList();
		
		model.addAttribute("productMainTopList", productMainTopList);
		model.addAttribute("productMainNewList", productMainNewList);
		
		return "index";
	}
	
	// 화장품 상세 조회
	@RequestMapping("/product/productDetailView.do")
	public String selectProductDetailView(@RequestParam int productNo, Model model) {
		Product product = productService.selectOneProduct(productNo);
		List<Attachment> attachmentList = productService.selectProductAttachmentList(productNo);
		List<Attachment> attachmentList2 = productService.selectProductAttachmentList2(productNo);
		
		model.addAttribute("product", product);
		model.addAttribute("attachmentList", attachmentList);
		model.addAttribute("attachmentList2", attachmentList2);
		
		return "views/product/ProductDetailView";
	}
	
	/*
	// 화장품 상세 조회 (리뷰용)
	@RequestMapping("/product/productDetailViewReview.do")
	public String selectProductDetailViewReview(@RequestParam int productNo, Model model) {
		Product product = productService.selectOneProduct(productNo);
		List<Attachment> attachmentList = productService.selectProductAttachmentList(productNo);
		
		model.addAttribute("product", product);
		model.addAttribute("attachmentList", attachmentList);
		
		return "views/review/ReviewProductDatail";
	}
	*/
	
	// Pick! 추천 상품 조회
	@RequestMapping("/product/productPick.do")
	public String ProductPickView() { // ProductPick.jsp 화면으로 이동
		return "views/product/ProductPick";
	}
	
	// menubar에 있는 화장품 스킨케어 카테고리 조회
	@RequestMapping("/product/productCategorySkinList.do")
	public String ProductCategorySkinList(Model model) {
		List<Product> productCategorySkinList = productService.selectProductCategorySkinList();
		
		model.addAttribute("productCategorySkinList", productCategorySkinList);
		
		return "views/product/Category/CategorySkinCareList";
	}
	
	// menubar에 있는 화장품 메이크업 카테고리 조회
	@RequestMapping("/product/productCategoryMakeUpList.do")
	public String ProductCategoryMakeUpList(Model model) {
		List<Product> productCategoryMakeUpList = productService.selectProductCategoryMakeUpList();
		
		model.addAttribute("productCategoryMakeUpList", productCategoryMakeUpList);
		
		return "views/product/Category/CategoryMakeUpList";
	}
	
	// menubar에 있는 화장품 바디케어 카테고리 조회
	@RequestMapping("/product/productCategoryBodyList.do")
	public String ProductCategoryBodyList(Model model) {
		List<Product> productCategoryBodyList = productService.selectProductCategoryBodyList();
		
		model.addAttribute("productCategoryBodyList", productCategoryBodyList);
		
		return "views/product/Category/CategoryBodyCareList";
	}
	
	// menubar에 있는 화장품 헤어케어 카테고리 조회
	@RequestMapping("/product/productCategoryHairList.do")
	public String ProductCategoryHairList(Model model) {
		List<Product> productCategoryHairList = productService.selectProductCategoryHairList();
		
		model.addAttribute("productCategoryHairList", productCategoryHairList);
		
		return "views/product/Category/CategoryHairCareList";
	}
	
	// menubar에 있는 화장품 향수/디퓨저 카테고리 조회
	@RequestMapping("/product/productCategoryPerfumeList.do")
	public String ProductCategoryPerfumeList(Model model) {
		List<Product> productCategoryPerfumeList = productService.selectProductCategoryPerfumeList();
		
		model.addAttribute("productCategoryPerfumeList", productCategoryPerfumeList);
		
		return "views/product/Category/CategoryPerfumeList";
	}
	
	
	
	
	// Main(index)에 있는 베스트 브랜드샵 조회
	@RequestMapping("/product/productMainBrandList.do")
	public String ProductMainBrandList(Model model) {
		List<Product> productMainBrandList = productService.selectProductMainBrandList();
		
		model.addAttribute("productMainBrandList", productMainBrandList);
		
		return "views/product/MainBrandProductList";
	}
	
	
	// 관리자 페이지에 있는 상품 정보 목록 조회
	@RequestMapping("/product/AdminProductList.do")
	public String AdminProductList(Model model) {
		List<Product> AdminProductList = productService.AdminProductList();
		
		model.addAttribute("AdminProductList", AdminProductList);
		
		return "views/mypage/admin/AdminProductView";
	}
	
	// 관리자 페이지에 있는 상품 수정 및 삭제 목록 조회
	@RequestMapping("/product/AdminProductUpdateList.do")
	public String AdminProductUpdateList(Model model) {
		List<Product> AdminProductList = productService.AdminProductList();
		
		model.addAttribute("AdminProductList", AdminProductList);
		
		return "views/mypage/admin/AdminProductUpdateList";
	}
	
	// 관리자로 로그인한 후 상품 상세 페이지에서 상품 수정 버튼 눌렀을 때 나오는 화면 
	@RequestMapping("/product/AdminProductUpdateView.do")
	public String AdminProductUpdateView(@RequestParam int productNo, Model model) {
		
		Product product = productService.productUpdateView(productNo);
		List<Attachment> attachmentList = productService.selectProductAttachmentList(productNo);
		List<Attachment> attachmentList2 = productService.selectProductAttachmentList2(productNo);
		
		model.addAttribute("product", product);
		model.addAttribute("attachmentList", attachmentList);
		model.addAttribute("attachmentList2", attachmentList2);
		
		return "views/mypage/admin/AdminProductUpdate";
	}
	
	@RequestMapping("/product/productUpdate.do")
	public String AdminProductUpdate(Product product,
	               @RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
	               HttpServletRequest req, Model model) {
	      
		int productNo = product.getProductNo();
	      
        // 원본 상품 정보 불러와 수정하기
		Product originProduct = productService.productUpdateView(productNo);
      
        // 상품 내용 변경 해주기
		originProduct.setProductName(product.getProductName());
		originProduct.setCompanyName(product.getCompanyName());
		originProduct.setProductType(product.getProductType());
		originProduct.setProductPrice(product.getProductPrice());
		originProduct.setProductPoint(product.getProductPoint());
		originProduct.setOriginCountry(product.getOriginCountry());
		originProduct.setProductState(product.getProductState());
		originProduct.setProductWeight(product.getProductWeight());
	      
	    // 1. 파일 저장 경로 선언
        String saveDirectory = req.getServletContext().getRealPath("/resources/productUpload");
	    
	    // 원본 첨부 파일 목록(어태치먼트를 먼저 가져오기)
        List<Attachment> attachList = productService.selectProductAttachmentList(productNo);
		List<Attachment> attachList2 = productService.selectProductAttachmentList2(productNo);

	    // 만약 첨부 파일 등록한 적이 없으면 안 가져옴
	    if (attachList == null) {
	    	attachList = new ArrayList<Attachment>(); // 만약 없다면 새로운 List 만들어주기
		}
	    
	    if (attachList2 == null) {
	    	attachList2 = new ArrayList<Attachment>(); // 만약 없다면 새로운 List 만들어주기
		}
	    
	    // 2. 변경한 파일 정보 업로드 시작!
	    int idx = 0;
	    for(MultipartFile f : upFiles) {

	    	Attachment at = null;
	    	Attachment at2 = null;
			
	    	if( f.isEmpty() == false ) { // 만약 원본 파일이 비어있지 않다면
				// 원본 파일 삭제
	    		if( attachList.size() > idx) { // 사진이 있다면
	    			boolean fileDelete
	                  = new File(saveDirectory +"/" + attachList.get(idx).getRenameFileName()).delete();
 
					// 실제 파일이 저장되어 있는 그 경로에서 파일을 가져와서 삭제하기
					// 삭제가 잘 되면 true를 안되면 false를 돌려주는 코드
					
					System.out.println("파일 삭제 여부 확인 : " + fileDelete);
					
					at = attachList.get(idx); // 어태치먼트에 위의 사진 파일을 담아주기
				} else {
					// 원본이 없다면 새로운 사진을 추가해주는 코드 작성하기
					at = new Attachment();
		            at.setProductNo(productNo);

					
		            attachList.add(at);
				}
	    		
	    		// 상세 이미지 코드
	    		if( attachList2.size() > idx) { // 사진이 있다면
	    			boolean fileDelete2
	                  = new File(saveDirectory +"/" + attachList.get(idx).getRenameFileName()).delete();
 
					// 실제 파일이 저장되어 있는 그 경로에서 파일을 가져와서 삭제하기
					// 삭제가 잘 되면 true를 안되면 false를 돌려주는 코드
					
					System.out.println("파일 삭제 여부 확인 : " + fileDelete2);
					
					at2 = attachList2.get(idx); // 어태치먼트에 위의 사진 파일을 담아주기
				} else {
					// 원본이 없다면 새로운 사진을 추가해주는 코드 작성하기
					at2 = new Attachment();
		            at2.setProductNo(productNo);

					
		            attachList2.add(at2);
				}
				
				// 파일 이름 변경하기
	    		String originName = f.getOriginalFilename();
	            String changeName = fileNameChanger(originName); // fileNameChanger함수로 이름을 바꾸기
				
				// 실제 파일 저장
	            try {
	                f.transferTo(new File(saveDirectory + "/" + changeName)); // 파일을 변환 시키기
	             } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	             }
	             
	             at.setOriginFileName(originName);
	             at.setRenameFileName(changeName);
	             
	             attachList.set(idx, at); // 저장할 것을 넣어주기
	             attachList2.set(idx, at2); // 저장할 것을 넣어주기
			}
			idx++;
		}
	    
	    // 3. update 서비스 실행
	    int result = productService.updateProduct(originProduct, attachList);
	    int result2 = productService.updateProduct2(originProduct, attachList2);
	    String loc = "/product/AdminProductList.do";
	    String msg = "";
	      
	    if( result > 0 ) {
	       msg = "상품 수정 성공!";
	    } else {
	       msg = "상품 수정 실패!";
	    }
	      
	    model.addAttribute("loc", loc);
	    model.addAttribute("msg", msg);
	    
	    return "common/msg";
	}
	
	// 상품 상세 페이지에서 상품 삭제 버튼을 눌렀을 때 상품 삭제하기
	@RequestMapping("/product/productDelete.do")
	public String productDelete(@RequestParam int productNo, 
	                          HttpServletRequest req, Model model) {
	      
	   // 1. 파일이 저장된 폴더 경로
	   String saveDir = req.getServletContext().getRealPath("/resources/productUpload");
	      
	   // 첨부파일 삭제 명단
	   List<Attachment> delList = productService.selectProductAttachmentList(productNo);
	   List<Attachment> delList2 = productService.selectProductAttachmentList2(productNo);
	      
	   // 2. DB 정보 삭제하기
	   int result = productService.deleteProduct(productNo);
	      
	   String loc = "/index";
	   String msg = "";
	      
	   if ( result > 0 ) {
	      msg = "상품 삭제 완료!";
	      // DB 정보를 삭제하고 나서 삭제가 된다면 실제 파일 지우기 
	      // 3. 실제 파일 지우기
		  for(Attachment a : delList) {
		     new File(saveDir + "/" + a.getRenameFileName()).delete();
		  }
	   } else {
	      msg = "상품 삭제 실패!";
	   }
	      
	   model.addAttribute("loc", loc);
	   model.addAttribute("msg", msg);
	      
	   return "views/common/msg";
    }
	
}
