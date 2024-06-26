<%@page import="java.util.List"%>
<%@page import="com.user.entity.Cart"%>
<%@page import="com.user.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div id="wrapper">
		<div class="container-fluid">
			<div class="row p-5">
				<div class="col-md-6">
					<div class="card bg-white">
						<div class="card-body">
							<h3 class="text-center text-primary">Your Selected Item</h3>
							<table class="table table-striped">
								<thead class="bg-primary text-white">
									<tr>
										<th scope="col">Book Name</th>
										<th scope="col">Author</th>
										<th scope="col">Price</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>

									<%
									try {
										User u = (User) session.getAttribute("userobj");
										CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
										List<Cart> cart = dao.getBookByUser(u.getId());
										Double totalPrice = 0.00;
										for (Cart c : cart) {
											totalPrice += c.getTotalPrice();  // Sum up the total prices
									%>
									<tr>
										<th scope="row"><%= c.getBookName() %></th>
										<td><%= c.getAuthor() %></td>
										<td><%= c.getPrice() %></td>
										<!--  -->
										<td><a href="remove_book?bid=<%= c.getBid() %>&uid=<%= c.getUserId() %>&cid=<%= c.getCid() %>" class="btn btn-sm btn-danger">Remove</a></td>
									</tr>
									<%
										}
									%>
									<tr>
										<td><b>Total Price</b></td>
										<td></td>
										<td><b><%= totalPrice %></b></td>
										<td></td>
									</tr>
									<%
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h3 class="text-center text-primary">Your Details For Order</h3>
							<form action="order" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Name</label> <input type="text"
											class="form-control" id="inputEmail4" value="${userobj.name }" name="username" required="required">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">Email</label> <input type="email"
											class="form-control" id="inputPassword4" value="${userobj.email }" name="email" required="required">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Phone Number</label> <input
											type="number" class="form-control" id="inputEmail4" value="${userobj.phno }" name="phno" required="required">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">Address</label> <input type="text"
											class="form-control" id="inputPassword4" name="address" required="required">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Landmark</label> <input type="text"
											class="form-control" id="inputEmail4" name="landmark" required="required">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">City</label> <input type="text"
											class="form-control" id="inputPassword4" name="city" required="required">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">State</label> <input type="text"
											class="form-control" id="inputEmail4" name="state" required="required">
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">Pincode</label> <input
											type="number" class="form-control" id="inputPassword4" name="pincode" required="required">
									</div>
								</div>
								<div class="form-group">
									<label>Payment Mode</label> <select class="form-control" name="payment">
										<option value="noselect">--Select--</option>
										<option value="COD">Cash On Delivery</option>
									</select>
								</div>
								<div class="text-center">
									<%
									try {
										User u = (User) session.getAttribute("userobj");
										CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
									
												session.setAttribute("user",u);
									
												
											} catch (Exception e) {
												e.printStackTrace();
											}
										
										
									%>
										
									<button class="btn btn-warning">Order Now</button>
									<a href="index.jsp" class="btn btn-success">Continue
										Shopping</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>