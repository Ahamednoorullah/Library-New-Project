package com.chainsys.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.chainsys.library.model.User;

@Repository
public class UserDaoImpl implements UserDao  {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void saveUser(User userRegister) {
		String password = userRegister.getPassword();
		String confirmPassword = userRegister.getConfirmPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encoderPassword = encoder.encode(password);
		String encoderConfirmPassword = encoder.encode(confirmPassword);
		System.out.println(encoderPassword);
		String sqlQuery = "INSERT INTO bookstore.registration (user_name, cnfpassword, email, password) VALUES (?,?,?,?)";
		Object[] params = {userRegister.getUserName(),encoderConfirmPassword,userRegister.getEmail(),encoderPassword};
		jdbcTemplate.update(sqlQuery,params);
	}
}
