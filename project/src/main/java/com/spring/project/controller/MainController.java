package com.spring.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.command.SearchCriteria;
import com.spring.project.dto.accidentVO;
import com.spring.project.dto.sightVO;
import com.spring.project.service.AccidentService;
import com.spring.project.service.SightService;

@Controller
public class MainController {
	
	@Autowired
	private SightService service;

	@Autowired
	private AccidentService accidentService;
	
	@RequestMapping("/test")
	public String test() throws Exception{
		return "common/test";
	}	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "common/main";
	}	
	@RequestMapping("/mainPage")
	public String mainPage() throws Exception{
		return "common/mainPage";
	}	
	
	@RequestMapping(value="/sightList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<sightVO>> sightList() throws Exception{
		ResponseEntity<List<sightVO>> entity = null;
		
		try {
			List<sightVO> list = service.selectSightList();
			entity = new ResponseEntity<List<sightVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<sightVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/accidentList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<accidentVO>> accidentList() throws Exception{
		ResponseEntity<List<accidentVO>> entity = null;
		
		try {
			List<accidentVO> list = accidentService.selectAccidentList();
			entity = new ResponseEntity<List<accidentVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<accidentVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
