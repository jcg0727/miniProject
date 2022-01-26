package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.DumpDAO;
import com.spring.project.dto.dumpVO;

public class DumpServiceImpl implements DumpService {
	
	private DumpDAO dumpDAO;
	public void setDumpDAO(DumpDAO dumpDAO) {
		this.dumpDAO = dumpDAO;
	}
	@Override
	public List<dumpVO> selectDump() throws SQLException {
		List<dumpVO> selectDump = dumpDAO.selectDumpList();
		return selectDump;
	}

}
