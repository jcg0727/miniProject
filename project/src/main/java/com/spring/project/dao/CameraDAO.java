package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.cameraVO;
import com.spring.project.dto.sightVO;

public interface CameraDAO {
	
	List<cameraVO> selectCameraList() throws SQLException;
}
