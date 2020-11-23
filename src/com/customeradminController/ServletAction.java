package com.customeradminController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.customerModal.Userclientdetail;
import com.customerModal.Usercustomer;
import com.customeradminDAO.CustomeradminDAO;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.customerModal.ComplainList;

public class ServletAction {

	CustomeradminDAO customeradminDAO;
	public ServletAction()
	{
		customeradminDAO=new CustomeradminDAO();
	}
	
    //customeradmin logout
	 public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
   	    HttpSession session = request.getSession();
   	    if(session!=null){

            session.invalidate();
            session=null;
         }
   	     response.sendRedirect("index.jsp");
        
     }
	 
	 //customeradmin updateprofile
	 public void updateprofile(HttpServletRequest request, HttpServletResponse response) throws IOException
	 {     
		    
		    Gson gson=new Gson();
		    JSONObject json=new JSONObject();
		    String message;
		    PrintWriter out=response.getWriter();   
		    //get email for session
	        HttpSession session = request.getSession();
	        String email=(String)session.getAttribute("Email");
	        int id=(int)session.getAttribute("id");
	        Usercustomer usercustomer=new Usercustomer(request.getParameter("username"),request.getParameter("password"),request.getParameter("name"),request.getParameter("designation"),Long.parseLong(request.getParameter("mobile")),email,request.getParameter("location"),id);
	        boolean check=customeradminDAO.updateprofile(usercustomer);
	        if(check)
		      {
		    	  //request.getRequestDispatcher("/complaint_hub.jsp").forward(request, response);
		    	  json.put("status",true);
		 	      json.put("message","Update profile");
		     	  message=gson.toJson(json);
		     	  out.println(message);
		      }
		      else
		      {
		    	  json.put("status" , false);
			 	  json.put("message" , "Profile not update");
			      message=gson.toJson(json);
	              out.println(message);
		      }
	        
	        
      }
	  //clientdetail
	  public void clientdetail(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		       String selectdeparment= "";
		       String a[]=request.getParameterValues("vardepartment");
		        for(int i=0;i<a.length;i++){
		        	selectdeparment+=a[i]+",";
		        }
		        
		    Gson gson=new Gson();
		    JSONObject json=new JSONObject();
			String message;
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
		    int customer_id=(int)session.getAttribute("id"); 
		    String email=(String) session.getAttribute("Email");
		    
		  	Userclientdetail userclientdetail=new Userclientdetail(request.getParameter("softdocnum"),request.getParameter("empid"),request.getParameter("name"),request.getParameter("email"),request.getParameter("joindate"),request.getParameter("activitiondate"),request.getParameter("department"),request.getParameter("designation"),request.getParameter("location"),selectdeparment,customer_id,email); 
            boolean check=customeradminDAO.clientdetail(userclientdetail);
            if(check)
            {
                //response.sendRedirect("create_clients.jsp");
            	 json.put("status",true);
   	             json.put("message","Successfully");
       	         message=gson.toJson(json);
       	         out.println(message);
  		  
            }
            else
            {
            	 json.put("status",false);
  	             json.put("message","Client details not success");
      	         message=gson.toJson(json);
      	         out.println(message);
 		 
            	//response.sendRedirect("create_clients.jsp");
            }
      }
	  //clientdetaildelete 
	  public void clientdetaildelete(HttpServletRequest request, HttpServletResponse response) throws IOException
      {
		  
		  
		  
		    HttpSession session=request.getSession();
		    int customer_id=(int)session.getAttribute("id"); 
		    String email=(String) session.getAttribute("Email");
		    Gson gson = new Gson();
			JSONObject json = new JSONObject();
			String message;
			PrintWriter out = response.getWriter();
            Userclientdetail userclientdetail=new Userclientdetail(Integer.parseInt(request.getParameter("id")),(String) session.getAttribute("Email"),(int)session.getAttribute("id"));
            boolean check=customeradminDAO.clientdetaildelete(userclientdetail);  
            if(check)
            {
            	json.put("status", true);
    			json.put("message", "success");
    			message = gson.toJson(json);
    			out.println(message);
            }
            else
            {
            	// response.sendRedirect("user.jsp");
            	json.put("status", false);
    			json.put("message", "not success");
    			message = gson.toJson(json);
    			out.println(message);
            }
      }
	  //clientdetailupdate
	  public void clientdetailupdate(HttpServletRequest request, HttpServletResponse response) throws IOException
	  {
		   String selectdeparment= "";
	       String a[]=request.getParameterValues("vardepartment");
	        for(int i=0;i<a.length;i++){
	        	selectdeparment+=a[i]+",";
	        }
	        
	     HttpSession session=request.getSession();
		 int customer_id=(int)session.getAttribute("id"); 
		 String email=(String) session.getAttribute("Email");
		      
	     Userclientdetail userclientdetail=new Userclientdetail(Integer.parseInt(request.getParameter("id")),request.getParameter("softdocnum"),request.getParameter("empid"),request.getParameter("name"),request.getParameter("email"),request.getParameter("joindate"),request.getParameter("activitiondate"),request.getParameter("department"),request.getParameter("designation"),request.getParameter("location"),selectdeparment,(String) session.getAttribute("Email"),(int)session.getAttribute("id")); 
         boolean check=customeradminDAO.clientdetailupdate(userclientdetail);
         if(check)
         {
            response.sendRedirect("user.jsp");
         }
         else
         {
        	 response.sendRedirect("user.jsp");
         }
	  }
	  
	  //complainlist
	  public void complainlist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
		  Gson gson=new Gson();
	      JSONObject json=new JSONObject();
		  String message;
		  PrintWriter out=response.getWriter();   
	      HttpSession session=request.getSession();
  	      int id=(int)session.getAttribute("id");
  	      int maxFileSize = 500000 * 1024;
	   	  String UPLOAD_DIRECTORY = "C:/images/";
		  MultipartRequest mrequest = new MultipartRequest(request, UPLOAD_DIRECTORY, maxFileSize);
          String title=mrequest.getParameter("title");
          String  description=mrequest.getParameter("description");
  	      String attachment=mrequest. getFilesystemName("attachment");
  	      String documentnumberref=mrequest.getParameter("documentnumberref");
  	      String category=mrequest.getParameter("category");
  	      ComplainList complaintlist=new ComplainList(title,UPLOAD_DIRECTORY+attachment,documentnumberref,description,id,category);
	      boolean check=customeradminDAO.complainlist(complaintlist);
	      if(check)
	      {
	    	  // request.getRequestDispatcher("/complaint_hub.jsp").forward(request, response);
	    	  json.put("status",true);
	 	      json.put("message","Complain is raised");
	     	  message=gson.toJson(json);
	     	  out.println(message);
	      }
	      else
	      {
	    	  json.put("status" , false);
		 	  json.put("message" , "Complain is not raised ");
		      message=gson.toJson(json);
              out.println(message);
	      }
	   }
	  //change password
	   public void changepassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	   {      
		      HttpSession session=request.getSession();
 	          String email=(String)session.getAttribute("Email");
 	          Usercustomer usercustomer=new Usercustomer(request.getParameter("password"),request.getParameter("newpassword"),request.getParameter("confirm"),email);
		      boolean check=customeradminDAO.changepassword(usercustomer);
		      if(check)
		      {
		    	  request.getRequestDispatcher("/profile.jsp").forward(request, response);
			  }
		      else
		      {
		    	  request.getRequestDispatcher("/profile.jsp").forward(request, response);
		      }
		      
		}
      
	  
	  
	 
}
