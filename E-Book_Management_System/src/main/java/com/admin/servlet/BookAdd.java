package com.admin.servlet;

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

@WebServlet(name="addbooks",urlPatterns = "/add_books")
@MultipartConfig
public class BookAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bookName=req.getParameter("bname");
		String author=req.getParameter("author");
		String price=req.getParameter("price");
		String category=req.getParameter("category");
		String stock = req.getParameter("stock");
		String status=req.getParameter("bstatus");
		Part part=req.getPart("bimg");
		String fileName=part.getSubmittedFileName();
		
		
		BookDtls b=new BookDtls(bookName,author,price,stock,category,status,fileName,"admin");
		
		BookDAOImpl dao=new BookDAOImpl(DBConnect.getConnection());
		
		String path=getServletContext().getRealPath("")+"books";
		
		File file=new File(path);
		part.write(path + File.separator + fileName);
		
		
		boolean f=dao.addBooks(b);
		
		HttpSession session=req.getSession();
		String page="";
		if(f) {
			
			session.setAttribute("succMsg","Book Add Successfully");
			resp.sendRedirect("admin/add_books.jsp");
			
		}else {
			
			session.setAttribute("failedMsg","Something wrong on server");
			resp.sendRedirect("admin/add_books.jsp");
		}
		
	}

	
}
