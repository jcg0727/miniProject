package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.cameraVO;

public class CameraDAOImpl implements CameraDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<cameraVO> selectCameraList() throws SQLException {
		List<cameraVO> selectCameraList = session.selectList("Camera-Mapper.selectCamera");
		return selectCameraList;
	}

}
