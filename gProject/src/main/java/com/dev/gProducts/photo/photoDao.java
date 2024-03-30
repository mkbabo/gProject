package com.dev.gProducts.photo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface photoDao {

	public List<Map<String, Object>> photoList();							//여행 전체 목록
	
	public String photoNoSelect(); 											//사진번호조회
	
	public int photoInsert(Map<String, Object> data); 						//사진 추가

	public int photoInsert(String photoNo, String tripNo, String photoFileNm);

	
}
