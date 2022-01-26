package com.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.jejuVO;
import com.spring.project.dto.sightVO;
import com.spring.project.service.JejuService;

@Controller
public class JejuController {
	
	@Autowired
	private JejuService jejuService;
	
	@RequestMapping(value="/jejuList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<jejuVO>> jejuList() throws Exception{
		ResponseEntity<List<jejuVO>> entity = null;
		
		try {
			List<jejuVO> list = jejuService.selectJeju();
			entity = new ResponseEntity<List<jejuVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<jejuVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
