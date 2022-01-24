package com.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.accidentVO;
import com.spring.project.service.AccidentService;

@Controller
public class AccidentController {
	
	@Autowired
	private AccidentService accidentService;
	
	
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
