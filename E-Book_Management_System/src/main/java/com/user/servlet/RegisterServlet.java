package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.user.entity.User;

@WebServlet(name="register", urlPatterns = {"/register.ik"})
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fname=req.getParameter("fname");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String password=req.getParameter("password");
		String check=req.getParameter("check");
		
//		System.out.println(fname +" "+email+" "+phno+" "+password+" "+check);
		
		User us=new User();
		us.setName(fname);
		us.setEmail(email);
		us.setPhno(phno);
		us.setPassword(password);
		
		HttpSession session=req.getSession();
		
		if(check !=null) {
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConnection());
			boolean f2=dao.checkUser(email);
			
			if(f2) {
				
				boolean f=dao.userRegister(us);
				
				if(f) {
					
					session.setAttribute("succMsg", "Registration Successfully...");
					resp.sendRedirect("register.jsp");
					
				}else {
					session.setAttribute("failedMsg", "Something went wrong on Server");
					resp.sendRedirect("register.jsp");
				}
				
			}else {
				session.setAttribute("failedMsg", "User Already Exist Try Another Email Id !!!");
				resp.sendRedirect("register.jsp");
			}
		
		}else {

			session.setAttribute("failedMsg", "Please Click Agree On Terms & Cond.");
			resp.sendRedirect("register.jsp");

		}
		
		
		
	}
	
	

}
