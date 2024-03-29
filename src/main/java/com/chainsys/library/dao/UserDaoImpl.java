package com.chainsys.library.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.chainsys.library.mapper.BookMapper;
import com.chainsys.library.mapper.CartMapper;
import com.chainsys.library.mapper.OrderMapper;
import com.chainsys.library.mapper.UserMapper;
import com.chainsys.library.model.Books;
import com.chainsys.library.model.Cart;
import com.chainsys.library.model.Order;
import com.chainsys.library.model.User;

@Repository
public class UserDaoImpl implements UserDao  {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	//User RegisterForm Added
	public void saveUser(User userRegister) {
		try {
			String password = userRegister.getPassword();
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String encoderPassword = encoder.encode(password);
			//System.out.println(encoderPassword);
			String sqlQuery = "INSERT INTO ebook.user (name,email,phone_no, password) VALUES (?,?,?,?)";
			Object[] params = {userRegister.getUserName(),userRegister.getEmail(),userRegister.getPhoneNumber(),encoderPassword};
			jdbcTemplate.update(sqlQuery,params);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("There is Some SQL Error in Adding User");
		}
		
	}

	
	//Bringing all new Books
	@Override
	public List<Books> newBook() {
		try {
			String sqlQuery = "select * from ebook.book_details where book_category='NewArrival'";
			List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
			return bookList;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("There is Some SQL Error in bringing NewBook List");
		    return null;
		}
		
	}

	//Bringing all Comics Books
	@Override
	public List<Books> comicsBook() {
		try {
			String sqlQuery = "select * from ebook.book_details where book_category='comics'";
			List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
			return bookList;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("There is Some SQL Error in bringing ComicsBook List");
		    return null;
		}
		
	}

	//Bringing all Historical Books
	@Override
	public List<Books> historicalBook() {
		try {
			String sqlQuery = "select * from ebook.book_details where book_category='historical'";
			List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
			return bookList;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("There is Some SQL Error in bringing HistoricalBook List");
			return null;
		}
			}

	//User Login Process
	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			String sqlQuery = "select * from ebook.user where email=? and password=?";
			 user = jdbcTemplate.queryForObject(sqlQuery, new UserMapper(),email,password);
			 return user;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sql Error in Login Page");
			return user;
		}
		
	}

	//User Cart Added
	@Override
	public boolean addCart(Cart cart) {
		boolean f = false;
		try {
			String sqlQuery = "INSERT INTO ebook.cart (book_id,user_id,book_name, author,price,total_price) VALUES (?,?,?,?,?,?)";
			Object[] params = {cart.getBookId(),cart.getUserId(),cart.getBookName(),cart.getAuthor(),cart.getPrice(),cart.getTotalPrice()};
			int noOfRow = jdbcTemplate.update(sqlQuery, params);
			if (noOfRow == 1) {
				f = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Cart Added Error in SQL");
		}
		
		return f;
	}

	//Bringing user All CartList
	@Override
	public List<Cart> getBooksbyUser(int userId) {
		List<Cart> cart = null;
		try {
			String sqlQuery = "select * from ebook.cart where user_id=?";
			cart = jdbcTemplate.query(sqlQuery, new CartMapper(),userId);
			System.out.println("cart dao...."+cart);
			return cart;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("There is Some SQL Error in Bringing All CartList");
		     return cart;
		}
		
	}

//	@Override
//	public List<User> userList() {
//		String sqlQuery ="select * from bookstore.registration";
//		List<User> usersList = jdbcTemplate.query(sqlQuery,new UserMapper() );
//		return usersList;
//	}

	//Bringing find one User
	@Override
	public User findOne(int userId) {
		try {
			String sqlQuery = "select * from ebook.user where id = ?";
			User oneRecord = jdbcTemplate.queryForObject(sqlQuery,new UserMapper(),userId);
			System.out.println("Finding one record : "+oneRecord);
			
			return oneRecord;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Findind one User Record Error in SQL Statement");
		    return null;
		}
	}
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

	//Remove Cart Items
	@Override
	public boolean removeBooks(int cartId) {
		boolean f = false;
		try {
			
			String sqlQuery = "delete from ebook.cart where cart_id='"+cartId+"'";
			int noOfRows = jdbcTemplate.update(sqlQuery);
			if (noOfRows == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Remove Cart Items Error In SQL Statement");
		}
				return f;
	}

	//User OrderList Saved
	@Override
	public boolean saveOrder(List<Order> olist) {
		boolean f =false;
		
		String sqlQuery = "insert into ebook.book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
		for (Order order : olist) {
			Object[] params = {order.getOrderId(),order.getUserName(),order.getEmail(),order.getFullAdd(),order.getPhoneNumber(),order.getBookName(),order.getAuthor(),order.getPrice(),order.getPaymentType()};
		    jdbcTemplate.update(sqlQuery, params);
		}
		
		f = true;
		return f;
	}

	//Bringing All OrderList Items
	@Override
	public List<Order> getOrderList(String email) {
		List<Order> order = null;
		try {
			String sqlQuery = "select * from ebook.book_order where email=?";
			order = jdbcTemplate.query(sqlQuery, new OrderMapper(),email);
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Order ALL list Error in SQL Statement");
			return order;
		}
	
	}

	//Bringing Search Book List
	@Override
	public List<Books> getBookBySearch(String ch) {
		try {
			String sqlQuery = "select * from ebook.book_details where book_name like '%"+ch+"%' or author like '%"+ch+"%' or book_category like '%"+ch+"%' and status ='Active'";
			List<Books> bookList = jdbcTemplate.query(sqlQuery, new BookMapper());
			return bookList;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Search List Error in SQL statement");
			return null;
		}

	}

	//Bringing find one User from userlist
	@Override
	public boolean findUser(String email) {
		boolean fo =false;
		try {
			List<User>  user = null;
			String sqlQuery = "select * from ebook.user where email = '"+email+"'";
			 user = jdbcTemplate.query(sqlQuery, new UserMapper());
			if (user.isEmpty() ) {
				fo =true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Finding one User ERROR In SQL Statement");
			
		}
		return fo;
	}
}
