<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Cart"%>
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
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="all_Neapolitan_Pizza.jsp">Neapolitan Pizza</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="all_Chicago_Pizza.jsp">Chicago Pizza</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="all_Sicilian_Pizza.jsp">Sicilian Pizza</a>
        </li>
        
      </ul>
      
    
    </div>
  </div>
</nav>

<div class="container">
<div class="d-flex py-3"><h3>All Cart Item</h3></div>

<table class="table table-striped table-hover">
  <thead class="bg-primary" >
    <tr>
       <th scope="col">Pizza ID</th>
      <th scope="col">Pizza Name</th>
      <th scope="col">Price</th>
      <th scope="col">BuyNow</th>
      <th scope="col">Cancel</th>
      
    </tr>
  </thead>
  <tbody>
    <%
  CartDAOImpl dao = new CartDAOImpl(databaseUtil.getConnection());
  List<Cart> list = dao.getAllCartPizza();
  Double totalprice= 0.00;
  for (Cart c : list){
	  totalprice=c.getTotalPrice();
	  %>
	    <tr>
      <td><%=c.getpid() %></td>
      <td><%=c.getPizzaname()%></td>
      <td><%=c.getPrice()%></td>
      
      
     <td>
     
      <a href="customerDetails.jsp" class="btn btn-sm btn-primary"><i class="fa-solid fa-money-bill"></i> Buy</a>
     
      </td>
      <td>
       <a href="Remove?pid=<%= c.getpid() %>" class="btn btn-sm btn-danger"><i class="fa-sharp fa-solid fa-trash"></i> Remove</a>
      
      </td>
      </tr>
	  
	  <%
  }
	  %>
  <tr>
  <td><b>Total Price</b></td>
  <td></td>
  
  <td><b><%=totalprice%><b></b></td>
  <td></td>
  </tr>
  
  </tbody>
</table>

</div>


</body>
</html>