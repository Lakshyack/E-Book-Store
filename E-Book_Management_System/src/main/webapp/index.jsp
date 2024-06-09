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
<title>E-book</title>
<%@include file="all_component/allCss.jsp"%>
<link rel="stylesheet" href="all_component/style.css">
<style type="text/css">
.back-img {
	background: url("img/book2.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

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
/* Basic styling for dropdown button */
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 6px;
    font-size: 14px;
    border-radius: 8px;
    cursor: pointer;
}

.dropbtn>a {
   text-decoration: none;
}

/* Container needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
	border-radius: 10px;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
	border-radius: 10px;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
	border-radius: 10px;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    background-color: #f1f1f1;
	border-radius: 10px;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
	border-radius: 10px;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
	/* border: 2px solid rgb(255, 255, 255); */
	border-radius: 10px;
}

</style>
</head>
<body>


	<%
	User u = (User) session.getAttribute("userobj");
	Admin A = (Admin) session.getAttribute("Adminobj");
	
	%>
	<% session.setAttribute("userobj", u);%>
	<% session.setAttribute("Adminobj", A);%>
	<div class="container-fluid"
	style="height: 10px; background-color: rgb(6, 28, 215);"></div>

<div class="container-fluid p-3 bglight">

	<div class="row">

		<div class="col-md-3 text-info">
			<h3>
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>

		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		<c:if test="${not empty Adminobj }">
			<div class="col-md-2" style="position: relative;right: 0;">
			
				<a href="admin/home.jsp" class="btn btn-success" >
					<!-- <i class="fa-solid fa-user"></i> -->
					<img src="AdminProfile/<%= A.getProfile() %>" class="img-fluid "
					style="border-radius: 50%; height: 20px; width: 20px; border: 0.5px solid black;"
					alt="">
					 ${Adminobj.name }</a> 
			</div>
		</c:if>

		<c:if test="${not empty userobj }">
			<div class="col-md-3">


				<div class="dropdown">
					<button class="dropbtn btn btn-success" > 	
							<!-- <i class="fa-solid fa-user"></i> -->
							<img src="UserProfile/<%= u.getProfile() %>" class="img-fluid "
							style="border-radius: 50%; height: 20px; width: 20px; border: 0.5px solid black;"
							alt="">
							 ${userobj.name}</button>
					<div class="dropdown-content">
						<a href="" class="btn" data-toggle="modal" data-target="#profile-modal">
							<!-- <i class="fa-solid fa-user"></i> -->
							<img src="UserProfile/<%= u.getProfile() %>" class="img-fluid "
							style="border-radius: 50%; height: 20px; width: 20px; border: 0.5px solid black;"
							alt="">
							 Profile Center</a> 
							 <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
								<i class="fa-solid fa-gear"></i> User Menu
							</a>

						
						<a href="checkout.jsp" class="btn"><i class="fa-solid fa-cart-plus"></i> Cart</a>
					
							
						
					
					</div>
				</div>




				<!-- <a href="checkout.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-cart-plus"></i> Cart</a> -->
			
					
				<a href="logout" class="btn btn-primary text-white"><i class="fa-solid fa-right-to-bracket "></i> Logout</a>
			</div>
		</c:if>


<!-- for user -->

		<c:if test="${not empty userobj }">
		
			
		
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
	   <div class="modal-body">
		 <div class="container text-center">

		   <img src="UserProfile/<%= u.getProfile() %>" class="img-fluid "
			 style="border-radius: 50%; height: 150px; width: 150px; border: 2px solid black;"
			 alt="">

		   <h5 class="modal-title mt-3" id="exampleModalLabel">
			 <%= u.getName() %>
		   </h5>

		   <!-- details of user -->

		   <div id="Profile-Details">
			 <table class="table">
			   <tbody>
				 <tr>
				   <th scope="row">ID :</th>
				   <td>
					 <%= u.getId() %>
				   </td>

				 </tr>
				 <tr>
				   <th scope="row">Eamil Address</th>
				   <td>
					 <%= u.getEmail() %>
				   </td>

				 </tr>
				</tbody>
			 </table>
		   </div>
	

		   <!-- End details of user -->



                              <!-- edit user details -->

                              <div id="profile-edit" style="display: none;">

                                <h3>Please edit Carefully!</h3>
                                <form action="update_profile" method="post" enctype="multipart/form-data">
                                  <table class="table">
                                    <tbody>
                                      <!-- <tr>
                                        <th scope="row">ID :</th> -->
                                        <!-- <td> -->
											<input type="hidden" value=" <%= u.getId() %>" name="id">
											<% session.setAttribute("user_id", u.getId());%>
											<% session.setAttribute("USpass", u.getPassword());%>
											<% session.setAttribute("u", u);%>
                                        
                                        <!-- </td> -->


										
                                      <!-- </tr> -->

                                      <tr>
                                        <th scope="row">Name</th>
                                        <td><input type="text" class="form-control" name="user_name"
                                            value="<%= u.getName() %>"></td>

                                      </tr>
                                      <tr>
                                        <th scope="row">Eamil Address</th>
                                        <td><input type="email" class="form-control" name="email"
                                            value="<%= u.getEmail() %>"></td>
                                      </tr>
									  <tr>
                                        <th scope="row">Phone Number</th>
                                        <td><input type="text" class="form-control" name="phno"
                                            value="<%= u.getPhno() %>"></td>
                                      </tr>

                                      <!--Gender not for edit -->
                                   

                                      <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="password" class="form-control" name="password"
                                            value="<%= u.getPassword() %>"></td>
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




		</c:if>
		
		<c:if test="${empty Adminobj && empty userobj }">
 	
	
			<div class="col-md-3">
				<div class="dropdown">
					<button class="dropbtn btn btn-success" ><i
						class="fa-solid fa-right-to-bracket"></i> Login</button>
					<div class="dropdown-content">
						<a href="login.jsp" ><i
						
							class="fa-solid fa-right-to-bracket"></i> User Login</a> 
						<a href="adminLogin.jsp" ><i
							class="fa-solid fa-right-to-bracket"></i> Admin Login</a> 
					
					</div>
				</div>
				<a href="register.jsp"
					class="btn btn-primary text-white"><i
					class="fa-solid fa-user-plus "></i>Create Account</a>
			</div>
		</c:if>
		
		
	</div>

</div>

<%@include file="all_component/navbar.jsp"%>



	<div id="wrapper">

		<div class="container-fluid back-img ">
			<h1 class="text-center text-dark font-italic">
				<i class="fa-solid fa-book mt-4"></i> E-Book Management System
			</h1>
		</div>


		<!--Start Recent Book -->
		<hr>
		<div class="container-fluid">
			<h3 class="text-center mb-5 mt-3">Recent Book</h3>
			<div class="row">
				<%
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
				List<BookDtls> list2 = dao2.getRecentBook();
				for (BookDtls b : list2) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" class="book-card" src="books/<%=b.getPhotoName()%>"
								class="img-thumblin">
							<p><%=b.getBookName()%></p>
							<p><%=b.getAuthor()%></p>
							<p>

								<%
								if (b.getBookCategory().equals("Old")) {
								%>
								Category:
								<%=b.getBookCategory()%>
							<div class="row">
								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-4"> <i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
							</div>
							<%
							} else {
							%>
							Category:
							<%=b.getBookCategory()%>
							<div class="row">

								<%
								if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<%
								} else {
								%>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-danger btn-sm ml-5"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<%
								}
								%>
								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-2">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-2"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%> </a>
							</div>
							<%
							}
							%>
							</p>

						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>









			<div class="text-center mt-4">
				<a href="all_recent_book.jsp" class="btn btn-danger btn-sm">View
					All</a>
			</div>
		</div>
		<!--Recent Book -->
		<hr>

		<!--Start New Book -->
		<hr>
		<div class="container-fluid">
			<h3 class="text-center mb-5 mt-3">New Book</h3>
			<div class="row">
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
				List<BookDtls> list = dao.getNewBook();
				for (BookDtls b : list) {
				%>
				<div class="col-md-3">
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
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
									class="btn btn-danger btn-sm ml-5"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a>
								<%
								}
								%>
								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
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
			<div class="text-center mt-4">
				<a href="all_new_book.jsp" class="btn btn-danger btn-sm">View
					All</a>
			</div>
		</div>
		<!--End New Book -->
		<hr>
		<!--Start Old Book -->
		<div class="container-fluid">
			<h3 class="text-center mb-5 mt-3">Old Book</h3>
			<div class="row">

				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConnection());
				List<BookDtls> list3 = dao3.getOldBook();
				for (BookDtls b : list3) {
				%>
				<div class="col-md-3">
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
								<a href="view_book.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-4"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%> </a>
							</div>

						</div>

					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt-4 mb-0">
				<a href="all_old_book.jsp" class="btn btn-danger btn-sm">View
					All</a>
			</div>
			<hr>
			<!--End Old Book -->
		</div>
		<%@include file="all_component/footer.jsp"%>
	</div>




	<script
	src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/script.js" type="text/javascript"></script>


	<script>
	  $(document).ready(function () {
		//For toggle 
		let editStatus = false;

		$('#edit-btn').click(function () {
		  if (editStatus == false) {
			$('#Profile-Details').hide();
			$('#profile-edit').show();
			$('#edit-btn').html("back")
			editStatus = true;
		  }
		  else {
			$('#Profile-Details').show();
			$('#profile-edit').hide();
			editStatus = false;

		  }
		})
	  });
	</script>

</body>
</html>