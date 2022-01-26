package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.jejuVO;
import com.spring.project.dto.seogwipoVO;

public interface SeogwipoDAO {
	
	List<seogwipoVO> selectSeogwipo() throws SQLException;
}
