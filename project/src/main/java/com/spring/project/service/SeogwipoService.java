package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.seogwipoVO;

public interface SeogwipoService {
	
	List<seogwipoVO> selectSeogwipo() throws SQLException;
}
