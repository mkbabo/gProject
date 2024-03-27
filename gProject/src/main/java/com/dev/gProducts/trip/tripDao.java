package com.dev.gProducts.trip;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface tripDao {

	
	public int tripInsert(Map<String, Object> data); 						//여행 일정 추가

	public String tripNoSelect(); 											//여행 번호 생성 조회

	public List<Map<String, Object>> tripList();	//여행 목록
	

}
