package com.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.dumpVO;
import com.spring.project.dto.sightVO;
import com.spring.project.service.DumpService;

@Controller
public class DumpController {
	
	@Autowired
	private DumpService dumpService;
	
	@RequestMapping(value="/dumpList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<dumpVO>> sightBuffer() throws Exception{
		ResponseEntity<List<dumpVO>> entity = null;
		
		try {
			List<dumpVO> list = dumpService.selectDump();
			entity = new ResponseEntity<List<dumpVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<dumpVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
}
