<%@page import="com.user.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.user.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Order</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div id="wrapper">
		<div class="container col-md-11 p-3">
			<h3 class="text-center text-primary mb-4">Your Order</h3>
			<table class="table table-striped mt-3">
				<thead class="bg-primary text-white">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Mode</th>
					</tr>
				</thead>
				<tbody>
					<%
					User u = (User) session.getAttribute("userobj");
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
					List<Book_Order> blist = dao.getBook(u.getEmail());

					for (Book_Order b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId()%></th>
						<td><%=b.getUserName()%></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
			<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>