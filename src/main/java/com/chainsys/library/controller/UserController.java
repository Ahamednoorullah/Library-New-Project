package com.chainsys.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.library.dao.UserRegisterDAO;

@Controller
public class UserController {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	UserRegisterDAO userRegisterdao;
	@RequestMapping("/")
	public String home() {
		return  "home.html";
	}
	
	@GetMapping("/addUser")
	public String addUser(@RequestParam("username") String userName,@RequestParam("cpassword") String confirmPassword,
			@RequestParam("email") String email,@RequestParam("password") String password) {
		userRegisterdao.saveUser(userName, confirmPassword, email, password);
		return "register.html";
	}
}
