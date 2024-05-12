<%@page import="com.user.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.user.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting: Old Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div id="wrapper">
		<div class="container col-md-10 p-3">
			<h3 class="text-center text-primary mb-4">Your Book</h3>

			<c:if test="${not empty succMsg }">
				<div classs="alert alert-success text-center">
					${succMsg }
				</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<c:if test="${not empty failedMsg }">
				<div class="alert alert-danger" role="alert">${failedMsg }</div>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<table class="table table-striped mt-3">
				<thead class="bg-primary text-white">
					<tr>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Category</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>

					<%
					User u = (User) session.getAttribute("userobj");
					String email = u.getEmail();
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
					List<BookDtls> list = dao.getBookByOld(email, "Old");

					for (BookDtls b : list) {
					%>

					<tr>
						<th><%=b.getBookName()%></th>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getBookCategory()%></td>
						<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId() %>"
							class="btn btn-sm btn-danger ">Delete</a></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>
		<div style="margin-top: 13px">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>
</body>
</html>