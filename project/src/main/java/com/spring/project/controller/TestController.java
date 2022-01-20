package com.spring.project.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;
import org.springframework.stereotype.Controller;

@Controller
public class TestController {
	
	private static final String DRIVER = "org.postgresql.Driver"; //Connection을 구현한 클래스의 이름
	private static final String URL = "jdbc:postgresql://localhost:5444/project"; //mysql 서버 주소
	private static final String USER = "postgres"; //계정
	private static final String PW = "postgres"; // 비밀번호
	
	@Test // jUnit이 테스트함
	public void testConnection() throws Exception {
		Class.forName(DRIVER); // DRIVER라는 이름을 가진 클래스를 찾음

		try (Connection con = DriverManager.getConnection(URL, USER, PW)) { 
			int id = 1;
			String name = selectName(con,id);
			System.out.println("id가 "+id+"인 행의 name 은 " + name);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// SELECT 문을 날리는 메서드

	private static final String SQL2 = "select new_addr from cctv_5174 where no = ?;"; // sql 쿼리

	public String selectName(Connection con, Integer id) throws Exception {
		String result = null;
		try (PreparedStatement pstmt = con.prepareStatement(SQL2)) {
			pstmt.setString(1,id.toString());
			ResultSet rs = pstmt.executeQuery(); // 쿼리 실행
			if (rs.next()) // 다음행이 있는지 확인
				result = rs.getString("new_addr"); // name column을 가져옴
		} catch (Exception e) {
			throw e;
		}
		return result;
	}
}
