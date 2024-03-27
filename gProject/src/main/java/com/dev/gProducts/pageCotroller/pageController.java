package com.dev.gProducts.pageCotroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class pageController {
	
	//메인페이지 이동
	@RequestMapping(value = { "/main", "/home", "/"})
	public String main() {
		return "main";	
	}
	
	//gallery 이동
	@RequestMapping(value = "/gallery")
	public String gallery() {
		return "gallery";	
	}
	
	//generic 이동
	@RequestMapping(value = "/generic")
	public String generic() {
		return "generic";	
	}
	
	//photoUpload 이동
	@RequestMapping(value = "/photoUpload")
	public String photoUpload() {
		return "photoUpload";	
	}
	
	//tripList 이동
	@RequestMapping(value = "/tripList")
	public String tripList() {
		return "tripList";	
	}
	
	//tripUpload 이동
	@RequestMapping(value = "/tripUpload")
	public String tripUpload() {
		return "tripUpload";	
	}

	//tripDetailUpload 이동
	@RequestMapping(value = "/tripDetailUpload")
	public String tripDetailUpload() {
		return "tripDetailUpload";	
	}	
	
}
