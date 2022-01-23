package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.AccidentDAO;
import com.spring.project.dto.accidentVO;

public class AccidentServiceImpl implements AccidentService {
	
	private AccidentDAO accidentDAO;
	public void setAccidentDAO(AccidentDAO accidentDAO) {
		this.accidentDAO = accidentDAO;
	}
	
	
	@Override
	public List<accidentVO> selectAccidentList() throws SQLException {
		List<accidentVO> accidentList = accidentDAO.selectAccident();
		return accidentList;
	}

}
