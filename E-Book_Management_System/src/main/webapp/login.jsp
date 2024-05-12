<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook:Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div id="wrapper">
		<div class="container p-3 ">
			<div class="row mt-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Login</h4>

							<c:if test="${not empty failedMsg }">
								<h5 class="text-center text-danger">${failedMsg}</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>

							<c:if test="${not empty succMsg }">
								<h5 class="text-center text-success">${succMsg}</h5>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<form name="login" action="login.ik" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="email"
										placeholder="Enter email" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" name="password"
										placeholder="Password" required="required">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
									<br> <a href="register.jsp">Create Account</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 120px">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>
</body>
</html>