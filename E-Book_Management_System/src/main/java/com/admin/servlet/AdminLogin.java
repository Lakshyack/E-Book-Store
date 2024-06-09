package com.admin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDao;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.user.entity.Admin;
import com.user.entity.User;

@WebServlet(name="login",urlPatterns = {"/adminlogin"})
public class AdminLogin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email=req.getParameter("email");
        String password=req.getParameter("password");

        AdminDao dao=new AdminDao(DBConnect.getConnection());
        HttpSession session=req.getSession();

            Admin us=dao.login(email, password);
            if(us != null) {
                session.setAttribute("Adminobj", us);
                resp.sendRedirect("index.jsp");
            }else {
                session.setAttribute("failedMsg", "Email & Password is Invalid !!!");
                resp.sendRedirect("adminLoginUpdateProfileServlet.jsp");
            }

        }

    }



