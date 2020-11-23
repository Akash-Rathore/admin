package com.customeradmin.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.net.InetAddress; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import com.customeradmin.connection.DBConnection;
import com.google.gson.Gson;

@WebServlet(name="/LoginService",urlPatterns={"/loginService"})
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public LoginService() {
           
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String email = request.getParameter("email");	
	   	   String password = request.getParameter("password");
	   	   
	   	   
	      Gson gson = new Gson();
		  JSONObject json = new JSONObject();
		  String message;
		  PrintWriter out = response.getWriter();
	   	  //IP address of system 
	      InetAddress localhost = InetAddress.getLocalHost(); 
	   	   
	   	   
		   //loginTime
	   	   long timeNow = Calendar.getInstance().getTimeInMillis();
		   java.sql.Timestamp timestamp = new java.sql.Timestamp(timeNow);
	   	   
	   	if(email.equals("")&&password.equals(""))
	   	   {
	   		   response.sendRedirect("index.jsp");
	   	   }
	   	   else 
	   	   {
	   	   
	   	   
	   	     try
	   	        {
	   	      	  Connection connection=DBConnection.openConnection();     
	   	      	  PreparedStatement   preparedStatement = connection.prepareStatement("SELECT `id`,`company_per_name`,`company_per_email`,`password` FROM `customer_details` where company_per_email='"+email+"' and password='"+password+"'");
	   		      ResultSet resultset=preparedStatement.executeQuery();
	   		      if(resultset.next())
	              {
	          	       HttpSession session=request.getSession();
	          	       session.setAttribute("Email",email);
	          	       session.setAttribute("name", resultset.getString("company_per_name"));
	          	       session.setAttribute("id",resultset.getInt("id"));
	          	       //logfile
	          	      
	          	      // preparedStatement = connection.prepareStatement("INSERT INTO `logfile` (`loginid`, `ip`, `logintime`, `action`,`role`) VALUES ('"+email+"','"+localhost.getHostAddress().trim()+"','"+timestamp+"','Login by customer admin','customeradmin')");
		   		      // int logfile=preparedStatement.executeUpdate();
	          	       new com.customeradmin.email.Logfile().logfile(email, "customeradmin has been login", resultset.getInt("id"), "customeradmin");
	          	       
	          	       //response.sendRedirect("dashboard.jsp");
		   		      
		   		       
		   		       json.put("status", true);
					   json.put("message", "Login success");
				   	   message = gson.toJson(json);
					   out.println(message);
	          	       
	          	       
	          	       
	          	        
	              }
	              else
	              {    
	            	  
	            	    json.put("status",false);
	      	            json.put("message","Check your account wrong Usename or Password");
	      	            message=gson.toJson(json);
	    	            out.println(message);
	    	         
	            	 //response.sendRedirect("forgot-password.jsp");
	              }
	                
	   	      }
	   	      catch(SQLException sqlexception)
	   	      {
	   		      sqlexception.printStackTrace();  
	   	      }
	   	      catch(Exception exception)
	   	      {
	   		      exception.printStackTrace();  
	   	      }
	   	   } 
	  }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	}

 
