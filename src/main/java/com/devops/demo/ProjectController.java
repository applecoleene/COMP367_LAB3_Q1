package com.devops.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	//mapping with index.jsp
	@RequestMapping("/")
	public String index(){
		return "index"; 
	}
}
