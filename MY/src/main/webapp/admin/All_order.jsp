<%@ page import="com.DAO.PizzaDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.orderDetails"%>
<%@ page import="com.uniquedeveloper.registration.databaseUtil" %>

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
<%@include file="all_component/navbar.jsp" %><br>
<h3 class="text-center">All Orders...</h3>

<table class="table table-striped table-hover">
  <thead class="bg-primary" >
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">PhoneNumber</th>
      <th scope="col">Pizza Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  <%
  PizzaDAOImpl dao = new PizzaDAOImpl(databaseUtil.getConnection());
  List<orderDetails> list3 = dao.getAllorder();
  for (orderDetails b : list3){
	  %>
	    <tr>
      			<td><%= b.getCid() %></td>
                <td><%= b.getName() %></td>
                <td><%= b.getEmail() %></td>
                <td><%= b.getAddress() %></td>
                <td><%= b.getPhonenumber() %></td>
                <td><%= b.getPizzaname() %></td>
                <td><%= b.getCategory() %></td>
                <td><%= b.getPrice() %></td>
                <td><%= b.getPaymentmethod() %></td>
  
      </tr>
	  
	  <%
  }
	  %>
  
  
   
  </tbody>
</table>
</body>
</html>