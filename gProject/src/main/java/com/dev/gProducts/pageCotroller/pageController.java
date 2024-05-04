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

	/*trip Page*/
	
	//tripList 이동
	@RequestMapping(value = "/tripList")
	public String tripList() {
		return "trip/tripList";	
	}
	
	//tripUpload 이동
	@RequestMapping(value = "/tripUpload")
	public String tripUpload() {
		return "trip/tripUpload";	
	}
	
	//tripDetail 이동
	@RequestMapping(value = "/tripDetail")
	public String tripDetail() {
		return "trip/tripDetail";	
	}
	
	//tripDetailUpload 이동
	@RequestMapping(value = "/tripDetailUpload")
	public String tripDetailUpload() {
		return "trip/tripDetailUpload";	
	}
	
	//tripDetailUpdate 이동
	@RequestMapping(value = "/tripDetailUpdate")
	public String tripDetailUpdate() {
		return "trip/tripDetailUpdate";	
	}
	
	/*photo gallery Page*/
	
	//gallery 이동
	@RequestMapping(value = "/gallery")
	public String gallery() {
		return "/gallery/gallery";	
	}

	
	
	
}
