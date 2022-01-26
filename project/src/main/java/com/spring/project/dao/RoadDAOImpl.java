package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.roadVO;

public class RoadDAOImpl implements RoadDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<roadVO> roadList() throws SQLException {
		List<roadVO> roadList = session.selectList("Road-Mapper.selectRoad");
		return roadList;
	}

}
