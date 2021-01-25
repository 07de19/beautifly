package com.spring.beautifly.common.exception;

public class ProductException extends RuntimeException {
	
	public ProductException() {}
	
	public ProductException(String message) {
		super("게시글 에러 : " + message);
	}

}
