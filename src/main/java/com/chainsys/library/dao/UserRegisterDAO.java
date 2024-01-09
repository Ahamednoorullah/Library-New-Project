package com.chainsys.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.library.model.UserRegister;

@Repository
public class UserRegisterDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void saveUser(UserRegister userRegister) {
		String sqlQuery = "INSERT INTO bookstore.registration (user_name, cnfpassword, email, password) VALUES (?,?,?,?)";
		Object[] params = {userRegister.getUserName(),userRegister.getConfirmPassword(),userRegister.getEmail(),userRegister.getPassword()};
		jdbcTemplate.update(sqlQuery,params);
	}
}
