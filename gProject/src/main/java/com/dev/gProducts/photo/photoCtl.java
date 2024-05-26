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
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@Configuration
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
    
 
    @Value("${upload.dir}")
    private String uploadDir;
    
	//데이터 등록
    @PostMapping("/photoInsert")
    public Map<String, Object> photoInsert(@RequestParam Map<String, Object> data, @RequestParam("dataFileUpload") MultipartFile[] files) {
        Map<String, Object> resultMap = new HashMap<>();
        String[] storedFileNames = new String[files.length];
        String tripNo = data.get("tripNo").toString();
        
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            String storedFileName = storeFile(file, tripNo);
            storedFileNames[i] = storedFileName;
        }
        
        resultMap = photoSvc.photoInsert(tripNo, storedFileNames);
        
        return resultMap;
    }
    
    private String storeFile(MultipartFile file, String tripNo) {
        Path uploadPath = Paths.get(uploadDir + "/fileUpload/" + tripNo);
        File directory = new File(uploadPath.toString());
        
        if (!directory.exists()) {
            directory.mkdirs();
        }
        
        String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());
        String uuid = UUID.randomUUID().toString();
        String fileName = uuid + "_" + originalFilename;
        Path filePath = uploadPath.resolve(fileName);
        
        try {
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
