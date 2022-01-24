package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.RoadsignDAO;
import com.spring.project.dto.roadsignVO;

public class RoadsignServiceImpl implements RoadsignService{

	private RoadsignDAO roadsignDAO;
	public void setRoadsignDAO(RoadsignDAO roadsignDAO) {
		this.roadsignDAO = roadsignDAO;
	}
	@Override
	public List<roadsignVO> selectRoadsigntList() throws SQLException {
		List<roadsignVO> selectRoadsigntList = roadsignDAO.selectRoadsign();
		return selectRoadsigntList;
	}
	
	
}
