package com.spring.project.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.project.dao.AnalyzeDAO;
import com.spring.project.dto.analyzeVO;
import com.spring.project.dto.countVO;

public class AnalyzeServiceImpl implements AnalyzeService {
	
	private AnalyzeDAO analyzeDAO;
	public void setAnalyzeDAO(AnalyzeDAO analyzeDAO) {
		this.analyzeDAO = analyzeDAO;
	}
	
	@Override
	public Map<String, Object> selectAllPoint(String name) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<analyzeVO> selectAccidentPoint = analyzeDAO.selectAccidentPoint(name);
		List<analyzeVO> selectCctvPoint = analyzeDAO.selectCctvPoint(name);
		List<analyzeVO> selectCameraPoint = analyzeDAO.selectCameraPoint(name);
		List<analyzeVO> selectDumpPoint = analyzeDAO.selectDumpPoint(name);
		List<analyzeVO> selectRoadsignPoint = analyzeDAO.selectRoadsignPoint(name);
		List<analyzeVO> selectManyAccidentPoint = analyzeDAO.selectManyAccidentPoint(name);
		List<analyzeVO> selectStandard = analyzeDAO.selectStandard(name);
		
		dataMap.put("selectAccidentPoint", selectAccidentPoint);
		dataMap.put("selectCctvPoint", selectCctvPoint);
		dataMap.put("selectCameraPoint", selectCameraPoint);
		dataMap.put("selectDumpPoint", selectDumpPoint);
		dataMap.put("selectRoadsignPoint", selectRoadsignPoint);
		dataMap.put("selectManyAccidentPoint", selectManyAccidentPoint);
		dataMap.put("selectStandard", selectStandard);
		return dataMap;
	}

	@Override
	public List<countVO> selectCnt(String name) throws SQLException {
		List<countVO> selectCnt = analyzeDAO.selectCount(name);
		return selectCnt;
	}
	
	
}
