package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.project.dto.countVO;
import com.spring.project.dto.analyzeVO;

public class AnalyzeDAOImpl implements AnalyzeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<analyzeVO> selectAccidentPoint(String name) throws SQLException {
		List<analyzeVO> selectAccidentPoint = session.selectList("Analyze-Mapper.selectAccidentPoint", name);
		return selectAccidentPoint;
	}

	@Override
	public List<analyzeVO> selectCctvPoint(String name) throws SQLException {
		List<analyzeVO> selectCctvPoint = session.selectList("Analyze-Mapper.selectCctvPoint", name);
		return selectCctvPoint;
	}

	@Override
	public List<analyzeVO> selectCameraPoint(String name) throws SQLException {
		List<analyzeVO> selectCameraPoint = session.selectList("Analyze-Mapper.selectCameraPoint", name);
		return selectCameraPoint;
	}

	@Override
	public List<analyzeVO> selectDumpPoint(String name) throws SQLException {
		List<analyzeVO> selectDumpPoint = session.selectList("Analyze-Mapper.selectDumpPoint", name);
		return selectDumpPoint;
	}

	@Override
	public List<analyzeVO> selectRoadsignPoint(String name) throws SQLException {
		List<analyzeVO> selectRoadsignPoint = session.selectList("Analyze-Mapper.selectRoadsignPoint", name);
		return selectRoadsignPoint;
	}

	@Override
	public List<analyzeVO> selectManyAccidentPoint(String name) throws SQLException {
		List<analyzeVO> selectManyAccidentPoint = session.selectList("Analyze-Mapper.selectManyAccidentPoint", name);
		return selectManyAccidentPoint;
	}

	@Override
	public List<analyzeVO> selectStandard(String name) throws SQLException {
		List<analyzeVO> selectStandard = session.selectList("Analyze-Mapper.selectStandard", name);
		return selectStandard;
	}

	@Override
	public List<countVO> selectCount(String name) throws SQLException {
		List<countVO> selectCount = session.selectList("Analyze-Mapper.selectCnt", name);
		return selectCount;
	}

}
