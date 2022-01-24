package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.cctvVO;
import com.spring.project.dto.sightVO;

public class CctvDAOImpl implements CctvDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<cctvVO> selectCctv() throws SQLException {
		List<cctvVO> cctvList = session.selectList("Cctv-Mapper.selectCctv");
		return cctvList;
	}

}
