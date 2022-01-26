package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.command.SearchCriteria;
import com.spring.project.dto.sightVO;

public interface SightDAO {
	List<sightVO> selectSightList(SearchCriteria cri) throws SQLException;
	
	int selectSightTotalCount(SearchCriteria cri) throws SQLException;
	
	List<sightVO> selectSightList() throws SQLException;
	
	List<sightVO> selectSightBuffer() throws SQLException;
}
