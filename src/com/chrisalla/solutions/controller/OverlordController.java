package com.chrisalla.solutions.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;

@Controller
public class OverlordController {
	
	@RequestMapping(value = "/", method = {RequestMethod.GET}) 
	public String getMainPage(Model model) throws Exception {
		String resultPage = "index";
		
		return resultPage; 
	}
	
	@RequestMapping(value = "/start", method = {RequestMethod.POST}) 
	public String getStartPage(Model model) throws Exception {
		String resultPage = "start";
		
		return resultPage; 
	}

}
