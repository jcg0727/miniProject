package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.CameraDAO;
import com.spring.project.dto.cameraVO;

public class CameraServiceImpl implements CameraService {
	
	private CameraDAO cameraDAO;
	public void setCameraDAO(CameraDAO cameraDAO) {
		this.cameraDAO = cameraDAO;
	}
	
	@Override
	public List<cameraVO> selectCameraList() throws SQLException {
		List<cameraVO> selectCameraList = cameraDAO.selectCameraList();
		return selectCameraList;
	}

}
