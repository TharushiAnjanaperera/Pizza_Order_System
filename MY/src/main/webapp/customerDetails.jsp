<%@ page import="com.DAO.PizzaDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.PizzaDetails"%>
<%@ page import="com.uniquedeveloper.registration.databaseUtil" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f3f7">
<div class="container-fuild p-3">
  <div class="row">
  <div class="col-md-3">
  <h3><i class="fa-solid fa-pizza-slice"></i> Ymmy Pizza</h3>
  
  </div>
 
  <div class="col-md-4">
  <a href="LogoutServlet" class="btn btn-success"><i class="fa-solid fa-arrow-right-to-bracket"></i> Logout</a>
  
 
  </div>
  
  
  
  </div>



</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
        </li>
      </ul>
      </div>
  </div>
</nav>

<div class="container p-2">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
				
				<h4 class="text-center">Order Details</h4>
                   
				
					<form action="customerDservlet" method="post">
					
					<div class="form-group">
							<label for="exampleInputName">Enter Full Name</label>
							<input type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" name="name">
					</div><br>
					<div class="form-group">
							<label for="exampleInputEmail">Email Address</label>
							<input type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" name="email">
					</div><br>
					<div class="form-group">
							<label for="exampleInputPhoneNumer">Phone Number</label>
							<input type="text" class="form-control" id="exampleInputPhoneNumer" aria-describedby="emailHelp" name="phonenumber">
					</div><br>
					<div class="form-group">
							<label for="exampleInputPassword1">Address</label>
							<input type="text" class="form-control" id="exampleInputaddress" name="address">
					
					</div><br>
					<div class="form-group">
                            <label for="inputpizzaname">Pizza Name</label>
                            <select id="inputpizzaname" name="Pizzaname" class="form-control">
                                <option selected>--select--</option>
                                <option value="Cheese Pizza large 2">Cheese Pizza large 2</option>
                                <option value="kochchi pizza 1">kochchi pizza 1</option>
                                 <option value="veg Pizza 1">veg Pizza 1</option>
                                <option value="Burger Pizza">Burger Pizza</option>
                                <option value="Chocolate Pizza">Chocolate Pizza</option>
                                <option value="chicken Pizza">chicken Pizza</option>
                                
                                
                            </select>
                        </div><br>
					<div class="form-group">
                            <label for="exampleInputPassword1">Price</label>
                            <input type="number" class="form-control" name="price" id="exampleInputPassword1">
                        </div><br>
                        
					<div class="form-group">
                            <label for="inputcategory">Category</label>
                            <select id="inputcategory" name="category" class="form-control">
                                <option selected>--select--</option>
                                <option value="Neapolitan Pizza">Neapolitan Pizza</option>
                                <option value="Sicilian Pizza">Sicilian Pizza</option>
                                 <option value="Chicago Pizza">Chicago Pizza</option>
                            </select>
                        </div><br>
					
					 <div class="form-group">
                            <label for="inputpayment">Payment Method</label>
                            <select id="inputpayment" name="paymentmethod" class="form-control">
                                <option selected>--select--</option>
                                <option value="Card Payment">Card Payment</option>
                                <option value="Cash on delivery">Cash on delivery</option>
                            </select>
                        </div><br>
					
					<button type="submit" class="btn btn-primary">Check Out</button>
					
					</form>
				
			</div>
			</div>
		
		</div>
	</div>
	
</div>

</div>

</body>
</html>