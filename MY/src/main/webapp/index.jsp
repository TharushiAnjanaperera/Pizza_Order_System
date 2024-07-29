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
<style type="text/css">
.back-img{
        background: url("image/pizza10.jpg");
        height:70vh;
        width:100%;
        background-size: cover;
        background-repeat: no=repeat;

}

.crd-ho:hover{
	background-color: #fcf7f7;

}
</style>
</head>
<body style="background-color:#f0f3f7">

<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid back-img">
<H1 class="text-center text-white">Keep Clam And Order Pizza</H1>
<h2 class="text-left text-white">Welcome to <b>Ymmy Pizza</b>,</h2><br>

 <h6 class="text-left text-white">The ultimate destination for pizza lovers! Our online pizza-selling website offers </h6>
 <h6 class="text-left text-white">a seamless, user-friendly experience, allowing you to satisfy your pizza cravings with just a few clicks.</h6>
 <h6 class="text-left text-white">Here's what makes Pizzalicious the best place to order your favorite pizzas online:</h6>


</div>
<hr>
 

<div class="container">
    <h3 class="text-center">Neapolitan Pizza</h3>
    <div class="row">
    
        <%
        PizzaDAOImpl dao = new PizzaDAOImpl(databaseUtil.getConnection());
        List<PizzaDetails> list = dao.getNeapolitanPizza();
        if (list != null && !list.isEmpty()) {
            for (PizzaDetails b : list) {
        %>
         <div class="col-md-3">
        	<div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="image/<%=b.getPhotoName() %>" style="width:200px; height:200px" class="img-thumbnail">
                <p><%= b.getPizzaname() %></p>
                <p>Category: <%= b.getPizzacategory() %></p>
                <div class="row">
                 		<div class="col-md-0">
                 		 <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
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
        <p class="text-center">No Neapolitan pizzas available.</p>
        <%
        }
        %>
    </div>
</div>
<div class="text-center mt-1">
    <a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>

<hr>

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
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                        
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
	
<div class="text-center mt-1">
<a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>
	


<hr>

<div class="container">
	<h3 class="text-center"> Sicilian Pizza</h3>
	<div class="row">
		 <%
        PizzaDAOImpl dao3 = new PizzaDAOImpl(databaseUtil.getConnection());
        List<PizzaDetails> list2 = dao3.getSicilianPizza();
        if (list2 != null && !list2.isEmpty()) {
            for (PizzaDetails b : list2) {
        %>
         <div class="col-md-3">
        	<div class="card crd-ho">
            <div class="card-body text-center">
                <img alt="" src="image/<%=b.getPhotoName() %>" style="width:200px; height:200px" class="img-thumbnail">
                <p><%= b.getPizzaname() %></p>
                <p>Category: <%= b.getPizzacategory() %></p>
                <div class="row">
                 		<div class="col-md-0">
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
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
        <p class="text-center">No Sicilian pizzas available.</p>
        <%
        }
        %>
    </div>
</div>
<div class="text-center mt-1">
<a href="" class="btn btn-danger btn-sm text-white">View All</a>
</div>
</div>
<br>
<%@include file="all_component/footer.jsp"%>
</body>
</html>