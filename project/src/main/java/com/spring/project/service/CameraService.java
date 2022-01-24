package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.accidentVO;
import com.spring.project.dto.cameraVO;

public interface CameraService {
	
	List<cameraVO> selectCameraList() throws SQLException;
}
