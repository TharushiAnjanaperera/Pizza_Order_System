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
				
				<h4 class="text-center">Login Here</h4>
			
					<form action="LoginServlet" method="post">
					
					<div class="form-group">
							<label for="exampleInputEmail">Enter Email</label>
							<input type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" name="email">
					</div><br>
					
					<div class="form-group">
							<label for="exampleInputPassword1">Password</label>
							<input type="password" class="form-control" id="exampleInputPassword1" name="password" >
					</div><br>
					<div class="form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1">
					<lable class="form-check-lable" for="exampleCheck1" >Remember me</lable><br>
					
					
					</div><br>
					
					<button type="submit" class="btn btn-primary">Login</button>
					<a href="register.jsp" class="signup-image-link">I have not
							Account</a>
					</form>
				 
			
			</div>
		
		</div>
	</div>
	
</div>

</div><br><br><br><br><br><br><br>
<%@include file="all_component/footer.jsp" %>
</body>
</html>