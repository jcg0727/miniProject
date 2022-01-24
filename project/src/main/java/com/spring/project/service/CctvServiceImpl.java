package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dao.CctvDAO;
import com.spring.project.dto.cctvVO;

public class CctvServiceImpl implements CctvService {
	
	private CctvDAO cctvDAO;
	public void setCctvDAO(CctvDAO cctvDAO) {
		this.cctvDAO = cctvDAO;
	}
	
	@Override
	public List<cctvVO> selectCctv() throws SQLException {
		List<cctvVO> selectCctv = cctvDAO.selectCctv();
		return selectCctv;
	}

}
