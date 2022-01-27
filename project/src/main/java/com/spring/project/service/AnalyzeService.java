package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.project.dto.countVO;

public interface AnalyzeService {
	
	Map<String, Object> selectAllPoint(String name) throws SQLException; 
	
	List<countVO> selectCnt(String name)throws SQLException;

}
