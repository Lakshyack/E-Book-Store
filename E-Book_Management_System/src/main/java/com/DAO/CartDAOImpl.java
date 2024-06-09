package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.entity.BookDtls;
import com.user.entity.Cart;

public class CartDAOImpl implements CartDAO{
	
	private Connection con;
	
	public CartDAOImpl(Connection con) {
		this.con=con;
	}
	
	
	@Override
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sql ="insert into cart(bid,uid,bookName,author,price,total_price)"
					+ " values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
			int x=ps.executeUpdate();
			
			if(x == 1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0;
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice =totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean deleteBook(int bid, int uid, int cid) {
		boolean f = false;
		try {
			// SQL query to delete a specific book from the cart
			String sql = "DELETE FROM cart WHERE bid = ? AND uid = ? AND cid = ?";

			// Create a PreparedStatement to execute the SQL query
			PreparedStatement ps = con.prepareStatement(sql);

			// Set the parameters for the PreparedStatement
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

			// Execute the update (delete) operation
			int x = ps.executeUpdate();

			// Check if exactly one row was affected (deleted)
			if (x == 1) {
				f = true;
			}
		} catch (Exception e) {
			// Print the stack trace if an exception occurs
			e.printStackTrace();
		}
		// Return the result of the deletion operation
		return f;
	}





}
