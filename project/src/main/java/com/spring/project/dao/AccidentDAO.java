package com.spring.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.accidentVO;

public interface AccidentDAO {
	List<accidentVO> selectAccident() throws SQLException;
}
