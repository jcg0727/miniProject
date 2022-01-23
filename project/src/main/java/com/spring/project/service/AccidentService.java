package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.accidentVO;
import com.spring.project.dto.sightVO;

public interface AccidentService {
	
	List<accidentVO> selectAccidentList() throws SQLException;
}
