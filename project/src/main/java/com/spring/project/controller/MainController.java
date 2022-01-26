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
import com.spring.project.dto.cameraVO;
import com.spring.project.dto.cctvVO;
import com.spring.project.dto.sightVO;
import com.spring.project.service.AccidentService;
import com.spring.project.service.CameraService;
import com.spring.project.service.CctvService;
import com.spring.project.service.SightService;

@Controller
public class MainController {
	
	@Autowired
	private SightService service;

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
	
	@RequestMapping(value="/sightBuffer", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<sightVO>> sightBuffer() throws Exception{
		ResponseEntity<List<sightVO>> entity = null;
		
		try {
			List<sightVO> list = service.selectSightBuffer();
			entity = new ResponseEntity<List<sightVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<sightVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
}
