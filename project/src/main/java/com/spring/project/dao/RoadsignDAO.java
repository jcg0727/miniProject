package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.accidentVO;
import com.spring.project.dto.roadsignVO;

public interface RoadsignDAO {
	
	List<roadsignVO> selectRoadsign() throws SQLException;
}
