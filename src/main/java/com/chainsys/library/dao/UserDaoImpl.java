package com.chainsys.library.dao;

import java.util.List;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.chainsys.library.mapper.BookMapper;
import com.chainsys.library.mapper.UserMapper;
import com.chainsys.library.model.Books;
import com.chainsys.library.model.User;

@Repository
public class UserDaoImpl implements UserDao  {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void saveUser(User userRegister) {
		String password = userRegister.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encoderPassword = encoder.encode(password);
		System.out.println(encoderPassword);
		String sqlQuery = "INSERT INTO ebook.user (name,email,phone_no, password) VALUES (?,?,?,?)";
		Object[] params = {userRegister.getUserName(),userRegister.getEmail(),userRegister.getPhoneNumber(),encoderPassword};
		jdbcTemplate.update(sqlQuery,params);
	}

	@Override
	public List<Books> newBook() {
		String sqlQuery = "select * from ebook.book_details where book_category='NewArrival'";
		List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
		return bookList;
	}

	@Override
	public List<Books> bestBook() {
		String sqlQuery = "select * from ebook.book_details where book_category='bestSeller'";
		List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
		return bookList;
	}

	@Override
	public List<Books> kidsBook() {
		String sqlQuery = "select * from ebook.book_details where book_category='kids'";
		List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
		return bookList;
	}

//	@Override
//	public List<User> userList() {
//		String sqlQuery ="select * from bookstore.registration";
//		List<User> usersList = jdbcTemplate.query(sqlQuery,new UserMapper() );
//		return usersList;
//	}
//
//	@Override
//	public User findOne(String email) {
//		String sqlQuery = "select * from bookstore.registration where email = ?";
//		User oneRecord = jdbcTemplate.queryForObject(sqlQuery,new UserMapper(),email);
//		System.out.println("Finding one record : "+oneRecord);
//		
//		return oneRecord;
//	}
//
//	@Override
//	public int update(User user) {
//		String sqlQuery = "update bookstore.registration set user_name=?,cnfpassword=?,password=? where email=?";
//		Object[] params = {user.getUserName(),user.getConfirmPassword(),user.getPassword(),user.getEmail()};
//		int noOfRows = jdbcTemplate.update(sqlQuery, params);
//		return noOfRows;
//	}
//
//	@Override
//	public int delete(String email) {
//		String sqlQuery = "delete from bookstore.registration where email='"+email+"'";
//		int noOfRows = jdbcTemplate.update(sqlQuery);
//		return noOfRows;
//	}
}
