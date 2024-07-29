<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
a{
text-decoration:none;
color:black;
}

a.hover{
	text-decoration: none;
	color:black;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>


<div class="container">
<div class="row p-5">
	<div class="col-md-3">
	<a href="Add_pizza.jsp">
	<div class="card">
		<div class="ard-body text-center">
			<i class="fa-solid fa-square-plus fa-5x text-primary"></i><br>
			<h4>Add Pizza</h4>
				
		</div>
		</div>
		
	   </a>
	</div>
	
<div class="col-md-3">
<a href="all_pizza.jsp">
	<div class="card">
		<div class="ard-body text-center">
			<i class="fa-solid fa-pizza-slice fa-5x text-danger"></i><br>
			<h4>All Pizza</h4>
				
		</div>
	</div>
	</a>
	</div>

<div class="col-md-3">
	<a href="All_order.jsp">

	<div class="card">
		<div class="ard-body text-center">
			<i class="fa-solid fa-box fa-5x text-warning"></i><br>
			<h4>Order Pizza</h4>
			
		</div>
	</div>
	</a>
	</div>
	
<div class="col-md-3">

	<div class="card">
	<a href="../LogoutServlet">
	<div class="card">
		<div class="ard-body text-center">
			<i class="fa-solid fa-right-from-bracket fa-5x text-primary"></i><br>
			<h4>Logout</h4>
			
		</div>
	</div>
	</a>
	</div>

</div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br>

<%@include file="all_component/footer.jsp" %>
</body>
</html>





