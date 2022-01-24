package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.roadsignVO;

public class RoadsignDAOImpl implements RoadsignDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<roadsignVO> selectRoadsign() throws SQLException {
		List<roadsignVO> selectRoadsign = session.selectList("Roadsign-Mapper.selectRoadsign");
		return selectRoadsign;
	}

}
