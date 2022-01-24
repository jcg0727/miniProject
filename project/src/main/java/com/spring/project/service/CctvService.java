package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.cctvVO;

public interface CctvService {
	
	List<cctvVO> selectCctv() throws SQLException;
}
