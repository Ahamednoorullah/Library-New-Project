package com.chainsys.library.dao;

import java.util.List;

import com.chainsys.library.model.Books;
import com.chainsys.library.model.User;

public interface UserDao {

	public void saveUser(User userRegister);
//	public List<User> userList();
//	public User findOne(String email);
//	public int update(User user);
//	public int delete(String email);
	public List<Books> newBook();
	public List<Books> bestBook();
	public List<Books> kidsBook();
}
