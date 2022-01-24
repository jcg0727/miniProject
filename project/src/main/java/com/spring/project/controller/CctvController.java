package com.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.cctvVO;
import com.spring.project.service.CctvService;

@Controller
public class CctvController {

	@Autowired
	private CctvService cctvService;
	
	
	@RequestMapping(value="/cctvList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<cctvVO>> cctvList() throws Exception{
		ResponseEntity<List<cctvVO>> entity = null;
		
		try {
			List<cctvVO> list = cctvService.selectCctv();
			entity = new ResponseEntity<List<cctvVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<cctvVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
