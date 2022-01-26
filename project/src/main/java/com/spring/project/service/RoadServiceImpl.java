package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.RoadDAO;
import com.spring.project.dto.roadVO;

public class RoadServiceImpl implements RoadService {
	
	private RoadDAO roadDAO;
	public void setRoadDAO(RoadDAO roadDAO) {
		this.roadDAO = roadDAO;
	}
	
	@Override
	public List<roadVO> roadList() throws SQLException {
		List<roadVO> roadList = roadDAO.roadList();
		return roadList;
	}

}
