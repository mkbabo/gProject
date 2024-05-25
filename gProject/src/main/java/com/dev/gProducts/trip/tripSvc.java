package com.dev.gProducts.trip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev.gProducts.photo.photoSvc;

@Service
public class tripSvc {
	
	@Autowired
	tripDao tripDao;
	
	@Autowired
	photoSvc photoSvc;

/****************** 여행 목록 일정 ******************/	
	
	//여행 일정 추가
	public Map<String, Object> tripInsert(Map<String, Object> data) {
		//System.out.println("서비스 data >> "+ data);
		
		String newTripNo = tripDao.tripNoSelect();
		data.put("tripNo", newTripNo);
		
		//System.out.println("입력 데이터 >> " + data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = tripDao.tripInsert(data);
		
		if(result == 1) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");
		}
		
		
		return resultMap;
	}


	//여행 일정 목록
	public List<Map<String, Object>> tripList() {
	
		List<Map<String, Object>> resultMap = tripDao.tripList();
		
		return resultMap;
	}

	//여행 일정 조회
	public Map<String, Object> tripData(Map<String, Object> data) {
		
		//System.out.println("여행 일정 조회 서비스 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripDao.tripData(data);
		//System.out.println("resultMap 서비스 data >> "+ resultMap);
		
		return resultMap;
	}
	
	//여행 일정 삭제 (앨범 사진, 상세 일정 모두 삭제해야함)
	public Map<String, Object> tripDelete(Map<String, Object> data) {
		//System.out.println("여행 일정 삭제 svc data >> "+ data); //{tripNo=trip_006}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//여행 일정 삭제
		int tripDeleteResult = tripDao.tripDelete(data); //여행 일정 삭제
		if(tripDeleteResult == 0) {
			resultMap.put("code", "no");
			resultMap.put("message", "여행 일정 삭제 오류");
			return resultMap;
		}		

		//여행 상세 일정 삭제
		int tripDetailCount = tripDao.tripDetailCount(data); // 여행 상세 일정 데이터 존재 유무 확인
		if(tripDetailCount > 0) {
			int tripDetailDeleteResult = tripDao.tripDetailDelete2(data); // 여행 상세 일정 삭제
			if(tripDetailDeleteResult == 0) {
				resultMap.put("code", "no");
				resultMap.put("message", "여행 일정 삭제 오류");
				return resultMap;
			}
		}
		
		//여행 사진 폴더 삭제
		int tripPhotoDelete	= photoSvc.tripPhotoDelete(data); // 앨범 삭제
		if(tripPhotoDelete == 0) {
			resultMap.put("code", "ok");
			resultMap.put("message", "여행 앨범 존재 하지 않음");
			return resultMap;			
		}
		
		resultMap.put("code", "ok");
		resultMap.put("message", "여행 일정 삭제가 완료되었습니다.");
		return resultMap;			


	}	

    @Transactional
    public Map<String, Object> tripDelete11(Map<String, Object> data) {
        Map<String, Object> resultMap = new HashMap<>();

        try {
            // 여행 일정 삭제
            int tripDeleteResult = tripDao.tripDelete(data);
            if (tripDeleteResult == 0) {
                throw new RuntimeException("여행 일정 삭제 실패");
            }
            
    		int tripDetailCount = tripDao.tripDetailCount(data); // 여행 상세 일정 데이터 존재 유무 확인
    		if(tripDetailCount == 0) {
    			throw new RuntimeException("여행 상세 일정 존재하지 않음");
    		}

            // 여행 상세 일정 삭제
            int tripDetailDeleteResult = tripDao.tripDetailDelete2(data);
            if (tripDetailDeleteResult == 0) {
                throw new RuntimeException("여행 상세 일정 삭제 실패");
            }

            // 여행 사진 폴더 삭제
            int tripPhotoDelete = photoSvc.tripPhotoDelete(data);
//            if (tripPhotoDelete == 0) {
//                throw new RuntimeException("여행 사진 폴더 삭제 실패");
//            }

            // 모든 작업이 성공했을 때 커밋
            resultMap.put("code", "ok");
            resultMap.put("message", "여행 일정 삭제가 완료되었습니다.");
            return resultMap;
        } catch (RuntimeException e) {
            // 하나의 작업이라도 실패하면 롤백
            resultMap.put("code", "no");
            resultMap.put("message", e.getMessage());
            return resultMap;
        }
    }
	
	
/****************** 여행 상세 일정 ******************/
	//여행 상세 일정 추가
	public Map<String, Object> tripDetailInsert(Map<String, Object> data) {
		//System.out.println("서비스 data >> "+ data);
		
		int keyCount = data.size();

		int result = 0;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (Map.Entry<String, Object> entry : data.entrySet()) {
			
		    String detailNo = entry.getKey(); //key
		    String detailData = entry.getValue().toString();	
		    
		   // System.out.println("서비스 key >> "+ detailNo);
		   // System.out.println("서비스 value >> "+ detailData);
			
		    // 키를 '_' 기준으로 분리하여 tripNo와 tripDate 추출
		    String[] keyParts = detailNo.split("_");
		   // System.out.println("서비스 keyParts.length >> "+ keyParts.length);
		    
		    if (keyParts.length == 5) { // 적절한 키 형식이어야 함을 확인
		        String tripNo = keyParts[0]+"_"+keyParts[1];
		        String tripDate = keyParts[2];
		        
			  //  System.out.println("서비스 tripNo >> "+ tripNo);
			  //  System.out.println("서비스 tripDate >> "+ tripDate);
		        
				result += tripDao.tripDetailInsert(detailNo, detailData, tripNo, tripDate);

		    } else {
		        
		        System.out.println("올바르지 않은 키 형식: " + detailNo);
		    }		    

		}

		//System.out.println("result >> "+ result);
		//System.out.println("키 값의 개수: " + keyCount);

		if(result == keyCount) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");;
		}
		
		
		return resultMap;
	}

	//여행 상세 일정 조회
	public List<Map<String, Object>> tripDetailSelect(Map<String, Object> data) {
	
		//System.out.println("여행 일정 조회 서비스 data >> "+ data);
		
		List<Map<String, Object>> resultMap = tripDao.tripDetailSelect(data);
		
		//System.out.println("resultMap 서비스 tripDetail >> "+ resultMap);
		
		return resultMap;
}
	
	
	//여행 상세 일정 삭제
	public Map<String, Object> tripDetailDelete(Map<String, Object> data) {
		//System.out.println("여행 상세 일정 삭제 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = tripDao.tripDetailDelete(data);
		//System.out.println("여행 상세 일정 삭제 result >> "+ result);
		
		
		if(result > 0) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");
		}
		
		return resultMap;
	}

	//여행 상세 일정 수정
	public Map<String, Object> tripDataUpdate(Map<String, Object> data) {
		//System.out.println("서비스 data >> "+ data);
		
		Map<String, Object> dataDel = new HashMap<String, Object>();
		
		// 해당 여행의 날짜 전부 삭제 (update하려니 row 일정을 삭제하면 일정이 남아 있으므로 전체삭제 처리 필요)
		String firstKey = null;

		for (String key : data.keySet()) {
		    firstKey = key;
		    break;
		}
		if (firstKey != null) {
		    // 첫 번째 키를 찾았을 때의 처리
		    //System.out.println("첫 번째 키: " + firstKey);

		    String[] parts = firstKey.split("_");	    
		    String tripNo = parts[0]+"_"+parts[1];
		    String date = parts[2];
		    
		    dataDel.put("tripNo", tripNo);
		    dataDel.put("tripDate", date);
		    
			int resultDel = tripDao.tripDetailDelete(dataDel);
			//System.out.println("여행 상세 일정 삭제 result >> "+ resultDel);
		    
		} else {
		    // 키가 없을 때의 처리
		    System.out.println("키를 찾을 수 없음");
		}
		

		//다시 insert
		int keyCount = data.size();

		int result = 0;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (Map.Entry<String, Object> entry : data.entrySet()) {
			
		    String detailNo = entry.getKey(); //key
		    String detailData = entry.getValue().toString();	
		    
		   // System.out.println("서비스 key >> "+ detailNo);
		   // System.out.println("서비스 value >> "+ detailData);
			
		    // 키를 '_' 기준으로 분리하여 tripNo와 tripDate 추출
		    String[] keyParts = detailNo.split("_");
		   // System.out.println("서비스 keyParts.length >> "+ keyParts.length);
		    
		    if (keyParts.length == 5) { // 적절한 키 형식이어야 함을 확인
		        String tripNo = keyParts[0]+"_"+keyParts[1];
		        String tripDate = keyParts[2];
		        
			   // System.out.println("서비스 tripNo >> "+ tripNo);
			   // System.out.println("서비스 tripDate >> "+ tripDate);
		        
				result += tripDao.tripDetailInsert(detailNo, detailData, tripNo, tripDate);

		    } else {
		        
		        System.out.println("올바르지 않은 키 형식: " + detailNo);
		    }		    

		}

		//System.out.println("result >> "+ result);
		//System.out.println("키 값의 개수: " + keyCount);

		if(result == keyCount) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");;
		}
		
		
		return resultMap;
	}	
	
/*	
	public Map<String, Object> tripDataUpdate1(Map<String, Object> data) {
		System.out.println("서비스 data >> "+ data);
		
		int keyCount = data.size();

		int result = 0;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (Map.Entry<String, Object> entry : data.entrySet()) {
			
		    String detailNo = entry.getKey(); //key
		    String detailData = entry.getValue().toString();	
	
		    // 키를 '_' 기준으로 분리하여 tripNo와 tripDate 추출
		    String[] keyParts = detailNo.split("_");
		    System.out.println("서비스 keyParts.length >> "+ keyParts.length);
		    
		    if (keyParts.length == 5) { // 적절한 키 형식이어야 함을 확인
		        String tripNo = keyParts[0]+"_"+keyParts[1];
		        String tripDate = keyParts[2];
		        
			    System.out.println("서비스 key >> "+ detailNo);
			    System.out.println("서비스 value >> "+ detailData);
		        
			    System.out.println("서비스 tripNo >> "+ tripNo);
			    System.out.println("서비스 tripDate >> "+ tripDate);
		        
				//result += tripDao.tripDetailUpdate(detailNo, detailData, tripNo, tripDate);
			    
			     int detailNoConut = tripDao.detailNoConut(detailNo);
			     if(detailNoConut == 0) { //일정에 존재하지 않은 insert 필요
			    	 result += tripDao.tripDetailInsert(detailNo, detailData, tripNo, tripDate);
			    	 
			     }else { // update 필요		    	 
			    	 result += tripDao.tripDetailUpdate(detailNo, detailData, tripNo, tripDate);
			     }

		    } else {
		        
		        System.out.println("올바르지 않은 키 형식: " + detailNo);
		    }		    

		}

		System.out.println("result >> "+ result);
		System.out.println("키 값의 개수: " + keyCount);

		if(result == keyCount) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");;
		}
		
		
		return resultMap;
	}	
*/	
	

}
