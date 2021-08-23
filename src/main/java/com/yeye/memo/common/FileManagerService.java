package com.yeye.memo.common;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	private final String FILE_UPLOAD_PATH ="C:\\Users\\82109\\Desktop\\spring\\spring_test\\upload\\images/";

	// 파일 업로드 
	public String saveFile(String loginId, MultipartFile file) {
		// 파일이름이 겹치는것을 방지하기 위해서 사용자별로 디렉토리를 만들어서 저장한다.
		// 올린 시간별로 구분해서 저장
		// hagulu_298213434243/test.png
		// 1970년 1월 1일 이후로 지금 몇초가 지났는지
		
		String directoryName = loginId + "_" + System.currentTimeMillis();
		
		// 완전한 파일 경로
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 파일 저장할 디렉토리 생성
		
		// 파일 저장
		
		// 파일이 접근가능한 path 리턴
		
		
		
	}
}
