package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.dumpVO;

public interface DumpService {
	
	List<dumpVO> selectDump() throws SQLException;
}
