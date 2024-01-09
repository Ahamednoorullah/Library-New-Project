package com.chainsys.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserRegisterDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void saveUser(String userName,String confirmPassword,String email,String password) {
		String sqlQuery = "INSERT INTO bookstore.registration (user_name, cnfpassword, email, password) VALUES ('"+userName+"','"+confirmPassword+"','"+email+"','"+password+"')";
		jdbcTemplate.update(sqlQuery);
	}
}
