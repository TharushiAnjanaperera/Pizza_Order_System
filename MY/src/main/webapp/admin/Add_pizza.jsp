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
                    <h4 class="text-center text-primary">Add Pizza</h4>
                    <form action= "../Addpizza" method="post" enctype="multipart/form-data">
                    
                        <div class="form-group">
                            <label>Pizza Name</label>
                            <input type="text" class="form-control" name="pname">
                        </div><br>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Price</label>
                            <input type="number" class="form-control" name="price" id="exampleInputPassword1">
                        </div><br>
                        <div class="form-group">
                            <label for="inputStatus">Status</label>
                            <select id="inputStatus" name="status" class="form-control">
                                <option selected>--select--</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div><br>
                        <div class="form-group">
                            <label>Category</label>
                            <select id="inputcategory" class="form-control" name="category">
                                <option selected>--select--</option>
                                <option value="Neapolitan Pizza">Neapolitan Pizza</option>
                                <option value="Chicago Pizza">Chicago Pizza</option>
                                <option value="Sicilian Pizza">Sicilian Pizza</option>
                            </select>
                        </div><br>
                        <div class="form-group">
                            <label>Upload Photo</label>
                            <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                        </div><br>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
