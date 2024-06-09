package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.entity.Book_Order;
import com.user.entity.Cart;

import javax.servlet.http.HttpSession;

public class BookOrderImpl implements BookOrderDAO {

	private Connection con;

	public BookOrderImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try {
			String sql = "insert into book_order(user_name,email,address,phone,book_name,author,price,payment)"
					+ "values(?,?,?,?,?,?,?,?)";


			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement(sql);
			
			for(Book_Order b: blist) {
				ps.setString(1, b.getUserName());
				ps.setString(2, b.getEmail());
				ps.setString(3, b.getFulladd());
				ps.setString(4, b.getPhno());
				ps.setString(5, b.getBookName());
				ps.setString(6, b.getAuthor());
				ps.setString(7, b.getPrice());
				ps.setString(8, b.getPaymentType());
				
				ps.addBatch();
				
			}
			int count[]=ps.executeBatch();
			con.commit();
			f=true;
			con.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_Order> getBook(String email) {
		List<Book_Order> list=new ArrayList<Book_Order>();
		Book_Order o=null;
		
		try {
			
			String sql="Select * from book_order where email=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Book_Order();

				o.setOrderId(rs.getString(1));
				o.setUserName(rs.getString(2));
				o.setEmail(rs.getString(3));
				o.setFulladd(rs.getString(4));
				o.setPhno(rs.getString(5));
				o.setBookName(rs.getString(6));
				o.setAuthor(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book_Order> getAllBook() {
		List<Book_Order> list=new ArrayList<Book_Order>();
		Book_Order o=null;
		
		try {
			
			String sql="Select * from book_order";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Book_Order();

				o.setOrderId(rs.getString(1));
				o.setUserName(rs.getString(2));
				o.setEmail(rs.getString(3));
				o.setFulladd(rs.getString(4));
				o.setPhno(rs.getString(5));
				o.setBookName(rs.getString(6));
				o.setAuthor(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	
	

}
