<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div id="wrapper">
		<div class="container p-5">
			<div class="row mt-3">
				<div class="col-md-9 offset-md-2">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center text-primary mb-3">Add Address</h4>
							<form action="">

								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputPassword4">Address</label> <input type="text"
											class="form-control" id="inputPassword4">
									</div>

									<div class="form-group col-md-6 ">
										<label for="inputPassword4">Landmark</label> <input
											type="text" class="form-control" id="inputPassword4">
									</div>

								</div>

								<div class="form-row">

									<div class="form-group col-md-4">
										<label for="inputEmail4">City</label> <input type="text"
											class="form-control" id="inputEmail4">
									</div>
									<div class="form-group col-md-4">
										<label for="inputPassword4">State</label> <input type="text"
											class="form-control" id="inputPassword4">
									</div>
									<div class="form-group col-md-4">
										<label for="inputPassword4">Pincode</label> <input type="text"
											class="form-control" id="inputPassword4">
									</div>

								</div>
								
								<div class="text-center mt-3 mb-3">
									<button type="submit" class="btn btn-warning text-white">Add Address</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 72px">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>
</body>
</html>