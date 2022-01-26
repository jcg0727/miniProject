package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.roadVO;

public interface RoadService {
	
	List<roadVO> roadList() throws SQLException;
}
