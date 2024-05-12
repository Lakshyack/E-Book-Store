<%@page import="com.user.entity.User"%>
<%@page import="com.user.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<%@include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="all_component/style.css">

<style type="text/css">
.book-card {
	width: 150px;
	height: 220px;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	BookDtls b = dao.getBookById(bid);
	%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div id="wrapper">
		<div class="container-fluid p-3 bg-white">
			<div class="row">
				<div class="col-md-6 text-center p-5 border">

					<img src="books/<%=b.getPhotoName()%>" class="book-card"><br>
					<h4 class="mt-3">
						Book Name: <span class="text-primary"><%=b.getBookName()%></span>
					</h4>
					<h4>
						Author Name: <span class="text-primary"><%=b.getAuthor()%></span>
					</h4>
					<h4>
						Category: <span class="text-primary"><%=b.getBookCategory()%></span>
					</h4>
				</div>

				<div class="col-md-6 text-center p-5 border bg-white">
					<h2><%=b.getBookName()%></h2>

					<%
					if ("Old".equals(b.getBookCategory())) {
					%>
					<h5 class="text-secondary">
						<i class="fa-solid fa-envelope-circle-check "></i> Contact To
						Seller
					</h5>
					<h5 class="text-secondary">
						Email:
						<%=b.getEmail()%></h5>
					<%
					}
					%>

					<div class="row mt-3">
						<div class="col-md-4 text-primary text-center p-2">
							<i class="fa-solid fa-money-bill-wave fa-2x"></i>
							<p>Cash On Delivery</p>
						</div>
						<div class="col-md-4 text-primary text-center p-2">
							<i class="fa-solid fa-rotate-left fa-2x"></i>
							<p>Return Available</p>
						</div>
						<div class="col-md-4 text-primary text-center p-2">
							<i class="fa-solid fa-truck-moving fa-2x"></i>
							<p>Free Shipping</p>
						</div>

					</div>

					<%
					if ("Old".equals(b.getBookCategory())) {
					%>
					<div class=" text-center p-3">
						<a href="index.jsp" class="btn btn-primary"><i
							class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a href=""
							class="btn btn-danger"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
					<%
					} else {
					%>
					<div class=" text-center p-3">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger"><i
							class="fa-solid fa-cart-shopping"></i> Add Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
							class="btn btn-primary"><i
							class="fa-solid fa-cart-shopping"></i> Add Cart</a>
						<%
						}
						%>
						 <a href=""
							class="btn btn-danger"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>