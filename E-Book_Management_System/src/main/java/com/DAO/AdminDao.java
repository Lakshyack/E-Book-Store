package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.entity.Admin;
import com.user.entity.User;

import javax.servlet.http.HttpSession;

public class AdminDao {
private Connection con;

    public AdminDao(Connection con) {
        super();
        this.con = con;
    }

    public Admin login(String email, String password) {

        Admin us=null;
        try {
            String sql="Select * from admin where email=? and password=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs=ps.executeQuery();
            while(rs.next()) {
                us=new Admin();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPassword(rs.getString(4));
                us.setProfile(rs.getString(5));

            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return us;
    }

    public boolean checkPassword(int id,String ps) {
        boolean f=false;

        try {

            String sql= "Select * from admin where id=? and password=?";
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

    public boolean updateProfile(Admin us) {
        boolean f=false;
        try {
            String sql="Update admin set name=?,email=?,profile=? where id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3,us.getProfile());
            ps.setInt(4, us.getId());

            int x=ps.executeUpdate();
            if(x==1) {
                f=true;
            }

        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
