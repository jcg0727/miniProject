package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.dumpVO;

public interface DumpDAO {
	
	List<dumpVO> selectDumpList() throws SQLException;
}
