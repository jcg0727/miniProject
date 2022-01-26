package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.jejuVO;
import com.spring.project.dto.seogwipoVO;

public class SeogwipoDAOImpl implements SeogwipoDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<seogwipoVO> selectSeogwipo() throws SQLException {
		List<seogwipoVO> selectSeogwipo = session.selectList("Seogwipo-Mapper.selectSeogwipo");
		return selectSeogwipo;
	}

}
