package com.dev.gProducts.trip;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface tripDao {

	/****************** 여행 목록 일정 ******************/
	
	public int tripInsert(Map<String, Object> data); 						//여행 일정 추가

	public String tripNoSelect(); 											//여행 번호 생성 조회

	public List<Map<String, Object>> tripList();							//여행 전체 목록
	
	public Map<String, Object> tripData(Map<String, Object> data);			//여행 데이터
	
	public int tripDelete(Map<String, Object> data); 						//여행 삭제

	
	/****************** 여행 상세 일정 ******************/
	
	//public int tripDetailInsert(String data);					//여행 상세 일정 추가

	public int tripDetailInsert(String detailNo, String detailData, String tripNo, String tripDate);
	
}
