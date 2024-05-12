package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.user.entity.BookDtls;

import javax.servlet.http.*;
import java.lang.String;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bookName=req.getParameter("bname");
		String author=req.getParameter("author");
		String price=req.getParameter("price");
		String category="Old";
		String status="Active";
		Part part=req.getPart("bimg");
		String fileName=part.getSubmittedFileName();
		String useremail=req.getParameter("user");
		
		BookDtls b=new BookDtls(bookName,author,price,category,status,fileName,useremail);
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConnection());
		
		String path=getServletContext().getRealPath("")+"books";
		
		File file=new File(path);
		part.write(path + File.separator + fileName);
		
		
		boolean f=dao.addBooks(b);
		
		HttpSession session=req.getSession();
		String page="";
		if(f) {
			
			session.setAttribute("succMsg","Book Add Successfully");
			resp.sendRedirect("sell_book.jsp");
			
		}else {
			
			session.setAttribute("failedMsg","Something wrong on server");
			resp.sendRedirect("sell_book.jsp");
		}
		
	}

	
}
