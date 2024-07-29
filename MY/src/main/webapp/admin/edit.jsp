<%@ page import="com.DAO.PizzaDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.PizzaDetails" %>
<%@ page import="com.uniquedeveloper.registration.databaseUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
                    <h4 class="text-center text-primary">Edit Pizza</h4>
                    
                    
                    <%
                    int id=Integer.parseInt(request.getParameter("id"));
                    PizzaDAOImpl dao= new PizzaDAOImpl(databaseUtil.getConnection());
                    PizzaDetails b=dao.getPizzaById(id);
                    
                    %>
                    <form action= "../editPizza" method="post">
                    
                    	<input type="hidden" name="id" value="<%=b.getPizzaId()%>">
                        <div class="form-group">
                            <label>Pizza Name</label>
                            <input type="text" class="form-control" name="pname" value="<%=b.getPizzaname()%>">
                        </div><br>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Price</label>
                            <input type="number" class="form-control" name="price" id="exampleInputPassword1" value="<%=b.getPrice()%>">
                        </div><br>
                        <div class="form-group">
                            <label for="inputStatus">Status</label>
                            <select id="inputStatus" name="status" class="form-control">
                                <%
                                if("Active".equals(b.getStatus())){
                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                                <%
                                } else {
                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                                <%
                                }
                                %>
                            </select>
                        </div><br>
                        
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
