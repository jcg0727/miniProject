package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.cctvVO;
import com.spring.project.dto.sightVO;

public interface CctvDAO {
	
	List<cctvVO> selectCctv() throws SQLException;
}
