package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.JobPortal;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			
			String title=request.getParameter("title");
			String discription=request.getParameter("discription");
			String category =request.getParameter("category");
			String status =request.getParameter("status");
			String location =request.getParameter("location");
			
			int jobId=Integer.parseInt(request.getParameter("jobId").trim());
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			JobPortal job=s.get(JobPortal.class, jobId);
			
			job.setTitle(title);
		    job.setDescription(discription);
		    job.setCategory(category);
		    job.setStatus(status);
		    job.setLocation(location);
		    job.setPdate(new Date());
			
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_jobs.jsp");
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
