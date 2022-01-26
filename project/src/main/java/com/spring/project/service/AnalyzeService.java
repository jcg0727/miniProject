package com.spring.project.service;

import java.sql.SQLException;
import java.util.Map;

public interface AnalyzeService {
	
	Map<String, Object> selectAllPoint(String name) throws SQLException; 

}
