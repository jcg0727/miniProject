package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.project.dto.countVO;
import com.spring.project.dto.analyzeVO;

public interface AnalyzeDAO {
	
	public List<analyzeVO> selectAccidentPoint(String name) throws SQLException; 
	public List<analyzeVO> selectCctvPoint(String name) throws SQLException; 
	public List<analyzeVO> selectCameraPoint(String name) throws SQLException; 
	public List<analyzeVO> selectDumpPoint(String name) throws SQLException; 
	public List<analyzeVO> selectRoadsignPoint(String name) throws SQLException; 
	public List<analyzeVO> selectManyAccidentPoint(String name) throws SQLException; 
	public List<analyzeVO> selectStandard(String name) throws SQLException; 
	
	public List<countVO> selectCount(String name) throws SQLException; 
}
