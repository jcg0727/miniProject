package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.accidentVO;

public class AccidentDAOImpl implements AccidentDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<accidentVO> selectAccident() throws SQLException {
		List<accidentVO> selectAccident = session.selectList("Accident-Mapper.selectAccident");
		return selectAccident;
	}
	
	
}
