package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.user.entity.BookDtls;
import com.user.entity.Cart;
import com.user.entity.User;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConnection());
			BookDtls b= dao.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConnection());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			User U = (User) session.getAttribute("userobj");
			
			if(f) {
				session.setAttribute("addCart", "Book Added To Cart");
				session.setAttribute("userobj",U);
				resp.sendRedirect("checkout.jsp");
			}else {
				session.setAttribute("failed", "Something Wrong On Server");
				resp.sendRedirect("view_book.jsp?bid=" + c.getBid());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
