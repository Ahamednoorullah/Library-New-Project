package com.chainsys.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.library.dao.UserRegisterDaoImpl;
import com.chainsys.library.model.UserRegister;
import com.chainsys.library.validation.RegisterValid;

@Controller
public class UserController {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	UserRegisterDaoImpl userRegisterdao;
	
	RegisterValid registerValid = new RegisterValid();
	@RequestMapping("/")
	public String home() {
		return  "home.html";
	}
	
	@GetMapping("/addUser")
	public String addUser(@RequestParam("username") String userName,@RequestParam("cpassword") String confirmPassword,
			@RequestParam("email") String email,@RequestParam("password") String password) {
		UserRegister userRegister = new UserRegister();
		userRegister.setUserName(userName);
		userRegister.setConfirmPassword(confirmPassword);
		userRegister.setEmail(email);
		userRegister.setPassword(password);
		
		boolean userValid = registerValid.isValid(userRegister);
		
		if (userValid == true) {
			System.out.println("Register Valid");
			userRegisterdao.saveUser(userRegister);
			return "register.html";
		} else {
			System.out.println("Register Not Valid");
            return "registerValid.html";
            
		}
		
	}
}
