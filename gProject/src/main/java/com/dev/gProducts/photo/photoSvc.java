package com.dev.gProducts.photo;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class photoSvc {
	
	@Autowired
	photoDao photoDao;
	
    @Value("${upload.dir}")
    private String uploadDir;
	
	//여행 일정 목록
	public List<Map<String, Object>> photoList() {
	
		List<Map<String, Object>> resultMap = photoDao.photoList();
		
		return resultMap;
	}

	//사진 업로드
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
	        resultMap.put("tripNo", tripNo);
	        resultMap.put("message", result+"개의 사진 업로드를 성공하였습니다.");
	        return resultMap;
	
	}
	
	//여행 별 사진 목록
	public List<Map<String, Object>> photoSelectList(Map<String, Object> data) {
		
		List<Map<String, Object>> resultMap = photoDao.photoSelectList(data);
		
		return resultMap;
	}
	
	
	//사진 삭제
	public Map<String, Object> photoDelete(List<Map<String, Object>> data) {
	    //System.out.println("여행 별 사진 목록 서비스!>> "+ data);

	    Map<String, Object> resultMap = new HashMap<>();
	    int deletedCount = 0;

	    for (Map<String, Object> item : data) {
	        String filename = item.get("filename").toString();
	        String photoNo = item.get("photoNo").toString();
	        String tripNo = item.get("tripNo").toString();
	        
	        //System.out.println("filename>> "+ filename);
	        //System.out.println("photoNo>> "+ photoNo);
	       // System.out.println("tripNo>> "+ tripNo);

	        // 데이터베이스에서의 삭제
	        int deleteResult = photoDao.photoDelete(photoNo);
	        if (deleteResult > 0) {
	            // 삭제 성공한 경우에만 파일 시스템에서의 삭제 수행
	            Path uploadPath = Paths.get(uploadDir + "/" + tripNo+ "/" + filename);
	            //System.out.println("uploadPath>> "+ uploadPath);
	            File fileToDelete = uploadPath.toFile();
	            if (fileToDelete.exists()) {
	                if (fileToDelete.delete()) {
	                    deletedCount++;
	                } else {
	                    // 파일 삭제 실패
	                    resultMap.put("message", "사진이 삭제되지 않았습니다.");
	                    return resultMap; // 파일 삭제 실패 시 즉시 반환
	                }
	            } else {
	                // 파일이 존재하지 않음
	                resultMap.put("message", "이미 삭제된 사진 입니다.");
	                return resultMap; // 파일 삭제 실패 시 즉시 반환
	            }
	        } else {
	            // 데이터베이스에서의 삭제 실패
	            resultMap.put("message", "사진 삭제에 실패하였습니다.");
	            return resultMap; // 파일 삭제 실패 시 즉시 반환
	        }
	    }

	    // 결과 반환
	    resultMap.put("message", deletedCount + "개의 사진을 삭제하였습니다.");
	    return resultMap;
	}

	
	//여행 일정 삭제 시 앨범 폴더 삭제
	public int tripPhotoDelete(Map<String, Object> data) {
	    System.out.println("여행 일정 삭제 시 앨범 폴더 삭제 >> " + data); //{tripNo=trip_006}
	    
		int tripPhotoCount = photoDao.tripPhotoCount(data); // 여행 상세 일정 데이터 존재 유무 확인
		if(tripPhotoCount == 0) {
			return 0;
		}	    

	    int deletedCount = 0;
	    
	    String tripNoStr = data.get("tripNo").toString();
	    
	    // 데이터베이스에서의 삭제
	    int deleteResult = photoDao.tripPhotoDelete(data);
	    if (deleteResult > 0) {
	        // 삭제 성공한 경우에만 파일 시스템에서의 삭제 수행
	        Path uploadPath = Paths.get(uploadDir + "/" + tripNoStr);
	        File fileToDelete = uploadPath.toFile();
	        if (fileToDelete.exists()) {
	            // 폴더 안의 모든 파일 삭제
	            File[] files = fileToDelete.listFiles();
	            if (files != null) {
	                for (File file : files) {
	                    if (file.delete()) {
	                        deletedCount++;
	                    } else {
	                        return 0; // 파일 삭제 실패
	                    }
	                }
	            }
	            // 폴더 삭제
	            if (fileToDelete.delete()) {
	                deletedCount++; // 폴더 삭제 성공
	            } else {
	                return 0; // 폴더 삭제 실패
	            }
	        } else {
	            return 0; // 폴더가 존재하지 않음
	        }
	    } else {
	        return 0; // 데이터베이스에서의 삭제 실패
	    }

	    return deletedCount; // 결과 반환
	}
	
	
	
	
	
//	public int tripPhotoDelete(Map<String, Object> data) {
//	    System.out.println("여행 일정 삭제 시 앨범 폴더 삭제 >> " + data); //{tripNo=trip_006}
//	    
//	    int deletedCount = 0;
//	    
//	    String tripNoStr = data.get("tripNo").toString();
//	    
//	    // 데이터베이스에서의 삭제
//	    int deleteResult = photoDao.tripPhotoDelete(data);
//	    if (deleteResult > 0) {
//	        // 삭제 성공한 경우에만 파일 시스템에서의 삭제 수행
//	        Path uploadPath = Paths.get(uploadDir + "/" + tripNoStr);
//	        File fileToDelete = uploadPath.toFile();
//	        if (fileToDelete.exists()) {
//	            // 폴더 안의 모든 파일 삭제
//	            File[] files = fileToDelete.listFiles();
//	            if (files != null) {
//	                for (File file : files) {
//	                    if (file.delete()) {
//	                        deletedCount++;
//	                    } else {
//	                        return 0; // 파일 삭제 실패
//	                    }
//	                }
//	            }
//	            // 폴더 삭제
//	            if (fileToDelete.delete()) {
//	                deletedCount++; // 폴더 삭제 성공
//	            } else {
//	                return 0; // 폴더 삭제 실패
//	            }
//	        } else {
//	            return 1; // 폴더가 존재하지 않음
//	        }
//	    } else {
//	        return 0; // 데이터베이스에서의 삭제 실패
//	    }
//
//	    return deletedCount; // 결과 반환
//	}
//	
//	
	
	
	
	
}
