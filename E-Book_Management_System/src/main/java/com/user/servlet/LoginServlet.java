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

@WebServlet(name="loginUser",urlPatterns = {"/login.ik"})
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		UserDAOImpl dao=new UserDAOImpl(DBConnect.getConnection());
		HttpSession session=req.getSession();

		

			
			User us=dao.login(email, password);
			if(us != null) {
				session.setAttribute("userobj", us);
				resp.sendRedirect("index.jsp");
			}else {
				session.setAttribute("failedMsg", "Email & Password is Invalid !!!");
				resp.sendRedirect("login.jsp");
			}

		}
		
	}



