package com.chainsys.library.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.library.model.User;

public class UserMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		String userName = rs.getString("user_name");
		String email =rs.getString("email");
		String password = rs.getString("password");
		String confirmPassword = rs.getString("cnfpassword");
		user.setUserName(userName);
		user.setEmail(email);
		user.setPassword(password);
		user.setConfirmPassword(confirmPassword);
		return user;
	}

}
