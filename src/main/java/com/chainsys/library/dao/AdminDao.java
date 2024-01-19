package com.chainsys.library.dao;

import java.util.List;

import com.chainsys.library.model.Books;

public interface AdminDao {

	public void addBooks(Books books);
	public List<Books> bookList();
	public Books findone(int id);
	public int update(Books books);
	public int deleteBook(int id);
	
}
