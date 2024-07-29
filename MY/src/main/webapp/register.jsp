<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>

<body style="background-color:#f0f3f7">
<%@include file="all_component/navbar.jsp" %>

<br>

<div class="container p-2">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
				
				<h4 class="text-center">Registration Here</h4>
				
				
				
					<form action="RegisterServlet" method="post">
					
					<div class="form-group">
							<label for="exampleInputName">Enter Full Name</label>
							<input type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" name="fname">
					</div><br>
					<div class="form-group">
							<label for="exampleInputEmail">Email Address</label>
							<input type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" name="email">
					</div><br>
					<div class="form-group">
							<label for="exampleInputPhoneNumer">Phone Number</label>
							<input type="text" class="form-control" id="exampleInputPhoneNumer" aria-describedby="emailHelp" name="phno">
					</div><br>
					<div class="form-group">
							<label for="exampleInputPassword1">Password</label>
							<input type="password" class="form-control" id="exampleInputPassword1" name="password">
					</div><br>
					<div class="form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
					<lable class="form-check-lable" for="exampleCheck1" >Agree & Conditions </lable><br>
					
					
					</div><br>
					
					<button type="submit" class="btn btn-primary">Register</button>
					<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</form>
				
			</div>
		
		</div>
	</div>
	
</div>

</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>