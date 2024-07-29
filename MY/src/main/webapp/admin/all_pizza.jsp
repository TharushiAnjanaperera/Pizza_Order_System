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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f3f7">
<%@include file="all_component/navbar.jsp" %>
<h2 class="text-center">Hello Admin...</h2>

<table class="table table-striped table-hover">
  <thead class="bg-primary" >
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">PizzaName</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  PizzaDAOImpl dao = new PizzaDAOImpl(databaseUtil.getConnection());
  List<PizzaDetails> list = dao.getAllPizza();
  for (PizzaDetails b : list){
	  %>
	    <tr>
      <td><%=b.getPizzaId() %></td>
      <td><img src="<%= request.getContextPath() %>/image/<%= b.getPhotoName() %>" style="width: 50px; height: 50px;"></td>
      <td><%=b.getPizzaname()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPizzacategory()%></td>
      <td><%=b.getStatus()%></td>
     <td>
      <a href="edit.jsp?id=<%=b.getPizzaId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>   Edit</a>
      <a href="delete?id=<%=b.getPizzaId() %>" class="btn btn-sm btn-danger"><i class="fa-sharp fa-solid fa-trash"></i>    Delete</a>
      
      </td>
      </tr>
	  
	  <%
  }
	  %>
  
  
   
   
  </tbody>
</table>

</body>
</html>