package com.customeradmin.process;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customeradminController.ServletAction;


//@WebServlet("/Process")
@WebServlet(name="/Process",urlPatterns={"/process"})
public class Process extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    ServletAction servletaction;
    public Process() {
        
    	  servletaction=new ServletAction();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String action=request.getParameter("action");
	     if(action.equals("logout")){
	    	  servletaction.logout(request, response);	
		 }else if(action.equals("updateprofile")){
			  servletaction.updateprofile(request, response);
		 }else if(action.equals("clientdetail")){
			  servletaction.clientdetail(request, response);
		 }else if(action.equals("clientdetaildelete")){
			  servletaction.clientdetaildelete(request, response);
		 }else if(action.equals("clientdetailupdate")){
			  servletaction.clientdetailupdate(request, response);
		 }else if(action.equals("complainlist")){
			  servletaction.complainlist(request,response); 	  
		 }else if(action.equals("changepassword")){
			  servletaction.changepassword(request, response);
		 }
	     
	  }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doGet(request, response);
	}

}
