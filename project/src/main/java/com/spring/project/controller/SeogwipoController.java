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
import com.spring.project.dto.seogwipoVO;
import com.spring.project.service.SeogwipoService;

@Controller
public class SeogwipoController {

	@Autowired
	private SeogwipoService seogwipoService;
	
	@RequestMapping(value="/seogwipoList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<seogwipoVO>> jejuList() throws Exception{
		ResponseEntity<List<seogwipoVO>> entity = null;
		
		try {
			List<seogwipoVO> list = seogwipoService.selectSeogwipo();
			entity = new ResponseEntity<List<seogwipoVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<seogwipoVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
