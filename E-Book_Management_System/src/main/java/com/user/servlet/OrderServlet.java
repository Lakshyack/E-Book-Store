package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.admin.servlet.StockUpdate;
//import com.admin.servlet.stockUpdate;
import com.user.entity.BookDtls;
import com.user.entity.Book_Order;
import com.user.entity.Cart;
import com.user.entity.User;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + "," + state + "," + pincode;

			// Get current date and time
			LocalDateTime now = LocalDateTime.now();
			// Define the format
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss a");
			// Format the date and time
			String currentDateTimeString = now.format(formatter);
			// Add 7 days to the current date and time
			LocalDateTime futureDate = now.plusDays(7);

			// Format the future date and time
			String futureDateTimeString = futureDate.format(formatter);


			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
			Book_Order o = null;
			List<Cart> blist = dao.getBookByUser(id);

			HttpSession session = req.getSession();
			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("checkout.jsp");

			} else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConnection());

				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				Random r = new Random();



				for (Cart c : blist) {
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-" + r.nextInt(10000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					o.setOrderDate(currentDateTimeString);
					o.setPlaceDate(futureDateTimeString);
					orderList.add(o);

				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {

					boolean f = dao2.saveOrder(orderList);
				User u = (User) session.getAttribute("user");
					List<Cart> book = dao.getBookByUser(u.getId());
					for(Cart c : book){
						int bid = c.getBid();
						StockUpdate ST = new StockUpdate();
                        ST.updateStock(bid);
					}
					if (f) {

						resp.sendRedirect("order_success.jsp");

					} else {

						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
