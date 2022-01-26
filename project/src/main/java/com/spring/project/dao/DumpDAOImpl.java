package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.dumpVO;

public class DumpDAOImpl implements DumpDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<dumpVO> selectDumpList() throws SQLException {
		List<dumpVO> selectDumpList = session.selectList("Dump-Mapper.selectDump");
		return selectDumpList;
	}

}
