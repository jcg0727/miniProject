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
import com.spring.project.dto.roadVO;
import com.spring.project.service.RoadService;

@Controller
public class RoadController {
	
	@Autowired
	private RoadService roadService;
	
	@RequestMapping(value="/roadList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<roadVO>> roadList() throws Exception{
		ResponseEntity<List<roadVO>> entity = null;
		
		try {
			List<roadVO> list = roadService.roadList();
			entity = new ResponseEntity<List<roadVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<roadVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
