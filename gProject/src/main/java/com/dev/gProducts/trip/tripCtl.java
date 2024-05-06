package com.dev.gProducts.trip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class tripCtl {
	
	@Autowired
	tripSvc tripSvc;

/****************** 여행 목록 일정 ******************/	
	
	//여행 일정 추가
	@RequestMapping(value = "/tripInsert", method = RequestMethod.POST)
	public Map<String, Object> tripInsert (@RequestBody Map<String, Object> data) throws Exception {
		
		System.out.println("컨트롤 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripSvc.tripInsert(data);
		
		return resultMap;
		
	}
	
	//여행 일정 목록
    @RequestMapping(value = "/getList", method = RequestMethod.GET)
    public List<Map<String, Object>> tripList () {
        System.out.println("여행 일정 목록 컨트롤");

        List<Map<String, Object>> resultMap = tripSvc.tripList();

        return resultMap;
    }
    
	//여행 일정 조회
	@RequestMapping(value = "/tripData", method = RequestMethod.GET)
	public Map<String, Object> tripData (@RequestParam Map<String, Object> data) throws Exception {
		
		System.out.println("여행 일정 조회 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripSvc.tripData(data);
		
		return resultMap;
		
	}   
	
	//여행 일정 삭제
	@RequestMapping(value = "/tripDelete", method = RequestMethod.POST)
	public Map<String, Object> tripDelete (@RequestBody Map<String, Object> data) throws Exception {
		
		System.out.println("여행 일정 삭제 ctl data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripSvc.tripDelete(data);
		
		return resultMap;
		
	}	
	
/****************** 여행 상세 일정 ******************/
	
	//여행 상세 일정 추가
	@RequestMapping(value = "/tripDetailInsert", method = RequestMethod.POST)
	public Map<String, Object> tripDetailInsert (@RequestBody Map<String, Object> data) throws Exception {
		
		System.out.println("컨트롤 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripSvc.tripDetailInsert(data);
		
		return resultMap;
		
	}
	
	//여행 상세 일정 조회
    @RequestMapping(value = "/tripDetailSelect", method = RequestMethod.GET)
    public List<Map<String, Object>> tripDetailSelect (@RequestParam Map<String, Object> data) {
        System.out.println("여행 일정 목록 컨트롤");

        List<Map<String, Object>> resultMap = tripSvc.tripDetailSelect(data);
        
        System.out.println("resultMap 컨트롤 tripDetail >> "+ resultMap);
        
        return resultMap;
    }	
    
	//여행 상세 일정 삭제
	@RequestMapping(value = "/tripDetailDelete", method = RequestMethod.POST)
	public Map<String, Object> tripDetailDelete (@RequestBody Map<String, Object> data) throws Exception {
		
		System.out.println("여행 상세 일정 삭제 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripSvc.tripDetailDelete(data);
		
		return resultMap;
		
	}	
	
	//여행 상세 일정 수정
	@RequestMapping(value = "/tripDataUpdate", method = RequestMethod.POST)
	public Map<String, Object> tripDataUpdate (@RequestBody Map<String, Object> data) throws Exception {
		
		System.out.println("수정 컨트롤 data >> "+ data);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = tripSvc.tripDataUpdate(data);
		
		return resultMap;
		
	}	
	
}
