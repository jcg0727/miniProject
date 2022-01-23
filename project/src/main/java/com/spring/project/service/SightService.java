package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.project.command.SearchCriteria;
import com.spring.project.dto.sightVO;

public interface SightService {
	
	//목록조회
	Map<String, Object> getSightList(SearchCriteria cri) throws SQLException;
	
	List<sightVO> selectSightList() throws SQLException;
}
