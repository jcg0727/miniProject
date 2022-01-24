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
import com.spring.project.dto.roadsignVO;
import com.spring.project.service.RoadsignService;

@Controller
public class RoadsignController {
	
	@Autowired
	private RoadsignService roadsignService;
	
	@RequestMapping(value="/roadsignList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<roadsignVO>> accidentList() throws Exception{
		ResponseEntity<List<roadsignVO>> entity = null;
		
		try {
			List<roadsignVO> list = roadsignService.selectRoadsigntList();
			entity = new ResponseEntity<List<roadsignVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<roadsignVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
