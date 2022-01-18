package com.spring.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String main() throws Exception{
		return "common/main";
	}	
	@RequestMapping("/mainPage")
	public String mainPage() throws Exception{
		return "common/mainPage";
	}	

}
