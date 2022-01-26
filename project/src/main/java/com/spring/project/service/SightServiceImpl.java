package com.spring.project.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.project.command.PageMaker;
import com.spring.project.command.SearchCriteria;
import com.spring.project.dao.SightDAO;
import com.spring.project.dto.sightVO;

public class SightServiceImpl implements SightService{
	
	private SightDAO sightDAO;
	public void setSightDAO(SightDAO sightDAO) {
		this.sightDAO = sightDAO;
	}
	@Override
	public Map<String, Object> getSightList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<sightVO> sightList = sightDAO.selectSightList(cri);
		
		int totalCount = sightDAO.selectSightTotalCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("sightList", sightList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	@Override
	public List<sightVO> selectSightList() throws SQLException {
		List<sightVO> sightList = sightDAO.selectSightList();
		return sightList;
	}
	@Override
	public List<sightVO> selectSightBuffer() throws SQLException {
		List<sightVO> selectSightBuffer = sightDAO.selectSightBuffer();
		return selectSightBuffer;
	}
	
	
}
