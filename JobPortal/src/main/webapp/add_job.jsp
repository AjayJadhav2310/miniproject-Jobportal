<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Job</title>
<%@include file="all_component.jsp" %>
    

</head>
<body>


    <div class="container-fluid p-3 m-0">
    <%@include file="navbar.jsp" %>
    <h1>Post Job Details</h1>
    <br>
    
    <form action="SaveJobServlet" method="post">
  <div class="form-group">
    <label for="title">Job title</label>
    <input name="title" required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here" />
  </div>
  <div class="form-group">
    <label for="description">Job Description</label>
   <textarea  name="discription" required id="description" placeholder="Enter your description here" class="form-control" style="height:300px" ></textarea>
  </div>
  <div class="form-row ">
  
  <div class="form-group col-md-3">
<input name="category" type="text" class="form-control form-control-sm" value="Category :"  />
</div>




<div class="form-group col-md-3">
<input name="status" type="text" class="form-control form-control-sm" value="Status :"  />
</div>

<div class="form-group col-md-3">
<input name="location" type="text" class="form-control form-control-sm" value="Location :" />
</div>

</div>
<div class="container text-center">
<button type="submit" class="btn btn-primary">Add</button>

</div>
  
</form>
    
    
    </div>

</body>
</html>