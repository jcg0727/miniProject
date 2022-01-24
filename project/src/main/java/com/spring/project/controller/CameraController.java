package com.spring.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.project.dto.cameraVO;
import com.spring.project.service.CameraService;

@Controller
public class CameraController {

	@Autowired
	private CameraService cameraService;
	

	
	@RequestMapping(value="/cameraList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<cameraVO>> cameraList() throws Exception{
		ResponseEntity<List<cameraVO>> entity = null;
		
		try {
			List<cameraVO> list = cameraService.selectCameraList();
			entity = new ResponseEntity<List<cameraVO>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity =  new ResponseEntity<List<cameraVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
