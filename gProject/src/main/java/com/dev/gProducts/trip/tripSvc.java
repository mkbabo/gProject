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

	//tripData
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
	
	

}
