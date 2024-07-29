<%@ page import="com.DAO.PizzaDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.PizzaDetails" %>
<%@ page import="com.uniquedeveloper.registration.databaseUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f0f3f7">
<%@include file="all_component/navbar.jsp"%>
<div class="container">
	<h3 class="text-center">Chicago Pizza</h3>
	<div class="row">
		
	 <%
        PizzaDAOImpl dao2 = new PizzaDAOImpl(databaseUtil.getConnection());
        List<PizzaDetails> list1 = dao2.getChicagoPizza();
        if (list1 != null && !list1.isEmpty()) {
            for (PizzaDetails b : list1) {
        %>
         <div class="col-md-3">
        	<div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="image/<%=b.getPhotoName() %>" style="width:200px; height:200px" class="img-thumbnail">
                <p><%= b.getPizzaname() %></p>
                <p>Category: <%= b.getPizzacategory() %></p>
                <div class="row">
                 		<div class="col-md-0">
                        <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><%= b.getPrice() %></a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <% 
            } // Close for loop
        } else {
        %>
        <p class="text-center">No Chicago pizzas available.</p>
        <%
        }
        %>
    </div>
</div>

</body>
</html>