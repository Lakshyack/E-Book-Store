package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.entity.User;

public class UserDAOImpl implements UserDAO{

	private Connection con;


	public UserDAOImpl(Connection con) {
		super();
		this.con = con;
	}



	public boolean userRegister(User us) {
		boolean f=false;
		try {
			String sql="insert into user(name,email,phno,password,profile) values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			ps.setString(5,us.getProfile());
			int x=ps.executeUpdate();
			if(x==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	public User login(String email, String password) {
		User us=null;
		try {
			String sql="Select * from user where email=? and password=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setProfile(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setPincode(rs.getString(9));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}



	@Override
	public boolean checkPassword(int id,String ps) {
		boolean f=false;
		
		try {
			
			String sql= "Select * from user where id=? and password=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	@Override
	public boolean updateProfile(User us) {
		boolean f=false;
		try {
			String sql="Update user set name=?,email=?,phno=?,profile=? where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4,us.getProfile());
			ps.setInt(5, us.getId());
			
			int x=ps.executeUpdate();
			if(x==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	@Override
	public boolean checkUser(String em) {
		boolean f=true;
		try {
			String sql="Select * from user where email=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, em);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	
	
	

}
