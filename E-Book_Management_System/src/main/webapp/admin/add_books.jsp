<%@page import="com.user.entity.User"%>
<%@page import="com.user.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.user.entity.Admin"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userobj");
	Admin admin = (Admin) session.getAttribute("Adminobj");
	%>
	<% session.setAttribute("userobj", user);%>
	<% session.setAttribute("Adminobj", admin);%>
	
	<c:if test="${empty userobj && empty Adminobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div id="wrapper">
		<div class="contaier p-3">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Add Books</h4>
							
							<c:if test="${not empty succMsg }">
							
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
							</c:if>
							
							<c:if test="${not empty failedMsg }">
							
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
							</c:if>
							
							
							<form  name="addbook" action="../add_books" method="post" enctype="multipart/form-data">

								<div class="form-group">
									<label for="exampleInputEmail1">Book Name*</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="bname">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Author Name*</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="author">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Price*</label> <input
										type="number" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="price">
								</div>

								
								<div class="form-group">
									<label for="exampleInputEmail1">Stock</label> <input
										type="number" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="stock">
								</div>

								<div class="form-group">
									<label for="inputState">Book Categories</label> <select
										class="form-control" id="inputState" name="category">
										<option selected>Select</option>
										<option value="New">New Book</option>
										<option value="Old">Old Book</option>
									</select>
								</div>

								<div class="form-group">
									<label for="inputState">Book Status</label> <select
										class="form-control" id="inputState" name="bstatus">
										<option selected>Select</option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
								<div class="form-group">
									<label for="exampleFormControlFile1">Upload Photo</label>
									<input type="file" class="form-control-file" name="bimg"
										id="exampleFormControlFile1">
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>