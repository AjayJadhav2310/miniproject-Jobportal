package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.JobPortal;
import com.helper.FactoryProvider;

public class SaveJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SaveJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
		String title =request.getParameter("title");
		String discription =request.getParameter("discription");
		
		String category =request.getParameter("category");
		String status =request.getParameter("status");
		String location =request.getParameter("location");
		
    JobPortal job = new JobPortal(title,discription,category,status,location, new Date());
      
//  System.out.println(job.getId()+" : "+job.getTitle()+" : "+job.getDescription()+" : "+job.getLocation()+" : "+job.getCategory()+" : "+job.getStatus());
//	
    //hibernate:save
    
      Session s =FactoryProvider.getFactory().openSession();
      Transaction tx =s.beginTransaction();
      
      
       s.save(job);
       tx.commit();
      s.close();
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      out.println("<h1 style='text-align:center;'>Job is added successfully</h1>");
      out.println("<h1 style='text-align:center;'><a href='all_jobs.jsp'>View all jobs</a></h1>");
    
		}catch(Exception e) {
			
			e.printStackTrace();		}
		
		
		
	}

}
