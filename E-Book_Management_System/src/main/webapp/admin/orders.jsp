<%@page import="com.user.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.user.entity.User"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div id="wrapper">
		<div class="container-fluid ">
			<h3 class="text-center text-primary ">Hello Admin</h3>
			<table class="table table-striped">
				<thead class="bg-primary text-white">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Phone no.</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">PaymentType</th>
					</tr>
				</thead>
				<tbody>

					<%
					User u = (User) session.getAttribute("userobj");
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
					List<Book_Order> blist = dao.getAllBook();

					for (Book_Order b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId()%></th>
						<td><%=b.getUserName()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getFulladd()%></td>
						<td><%=b.getPhno()%></td>
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
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>