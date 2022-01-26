package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.jejuVO;

public interface JejuDAO {
	
	List<jejuVO> selectJeju() throws SQLException;
}
