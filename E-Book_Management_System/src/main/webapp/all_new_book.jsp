<%@page import="com.user.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.user.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
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

/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>

</head>
<body>

	<c:if test="${not empty addCart }">
		<div id="toast">${addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>
		<c:remove var="addCart" scope="session"/>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div id="wrapper">
		<div class="container-fluid">
			<div class="row">
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
				List<BookDtls> list = dao.getAllNewBook();
				for (BookDtls b : list) {
				%>
				<div class="col-md-3 mt-5 mb-2">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" class="book-card" src="books/<%=b.getPhotoName()%>"
								class="img-thumblin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
								Category:
								<%=b.getBookCategory()%></p>
							<div class="row">
							<%
								if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<%
								} else {
								%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-5"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<%
								}
								%>
								<a
									href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-2"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%> </a>
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