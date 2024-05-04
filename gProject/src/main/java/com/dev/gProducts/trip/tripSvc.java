package com.dev.gProducts.trip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class tripSvc {
	
	@Autowired
	tripDao tripDao;

/****************** 여행 목록 일정 ******************/	
	
	//여행 일정 추가
	public Map<String, Object> tripInsert(Map<String, Object> data) {
		System.out.println("서비스 data >> "+ data);
		
		String newTripNo = tripDao.tripNoSelect();
		data.put("tripNo", newTripNo);
		
		System.out.println("입력 데이터 >> " + data);
		
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
		
		System.out.println("여행 일정 조회 서비스 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripDao.tripData(data);
		System.out.println("resultMap 서비스 data >> "+ resultMap);
		
		return resultMap;
	}
	
	//여행 일정 삭제
	public Map<String, Object> tripDelete(Map<String, Object> data) {
		System.out.println("여행 일정 삭제 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = tripDao.tripDelete(data);
		
		if(result == 1) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");
		}
		
		return resultMap;
	}

	
	
/****************** 여행 상세 일정 ******************/
	//여행 상세 일정 추가
	public Map<String, Object> tripDetailInsert(Map<String, Object> data) {
		System.out.println("서비스 data >> "+ data);
		
		int keyCount = data.size();

		int result = 0;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (Map.Entry<String, Object> entry : data.entrySet()) {
			
		    String detailNo = entry.getKey(); //key
		    String detailData = entry.getValue().toString();	
		    
		    System.out.println("서비스 key >> "+ detailNo);
		    System.out.println("서비스 value >> "+ detailData);
			
		    // 키를 '_' 기준으로 분리하여 tripNo와 tripDate 추출
		    String[] keyParts = detailNo.split("_");
		    System.out.println("서비스 keyParts.length >> "+ keyParts.length);
		    
		    if (keyParts.length == 5) { // 적절한 키 형식이어야 함을 확인
		        String tripNo = keyParts[0]+"_"+keyParts[1];
		        String tripDate = keyParts[2];
		        
			    System.out.println("서비스 tripNo >> "+ tripNo);
			    System.out.println("서비스 tripDate >> "+ tripDate);
		        
				result += tripDao.tripDetailInsert(detailNo, detailData, tripNo, tripDate);

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

	//여행 상세 일정 조회
	public List<Map<String, Object>> tripDetailSelect(Map<String, Object> data) {
	
		System.out.println("여행 일정 조회 서비스 data >> "+ data);
		
		List<Map<String, Object>> resultMap = tripDao.tripDetailSelect(data);
		
		System.out.println("resultMap 서비스 tripDetail >> "+ resultMap);
		
		return resultMap;
}
	
	
	//여행 상세 일정 삭제
	public Map<String, Object> tripDetailDelete(Map<String, Object> data) {
		System.out.println("여행 상세 일정 삭제 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = tripDao.tripDetailDelete(data);
		System.out.println("여행 상세 일정 삭제 result >> "+ result);
		
		
		if(result > 0) {
			resultMap.put("code", "ok");
		}else {
			resultMap.put("code", "no");
		}
		
		return resultMap;
	}	
	
	

}
