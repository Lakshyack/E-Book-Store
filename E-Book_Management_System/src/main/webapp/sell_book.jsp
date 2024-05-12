<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div id="wrapper">
		<div class="container p-3">
			<div class="row mt-2">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center text-primary mb-3">Sell Old Books</h4>
							
							<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
							</c:if>
							
							<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
							</c:if>
							
							<form   action="add_old_book" method="post" enctype="multipart/form-data">

								<input type="hidden" value="${userobj.email }" name="user">
								
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
									<label for="exampleFormControlFile1">Upload Photo</label>
									<input type="file" class="form-control-file" name="bimg"
										id="exampleFormControlFile1">
								</div>
								<div class="text-center"><button type="submit" class="btn btn-primary">Sell Book</button></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 13px">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>
</body>
</html>