<%@page import="com.helper.*,org.hibernate.*,com.entities.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component.jsp" %>
</head>
<body>

<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %>
    
    <h1>Edit your job</h1>
    <%
    
    int jobId=Integer.parseInt(request.getParameter("job_id").trim());
    Session s=FactoryProvider.getFactory().openSession();
	JobPortal job =(JobPortal)s.get(JobPortal.class, jobId);
    
    %>
    
     <form action="UpdateServlet" method="post">
     
     <input value="<%= job.getId() %>" name="jobId" type="hidden"/>
     
  <div class="form-group">
    <label for="title">Job title</label>
    <input name="title" required type="text" class="form-control" id="title"
     aria-describedby="emailHelp" placeholder="Enter here" value="<%=job.getTitle() %>"/>
  </div>
  <div class="form-group">
    <label for="description">Job Description</label>
   <textarea  name="discription" required id="description" placeholder="Enter your description here" 
   class="form-control" style="height:300px" ><%=job.getDescription() %>
   </textarea>
  </div>
  <div class="form-row ">
  
  <div class="form-group col-md-3">
<input name="category" type="text" class="form-control form-control-sm" value="Category :" />
</div>




<div class="form-group col-md-3">
<input name="status" type="text" class="form-control form-control-sm" value="Status :"  />
</div>

<div class="form-group col-md-3">
<input name="location" type="text" class="form-control form-control-sm" value="Location :" />
</div>

</div>
<div class="container text-center">
<button type="submit" class="btn btn-success">save your job</button>

</div>
  
</form>
    
    
    
    </div>


</body>
</html>