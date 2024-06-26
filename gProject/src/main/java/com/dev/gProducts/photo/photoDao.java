package com.dev.gProducts.photo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface photoDao {

	public List<Map<String, Object>> photoList();								//여행 전체 목록
	
	public String photoNoSelect(); 												//사진번호조회	

	public int photoInsert(String photoNo, String tripNo, String photoFileNm);	//사진 추가
	
	public List<Map<String, Object>> photoSelectList(Map<String, Object> data); //여행 별 목록
	
	public int photoDelete(String photoNo); //사진 삭제
	
	public int tripPhotoDelete(Map<String, Object> data); //여행 사진 전체 삭제
	public int tripPhotoCount(Map<String, Object> data);
	
	
}
