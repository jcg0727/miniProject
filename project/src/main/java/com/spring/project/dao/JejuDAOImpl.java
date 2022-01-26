package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.jejuVO;

public class JejuDAOImpl implements JejuDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<jejuVO> selectJeju() throws SQLException {
		List<jejuVO> selectJeju = session.selectList("Jeju-Mapper.selectJeju");
		return selectJeju;
	}

}
