
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Jobs</title>
<%@include file="all_component.jsp" %>
</head>
<body>

<div class="container">
    <%@include file="navbar.jsp" %>
    <br>
    <h1 class="text-uppercase">All Jobs</h1>
    
    <div class="row">
    <div class="col-12">
    
      
    <%
    Session s =FactoryProvider.getFactory().openSession();
    Query q = s.createQuery("from JobPortal");
    List<JobPortal>list=q.list();
    for(JobPortal job:list)
    {
    	%>
    	
    	<div class="card mt-3" >
  <img class="card-img-top m-4" style="max-width:100px" src="img/businessman.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%= job.getTitle() %></h5>
     <h5 class="card-title"><%= job.getCategory() %></h5>
      <h5 class="card-title"><%= job.getStatus() %></h5>
       <h5 class="card-title"><%= job.getLocation() %></h5>
       <h5 class="card-title"><%= job.getPdate() %></h5>
    <p class="card-text"> 
    
    <%= job.getDescription() %>
    </p>
    <a href="DeleteServlet?job_id=<%= job.getId() %>" class="btn btn-danger">Delete</a>
    <a href="Update.jsp?job_id=<%= job.getId() %>" class="btn btn-primary">Update</a>
  </div>
</div>
    	
    	
    	<%
    	
    }
    s.close();
    %>
    
    </div>
    
    </div>
    
   
    </div>
</body>
</html>