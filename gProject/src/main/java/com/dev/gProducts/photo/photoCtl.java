package com.dev.gProducts.photo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
//@RequestMapping(value = "/data")
public class photoCtl {

	@Autowired
	photoSvc photoSvc;
	
	//여행 일정 목록
    @GetMapping("/photoList")
    public List<Map<String, Object>> photoList () {
      //  System.out.println("컨트롤!");

        List<Map<String, Object>> resultMap = photoSvc.photoList();

        return resultMap;
    }
    
   
    //private String uploadDir; // 파일이 업로드될 디렉토리의 경로
    //private String uploadDir = "C:\\Users\\ji-hye\\Desktop\\Graduation project\\workspace\\GraduationProject\\GraduationProject\\src\\main\\resources\\fileUpload";
    
    @Value("${upload.dir}")
    private String uploadDir;
    
	//데이터 등록
	@PostMapping("/photoInsert")
    public Map<String, Object> photoInsert(@RequestParam Map<String, Object> data, @RequestParam("dataFileUpload") MultipartFile[] files) {
        
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 업로드된 파일의 개수를 저장할 배열 선언
		String[] storedFileNames = new String[files.length];
		
        String tripNo = data.get("tripNo").toString();
        //System.out.println("여행번호: " + tripNo);
        int result = 0;
        
        // 파일 처리 및 저장된 파일 이름 배열에 추가
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());
            String storedFileName = storeFile(file, tripNo); // 파일 저장하고 저장된 파일 경로를 반환
            storedFileNames[i] = storedFileName; // 저장된 파일 이름 배열에 추가
            //System.out.println("저장된 파일 이름: " + storedFileName);
        }
        
        resultMap = photoSvc.photoInsert(tripNo, storedFileNames);
        


        return resultMap;
    }    

	
    // 파일을 업로드하고 저장된 파일의 경로를 반환하는 메소드
	   private String storeFile(MultipartFile file, String tripNo) {
	        // 업로드 될 디렉토리 경로를 설정
	        Path uploadPath = Paths.get(uploadDir + "/" + tripNo);
	        File directory = new File(uploadPath.toString());
	        if (!directory.exists()) {
	            directory.mkdirs(); // 디렉토리가 존재하지 않으면 생성
	        }

	        // 랜덤 + 원본 파일 이름
	        String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
	        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	        String uuid = UUID.randomUUID().toString();
	        String fileName = uuid + "_" + originalFilename;
	        Path filePath = uploadPath.resolve(fileName);

	        try {
	            // 파일 저장
	            Files.copy(file.getInputStream(), filePath);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return fileName;
	    }
	   
	   
		//여행 별 사진 목록
	    @GetMapping("/photoSelectList")
	    public List<Map<String, Object>> photoSelectList(@RequestParam Map<String, Object> data) {
	       // System.out.println("여행 별 사진 목록 컨트롤!");

	        List<Map<String, Object>> resultMap = photoSvc.photoSelectList(data);

	        return resultMap;
	    }
	    
		//선택 사진 삭제
	    @PostMapping("/photoDelete")
	    public Map<String, Object> photoDelete(@RequestBody List<Map<String, Object>> data) {
	       // System.out.println("여행 별 사진 목록 컨트롤!>> "+ data);

	        Map<String, Object> resultMap = photoSvc.photoDelete(data);

	        return resultMap;
	    }
    
    
	
}
