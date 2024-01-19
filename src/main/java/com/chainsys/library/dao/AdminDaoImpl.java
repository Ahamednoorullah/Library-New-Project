package com.chainsys.library.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chainsys.library.mapper.BookMapper;
import com.chainsys.library.model.Books;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Override
	public void addBooks(Books books) {
		String sqlQuery = "INSERT INTO ebook.book_details (book_name,author,price,book_category,status,published_year,qty_instock,photo) VALUES (?,?,?,?,?,?,?,?)";
		Object[] params = {books.getBookName(),books.getAuthor(),books.getPrice(),books.getBookCategory(),books.getStatus(),books.getPublishedYear(),books.getQtyInstock(),books.getPhotoName()};
		jdbcTemplate.update(sqlQuery,params);
		
	}
	@Override
	public List<Books> bookList() {
		String sqlQuery = "select * from ebook.book_details";
		List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
		return bookList;
	}
	@Override
	public Books findone(int id) {
		String sqlQuery = "select * from ebook.book_details where book_id = ?";
		Books oneRecord = jdbcTemplate.queryForObject(sqlQuery,new BookMapper(),id);
		return oneRecord;
	}
	@Override
	public int update(Books books) {
		String sqlQuery = "update ebook.book_details set book_name=?,author=?,price=?,book_category=?,status=?,published_year=?,qty_instock=?,photo=? where book_id=?";
		Object[] params = {books.getBookName(),books.getAuthor(),books.getPrice(),books.getBookCategory(),books.getStatus(),books.getPublishedYear(),books.getQtyInstock(),books.getPhotoName(),books.getBookId()};
		System.out.println("dao update.."+books.getBookName()+","+books.getQtyInstock()+","+books.getBookId());
		int noOfRow = jdbcTemplate.update(sqlQuery, params);
		return noOfRow;
	}
	@Override
	public int deleteBook(int id) {
		String sqlQuery = "delete from ebook.book_details where book_id='"+id+"'";
		int noOfRows = jdbcTemplate.update(sqlQuery);
		return noOfRows;
	}
	

	
}
