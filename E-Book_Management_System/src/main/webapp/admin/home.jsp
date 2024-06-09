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
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%
	User user = (User) session.getAttribute("userobj");
	Admin admin = (Admin) session.getAttribute("Adminobj");
	%>
	<% session.setAttribute("userobj", user);%>
	<% session.setAttribute("Adminobj", admin);%>
	<c:if test="${empty userobj && empty Adminobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container-fluid"
	style="height: 10px; background-color: rgb(6, 28, 215);"></div>

<div class="container-fluid p-3 bglight">

	<div class="row">

		<div class="col-md-3 text-info">
			<h3>
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>
		
		</div>
	</div>

</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="../index.jsp">Home
					<span class="sr-only">(current)</span>
			</a>
			</li>	
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Admin Home
				<span class="sr-only">(current)</span>
		</a>
		</li>		
	</div>



	
			<div class="col-md-2">
				<a href="" class="btn btn-success" data-toggle="modal" data-target="#profile-modal">
					<!-- <i class="fa-solid fa-user"></i> -->
					<img src="../AdminProfile/<%= admin.getProfile() %>" class="img-fluid "
					style="border-radius: 50%; height: 20px; width: 20px; border: 0.5px solid black;"
					alt="">
					<%= admin.getName() %></a> 

			</div>
		

			
			<!-- modal start -->
   <!-- Modal -->
   <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
   aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
	 <div class="modal-content">
	   <div class="modal-header primary-background text-white text-center">
		 <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
		 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		   <span aria-hidden="true">&times;</span>
		 </button>
	   </div>

	   <!-- modal starttttt -->

	   <div class="modal-body">
		 <div class="container text-center">

		   <img src="../AdminProfile/<%= admin.getProfile() %>" class="img-fluid "
			 style="border-radius: 50%; height: 150px; width: 150px; border: 2px solid black;"
			 alt="">

		   <h5 class="modal-title mt-3" id="exampleModalLabel">
			 <%= admin.getName() %>
		   </h5>

		   <!-- details of user -->

		   <div id="Profile-Details">
			 <table class="table">
			   <tbody>
				 <tr>
				   <th scope="row">ID :</th>
				   <td>
					 <%= admin.getId() %>
				   </td>

				 </tr>
				 <tr>
				   <th scope="row">Eamil Address</th>
				   <td>
					 <%= admin.getEmail() %>
				   </td>

				 </tr>
				</tbody>
			 </table>
		   </div>
	

		   <!-- End details of user -->



                              <!-- edit user details -->

                              <div id="profile-edit" style="display: none;">

                                <h3>Please edit Carefully!</h3>
                                <form action="AdminUpdate" method="post" enctype="multipart/form-data">
                                  <table class="table">
                                    <tbody>
                                      <!-- <tr>
                                        <th scope="row">ID :</th> -->
                                        <!-- <td> -->
											<input type="hidden" value=" <%= admin.getId() %>" name="id">
											<% session.setAttribute("Admin_id", admin.getId());%>
											<% session.setAttribute("Adpass", admin.getPassword());%>
											<% session.setAttribute("A", admin);%>
                                        
                                        <!-- </td> -->


										
                                      <!-- </tr> -->

                                      <tr>
                                        <th scope="row">Name</th>
                                        <td><input type="text" class="form-control" name="user_name"
                                            value="<%= admin.getName() %>"></td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Eamil Address</th>
                                        <td><input type="email" class="form-control" name="email"
                                            value="<%= admin.getEmail() %>"></td>
                                      </tr>
									 

                                      <!--Gender not for edit -->
                                   

                                      <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="password" class="form-control" name="password"
                                            value="<%= admin.getPassword() %>"></td>
                                      </tr>

                                      
                                      <tr>
                                        <th scope="row">New Profile</th>
                                        <td><input type="file" name="file" class="form-control-file"></td>
                                      </tr>
                                    </tbody>
                                  </table>

                                  <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save </button>
                                  </div>
                                </form>
                              </div>
                              <!-- End edit user details-->
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
                          </div>
                        </div>
                      </div>
                    </div>
				</nav>	

<%@include file="js.jsp"%>
	
	<div class="con" style="height: 40px; background-color: #f2f2f2; border: none;">
		<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	
			</li>
		</ul>
		
	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	</div>


	<div id="wrapper">

		<div class="container-fluid">
			<div class="row p-5">
				<div class="col-md-3">
					<a href="add_books.jsp">
						<div class="card">
							<div class="card-body text-center">
								<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
								<h4>Add Books</h4>
								--------------------
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="all_books.jsp">
						<div class="card">
							<div class="card-body text-center">
								<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
								<h4>All Books</h4>
								--------------------
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="orders.jsp">
						<div class="card">
							<div class="card-body text-center ">
								<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
								<h4>Orders</h4>
								--------------------
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a data-toggle="modal" data-target="#exampleModalCenter">
						<div class="card">
							<div class="card-body text-center">
								<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
								<h4>Logout</h4>
								--------------------
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>

		<!-- Logout -->
		<!-- Logout Model -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h4>Do You Want To Logout</h4>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<a href="../logout" type="button"
								class="btn btn-primary text-white">Logout</a>
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>

<!-- Logout -->
<!-- Logout Model -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You Want To Logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a  href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>




		<div style="margin-top: 265px">
			<%@include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>