package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.roadVO;

public interface RoadDAO {
	List<roadVO> roadList() throws SQLException;
}
