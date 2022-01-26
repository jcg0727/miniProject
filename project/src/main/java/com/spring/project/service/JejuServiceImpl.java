package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.JejuDAO;
import com.spring.project.dto.jejuVO;

public class JejuServiceImpl implements JejuService {

	private JejuDAO jejuDAO;
	public void setJejuDAO(JejuDAO jejuDAO) {
		this.jejuDAO = jejuDAO;
	}
	@Override
	public List<jejuVO> selectJeju() throws SQLException {
		List<jejuVO> selectJeju = jejuDAO.selectJeju();
		return selectJeju;
	}
	


}
