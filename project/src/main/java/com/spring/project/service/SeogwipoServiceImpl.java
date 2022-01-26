package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.SeogwipoDAO;
import com.spring.project.dto.seogwipoVO;

public class SeogwipoServiceImpl implements SeogwipoService {
	
	private SeogwipoDAO seogwipoDAO;
	public void setSeogwipoDAO(SeogwipoDAO seogwipoDAO) {
		this.seogwipoDAO = seogwipoDAO;
	}

	@Override
	public List<seogwipoVO> selectSeogwipo() throws SQLException {
		List<seogwipoVO> selectSeogwipo = seogwipoDAO.selectSeogwipo();
		return selectSeogwipo;
	}

}
