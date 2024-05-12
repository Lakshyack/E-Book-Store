<%@page import="com.DB.DBConnect"%>
<%@page import="com.user.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="all_component/style.css">

<style type="text/css">

.book-card {
	width: 150px;
	height: 220px;
}

.crd-ho:hover {
	background-color: rgb(217, 217, 217);
	transform: scale(1.05);
	filter: drop-shodow(30px 10px 4px #333);
	transition: all 0.3s ease-in;
}
</style>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div id="wrapper">
		<div class="container-fluid">
			<div class="row">
				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConnection());
				List<BookDtls> list3 = dao3.getAllOldBook();
				for (BookDtls b : list3) {
				%>
				<div class="col-md-3 mt-5 mb-2">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" class="book-card" src="books/<%=b.getPhotoName()%>"
								class="img-thumblin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>Category: <%=b.getBookCategory()%></p>
							<div class="row">
								<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-4"><%=b.getPrice()%>
									<i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>

						</div>

					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>