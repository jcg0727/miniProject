package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.project.command.SearchCriteria;
import com.spring.project.dto.sightVO;

public class SightDAOImpl implements SightDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<sightVO> selectSightList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<sightVO> sightList = session.selectList("Sight-Mapper.selectSightList", cri, rowBounds);
		
		return sightList;
	}

	@Override
	public int selectSightTotalCount(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("Sight-Mapper.selectSightTotalCount", cri);
		return count;
	}

	@Override
	public List<sightVO> selectSightList() throws SQLException {
		List<sightVO> sightList = session.selectList("Sight-Mapper.selectSightList");
		return sightList;
	}

	@Override
	public List<sightVO> selectSightBuffer() throws SQLException {
		List<sightVO> selectSightBuffer = session.selectList("Sight-Mapper.selectSightBuffer");
		return selectSightBuffer;
	}

}
