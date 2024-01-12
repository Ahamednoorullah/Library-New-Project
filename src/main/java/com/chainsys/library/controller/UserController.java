package com.chainsys.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.library.dao.UserDaoImpl;
import com.chainsys.library.model.User;
import com.chainsys.library.validation.userValid;

@Controller
public class UserController {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	UserDaoImpl userRegisterdao;
	
	userValid userValid = new userValid();
	@RequestMapping("/")
	public String home() {
		return  "home.html";
	}
	@RequestMapping("/reg")
	public String register() {
		return "register.html";
	}
	
	@GetMapping("/addUser")
	public String addUser(User user) {
//	public String addUser(@RequestParam("username") String userName,@RequestParam("cpassword") String confirmPassword,
//			@RequestParam("email") String email,@RequestParam("password") String password) {
//		UserRegister userRegister = new UserRegister();
//		userRegister.setUserName(userName);
//		userRegister.setConfirmPassword(confirmPassword);
//		userRegister.setEmail(email);
//		userRegister.setPassword(password);
		System.out.println(user.getUserName());
		System.out.println(user.getConfirmPassword());
		System.out.println(user.getPassword());
		System.out.println(user.getEmail());
		boolean usersValid = userValid.isValid(user);
		
		if (usersValid == true) {
			System.out.println("Register Valid");
			userRegisterdao.saveUser(user);
			System.out.println(user.getUserName());
			return "register.html";
		} else {
			System.out.println("Register Not Valid");
            return "registerValid.html";
            
		}
		
	}
	@GetMapping("/listusers")
	public String getAllUsers(Model model) {
		List<User> users = userRegisterdao.userList();
		System.out.println(users);
		model.addAttribute("USER_LIST", users);
		return "listusers.jsp";
	}
	@GetMapping("/findbyuser")
	public String findOneUser(@RequestParam("email") String email,Model model) {
		User user = userRegisterdao.findOne(email);
		System.out.println("User OneRecord Found :"+user);
		model.addAttribute("userFound", user);
		return "findbyuser.jsp";
	}
	
	@GetMapping("/updateuser")
	public String update(@RequestParam("email") String email,Model model) {
		User user = userRegisterdao.findOne(email);
		System.out.println("User OneRecord Found :"+user);
		model.addAttribute("userFound", user);
		return "updateuser.jsp";
	}
	@GetMapping("/updatedata")
	public String updateData(@RequestParam("username") String userName,@RequestParam("email") String email,
			@RequestParam("password") String password,@RequestParam("cnfpassword") String confimPassword,Model model) {
		User user = new User();
		user.setUserName(userName);
		user.setEmail(email);
		user.setPassword(password);
		user.setConfirmPassword(confimPassword);
		int updateRows = userRegisterdao.update(user);
		Model addAttribute = model.addAttribute(updateRows);
		model.addAttribute("USER_LIST", user);
		return "redirect:listusers";
	}
	@GetMapping("/deletedata")
	public String deleteData(@RequestParam("email") String email,Model model) {
//		User user = userRegisterdao.findOne(email);
		User user = new User();
		int deleteRows = userRegisterdao.delete(email);
		Model addAttribute = model.addAttribute(deleteRows);
		model.addAttribute("USER_LIST", user);
		return "redirect:listusers";
	}
}
