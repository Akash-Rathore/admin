package com.customeradmin.process;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.customeradmin.connection.DBConnection;


//@WebServlet("/Forgotpassword")
@WebServlet(name = "/Forgotpassword", urlPatterns = { "/forgotpassword" })
public class Forgotpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Forgotpassword() {
        super();
        //TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		    String email=request.getParameter("email");
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();

		 
			try{
				 
				 Connection connection = DBConnection.openConnection();
				 PreparedStatement preparedStatement = connection.prepareStatement("SELECT `password` FROM `customer_details` WHERE company_per_email='"+email+"'");
				 ResultSet resultset = preparedStatement.executeQuery();
			     if(resultset.next())
			     {
			    	    
			    		 new com.customeradmin.email.EmailClient().email("customer admin",
								"<h5>This is your email  '" +email+ "' for login <br>This is your password '" + resultset.getString("password") + "'</h5>",email);

			    	 
			    	    json.put("status", true);
						json.put("message", "forgot password Successfull send your email");
						message = gson.toJson(json);
						out.println(message);
	
			     }
				 else
			     {
					   json.put("status", false);
					   json.put("message", "Something is Wrong");
					   message = gson.toJson(json);
					   out.println(message);

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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
