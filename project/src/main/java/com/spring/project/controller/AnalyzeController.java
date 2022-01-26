package com.spring.project.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project.dto.analyzeVO;
import com.spring.project.dto.cameraVO;
import com.spring.project.service.AnalyzeService;

@Controller
public class AnalyzeController {
	
	@Autowired 
	private AnalyzeService service;
	
	@RequestMapping(value="/allPoint", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> allPoint(String name) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			Map<String,Object> pointList = service.selectAllPoint(name);
			entity =  new ResponseEntity<Map<String,Object>>(pointList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/detailAnalyze")
	public ModelAndView detailAnalyze(ModelAndView mnv) {
		String url = "common/detailAnalyze";
		mnv.setViewName(url);
		
		return mnv;
	}
}
