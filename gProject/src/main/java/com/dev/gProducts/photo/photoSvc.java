package com.dev.gProducts.photo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class photoSvc {
	
	@Autowired
	photoDao photoDao;
	
	//여행 일정 목록
	public List<Map<String, Object>> photoList() {
	
		List<Map<String, Object>> resultMap = photoDao.photoList();
		
		return resultMap;
	}
/*
	public Map<String, Object> photoInsert(Map<String, Object> data, MultipartFile[] files) {

		String newPhotoNo = photoDao.photoNoSelect();
		data.put("photoNo", newPhotoNo);
		
		return null;
	}*/
/*
	public int photoInsert(String tripNo, String storedFileName) {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		String newPhotoNo = photoDao.photoNoSelect();
		dataMap.put("photoNo", newPhotoNo);	
		dataMap.put("tripNo", tripNo);	
		dataMap.put("photoFileNm", storedFileName);	
	
		int result = photoDao.photoInsert(dataMap);

		return result;
	}*/

	
	public Map<String, Object> photoInsert(String tripNo, String[] storedFileNames) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		System.out.println("tripNo>> "+ tripNo);
		System.out.println("storedFileNames>> "+ storedFileNames);

		int result = 0;
	        
	        // 각 파일 이름을 데이터베이스에 저장
	        for (String photoFileNm : storedFileNames) {
	    		String photoNo = photoDao.photoNoSelect().toString();

	            System.out.println("저장된 파일 이름: " + photoFileNm);
	            // insert 쿼리를 실행하여 데이터베이스에 사진 정보 저장
	            result += photoDao.photoInsert(photoNo, tripNo, photoFileNm);
	        }
	    
	        
	        // 결과 반환	        
	        resultMap.put("message", result+"개의 사진 업로드를 성공하였습니다.");
	        return resultMap;
	
	}
	
	
	
	
	
	
	
	
	
}
