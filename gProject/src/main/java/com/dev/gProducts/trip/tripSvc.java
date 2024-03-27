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

}
