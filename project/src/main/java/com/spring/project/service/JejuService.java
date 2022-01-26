package com.spring.project.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.project.dto.jejuVO;

public interface JejuService {
	List<jejuVO> selectJeju() throws SQLException;
}
