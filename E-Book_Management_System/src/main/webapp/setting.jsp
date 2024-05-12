<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Setting Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div id="wrapper">
		<div class="container ">
				<h3 class="text-center p-4 text-primary font-italic">Hello , ${userobj.name }</h3>
			<div class="row p-3">
				<div class="col-md-4">
					<a href="sell_book.jsp">
						<div class="card">
							<div class="card-body text-center mb-4">
								<div class="text-primary">
									<i class="fa-solid fa-book-open fa-3x"></i>
								</div>
								<h4 class="mt-3 mb-2">Sell Old Book</h4>
							</div>
						</div>
					</a>
				</div>
				
				<div class="col-md-4">
					<a href="old_book.jsp">
						<div class="card ">
							<div class="card-body text-center mb-4" >
								<div class="text-primary">
									<i class="fa-solid fa-book fa-3x"></i>
								</div>
								<h4 class="mt-3 mb-2"> Old Book</h4>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-4">
					<a href="edit_profile.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-primary">
									<i class="fa-solid fa-address-card fa-3x"></i>
								</div>
								<h4>Login & Security</h4>
								<p>Edit Profile</p>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-6 mt-3">
					<a href="order.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-danger">
									<i class="fa-solid fa-box-open fa-3x"></i>
								</div>
								<h4>My Order</h4>
								<p>Track Your Order</p>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-6 mt-3">
					<a href="helpline.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-primary">
									<i class="fa-solid fa-user-circle fa-3x"></i>
								</div>
								<h4>Help Center</h4>
								<p>24*7 Service</p>
							</div>
						</div>
					</a>
				</div>

			</div>
		</div>
		<div style="margin-top: 81px">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>
</body>
</html>