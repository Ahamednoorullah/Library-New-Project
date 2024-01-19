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

import com.chainsys.library.dao.AdminDaoImpl;
import com.chainsys.library.dao.UserDaoImpl;
import com.chainsys.library.model.Books;
import com.chainsys.library.model.User;
import com.chainsys.library.validation.userValid;

@Controller
public class UserController {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	UserDaoImpl userdao;
	
	@Autowired
	AdminDaoImpl admindaoImpl;
	
	userValid userValid = new userValid();
	@RequestMapping("/home")
	public String home(Model model) {
		List<Books> newBooks = userdao.newBook();
		List<Books> bestBooks = userdao.bestBook();
		List<Books> kidsBooks = userdao.kidsBook();
		System.out.println(newBooks);
		model.addAttribute("newBook", newBooks);
		model.addAttribute("bestBook", bestBooks);
		model.addAttribute("kidsBook", kidsBooks);
		return  "index.jsp";
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
		System.out.println(user.getPassword());
		System.out.println(user.getEmail());
		boolean usersValid = userValid.isValid(user);
		
		if (usersValid == true) {
			System.out.println("Register Valid");
			userdao.saveUser(user);
			System.out.println(user.getUserName());
			return "register.jsp";
		} else {
			System.out.println("Register Not Valid");
            return "registerValid.html";
            
		}
		
	}
	
	@GetMapping("/addBook")
	public String addBooks(Books books) {
		admindaoImpl.addBooks(books);
		return "admin/add_books.jsp";
	}
	
	@GetMapping("/log")
	public String login(User user) {
		String adminEmail ="ahamednoorullah@gmail.com";
		String adminPassword = "12345678";
		String email=user.getEmail();
		String password = user.getPassword();
		System.out.println(email);
		System.out.println(password);
		if (email.contentEquals(adminEmail) && password.contentEquals(adminPassword)) {
			return "adminHome.jsp";
		} else {
            return "redirect:home";
		}
	}
	
	@GetMapping("/allBooks")
	public String allBooks(Model model) {
		List<Books> books = admindaoImpl.bookList();
		System.out.println(books);
		model.addAttribute("book_list", books);
		return "admin/all_books.jsp";
	}
	@GetMapping("/updateBooks")
	public String updateBook(@RequestParam("id") int id,Model model) {
		Books books = admindaoImpl.findone(id);
		model.addAttribute("bookFound", books);
		System.out.println("bookFound.."+books);
		return "admin/edit_books.jsp";
	}
	@GetMapping("/updateBookData")
	public String updateBooksData(Books books,Model model) {
		System.out.println("updateBook.."+books.getBookName());
		int updateRows = admindaoImpl.update(books);
        Model addAttribute = model.addAttribute(updateRows);
        model.addAttribute("updateBook",books);
		return "redirect:allBooks";
	}
	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam("id") int id,Model model) {
		Books books= new Books();
		int deleteRow = admindaoImpl.deleteBook(id);
		Model addAttribute = model.addAttribute(deleteRow);
        model.addAttribute("deleteBook",books);
		return "redirect:allBooks";
	}
//	@GetMapping("/listusers")
//	public String getAllUsers(Model model) {
//		List<User> users = userRegisterdao.userList();
//		System.out.println(users);
//		model.addAttribute("USER_LIST", users);
//		return "listusers.jsp";
//	}
//	@GetMapping("/findbyuser")
//	public String findOneUser(@RequestParam("email") String email,Model model) {
//		User user = userRegisterdao.findOne(email);
//		System.out.println("User OneRecord Found :"+user);
//		model.addAttribute("userFound", user);
//		return "findbyuser.jsp";
//	}
//	
//	@GetMapping("/updateuser")
//	public String update(@RequestParam("email") String email,Model model) {
//		User user = userRegisterdao.findOne(email);
//		System.out.println("User OneRecord Found :"+user);
//		model.addAttribute("userFound", user);
//		return "updateuser.jsp";
//	}
//	@GetMapping("/updatedata")
//	public String updateData(@RequestParam("username") String userName,@RequestParam("email") String email,
//			@RequestParam("password") String password,@RequestParam("cnfpassword") String confimPassword,Model model) {
//		User user = new User();
//		user.setUserName(userName);
//		user.setEmail(email);
//		user.setPassword(password);
//		user.setConfirmPassword(confimPassword);
//		int updateRows = userRegisterdao.update(user);
//		Model addAttribute = model.addAttribute(updateRows);
//		model.addAttribute("USER_LIST", user);
//		return "redirect:listusers";
//	}
//	@GetMapping("/deletedata")
//	public String deleteData(@RequestParam("email") String email,Model model) {
////		User user = userRegisterdao.findOne(email);
//		User user = new User();
//		int deleteRows = userRegisterdao.delete(email);
//		Model addAttribute = model.addAttribute(deleteRows);
//		model.addAttribute("USER_LIST", user);
//		return "redirect:listusers";
//	}
}
