package com.customeradminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.concurrent.ThreadLocalRandom;
import java.util.Random;
import com.customerModal.Userclientdetail;
import com.customerModal.Usercustomer;
import com.customeradmin.connection.DBConnection;
import com.customeradmin.email.EmailClient;
import com.customerModal.ComplainList;

public class CustomeradminDAO {
	
	
	 public CustomeradminDAO()
	 {
		 
	 }
     //updateprofileDAO
	 public boolean updateprofile(Usercustomer usercustomer)
	 {
		 boolean check=false;
		 String email=usercustomer.getCompany_per_email();
		 System.out.println(email);
	     try(Connection connection=DBConnection.openConnection();PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `customer_details` SET `password`= ?,`company_per_name`=?,`company_per_designation`=?,`mobile`=?,`username`=?,`location`=? WHERE `company_per_email`='"+email+"'");)
	     {
	    	   
		         preparedStatement.setString(1, usercustomer.getPassword());
		         preparedStatement.setString(2, usercustomer.getCompany_per_name());
		         preparedStatement.setString(3, usercustomer.getCompany_per_designation());
		         preparedStatement.setLong(4, usercustomer.getMobile());
		         preparedStatement.setString(5, usercustomer.getUsername());
		         preparedStatement.setString(6, usercustomer.getLocation());
		         check = preparedStatement.executeUpdate()>0;
	 	         
		         
	 	         //This is for logfile
	 	 	      if(check)
	 	 	      {
	 	 	           	
	 	 	          new com.customeradmin.email.Logfile().logfile(email, "update profile by customer admin", usercustomer.getId() , "customeradmin");
	          	       
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
		 return check;
	 }
	 
	 
	 public boolean clientdetail(Userclientdetail userclientdetail)
	 {
		 Random random = new Random();
		 int password = random.nextInt(100000000); 
		 boolean check=false;
		   try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `client_details` (`softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment`,`customer_id`,`password`) VALUES (?, ?, ?, ? , ? , ? , ?, ?, ?, ?,?,?)");)
		     {
			   
			    
			    preparedStatement.setString(1, userclientdetail.getSoftdocno());
			    preparedStatement.setString(2, userclientdetail.getEmployeeid());
			    preparedStatement.setString(3, userclientdetail.getName());
			    preparedStatement.setString(4, userclientdetail.getEmail());
			    //joinging date
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date udate = sdf.parse(userclientdetail.getJoiningdate());
				long time = udate.getTime();
				java.sql.Date sdate = new java.sql.Date(time);
				preparedStatement.setDate(5, sdate);
				//activation date
				SimpleDateFormat sdfact = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date udateact = sdfact.parse(userclientdetail.getActivationdate());
				long timeact = udateact.getTime();
				java.sql.Date sdateact = new java.sql.Date(timeact);
				preparedStatement.setDate(6, sdateact);
			    preparedStatement.setString(7, userclientdetail.getDepartment());
			    preparedStatement.setString(8, userclientdetail.getDesignation());
			    preparedStatement.setString(9, userclientdetail.getLocation());
			    preparedStatement.setString(10,userclientdetail.getSelectdepartment());
			    preparedStatement.setInt(11, userclientdetail.getCustomer_id());
			    preparedStatement.setInt(12, password);
			    check = preparedStatement.executeUpdate()>0;
			    
			    //This is for logfile
	 	 	      if(check)
	 	 	      {
	 	 	    	 //Email sending and receving
	 				    try{
	 				           new EmailClient().email("Softdoc Client","<h5>This is your email  '"+userclientdetail.getEmail()+"' for login <br>This is your password '"+password+"'</h5>",userclientdetail.getEmail());
	 				       }
	 				       catch(Exception exception)
	 				       {
	 				    	   exception.printStackTrace();
	 				       }
	 				
	 				  
	 				     new com.customeradmin.email.Logfile().logfile(userclientdetail.getSessionemail(), "create customer client by customer admin" ,  userclientdetail.getCustomer_id() , "customeradmin");
	 				    
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
		 
		 return check;
	 }
	 //clientdetaildelete
	 public boolean  clientdetaildelete(Userclientdetail userclientdetail) 
	 {
			boolean check = false;
			try (Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `client_details` SET flag=1 WHERE id=?");){

				preparedStatement.setInt(1, userclientdetail.getId());
				check = preparedStatement.executeUpdate() > 0;
				
				//This is for logfile
	 	 	      if(check)
	 	 	      {
	 	 	    	   new com.customeradmin.email.Logfile().logfile(userclientdetail.getSessionemail(), "delete customer client by customer admin" , userclientdetail.getCustomer_id() , "customeradmin");
	 				    
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
		 
         return check;		 
	 }
	 
	 
	 //clientdetailupdate
	 public boolean clientdetailupdate(Userclientdetail userclientdetail)
	 {
		 boolean check=false;
		 int id=userclientdetail.getId();
		 try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `client_details` SET `softdoc_id` = ?, `employee_id` = ?, `employee_name` = ?, `emp_email_id` = ?, `joining_date` = ?, `activation_date` = ?, `department` = ?, `designation` = ?, `location` = ?, `selectdepartment` = ? WHERE `id`='"+id+"'");)
	     {
		    preparedStatement.setString(1, userclientdetail.getSoftdocno());
		    preparedStatement.setString(2, userclientdetail.getEmployeeid());
		    preparedStatement.setString(3, userclientdetail.getName());
		    preparedStatement.setString(4, userclientdetail.getEmail());
		    //joinging date
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udate = sdf.parse(userclientdetail.getJoiningdate());
			long l = udate.getTime();
			java.sql.Date sdate = new java.sql.Date(l);
			preparedStatement.setDate(5, sdate);
			//activation date
	     	SimpleDateFormat sdfact = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udateact = sdfact.parse(userclientdetail.getActivationdate());
			long lact = udateact.getTime();
			java.sql.Date sdateact = new java.sql.Date(lact);
			preparedStatement.setDate(6, sdateact);
	        preparedStatement.setString(7, userclientdetail.getDepartment());
	        preparedStatement.setString(8, userclientdetail.getDesignation());
		    preparedStatement.setString(9, userclientdetail.getLocation());
		    preparedStatement.setString(10,userclientdetail.getSelectdepartment());
		    check = preparedStatement.executeUpdate()>0;
		    
		  //This is for logfile
	 	      if(check)
	 	      {
	 	    	  new com.customeradmin.email.Logfile().logfile(userclientdetail.getSessionemail(), "update profile customerclient by customer admin" , userclientdetail.getCustomer_id() , "customeradmin");
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
	 
		 return check;
	 }
	 
	  //complainlist
	  public boolean complainlist(ComplainList complaintlist)
	  {
		    boolean check=false;
		    int rand_integer = ThreadLocalRandom.current().nextInt(100000);
		    String customerid="COM"+rand_integer;
		    
		    try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `complain_list` (`customer_id`, `complain_id`, `attachment`, `title`, `area_of_issue`, `documentnumberref`,`category`,`date`) VALUES (? , ?, ?, ?, ?, ?,?,?)");)
			{
			      preparedStatement.setInt(1, complaintlist.getId());
			      preparedStatement.setString(2, customerid);
			      preparedStatement.setString(3, complaintlist.getAttachment());
			      preparedStatement.setString(4, complaintlist.getTitle());
			      preparedStatement.setString(5, complaintlist.getDescription());
			      preparedStatement.setString(6, complaintlist.getDocumentnumberref());
			      preparedStatement.setString(7, complaintlist.getCategory());
			      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				  preparedStatement.setTimestamp(8, timestamp);
			      
			      check = preparedStatement.executeUpdate()>0;
		          
			      
				    
		    }
			catch(SQLException sqlexception)
			{
				sqlexception.printStackTrace();
			}
			catch(Exception exception)
			{
				exception.printStackTrace();
			}
		    
		    return check;
	  }
	  
	  //changepassword
	  public boolean changepassword(Usercustomer usercustomer)
	  {       
		       String email=usercustomer.getCompany_per_email();
			   String password="";
			   String confirm="";
			   boolean check=false;
			   try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT `password` FROM `customer_details` WHERE `company_per_email`='"+email+"'");)
			   {
				    ResultSet resultset=preparedStatement.executeQuery();
				    if(resultset.next())
				    {
				        password=resultset.getString(1); 	
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
			  
			  if(password.equals(usercustomer.getPassword()))
			   {
			    	    confirm = usercustomer.getConfirm();  
			   }
			  //update password
			   try(Connection connection=DBConnection.openConnection(); PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `customer_details` SET `password` = '"+confirm+"' WHERE `company_per_email`= '"+email+"'");)
			   {
				   check=preparedStatement.executeUpdate()>0;
			   }
			   catch(SQLException sqlexception)
			   {
				   sqlexception.printStackTrace();
			   }
			   catch(Exception exception)
			   {
				    exception.printStackTrace();
			   }
			    
			   //logfile 
			    if(check)
	 	 	    { try(Connection connection=DBConnection.openConnection();PreparedStatement preparedstmt = connection.prepareStatement("INSERT INTO `logfile` (`action`) VALUES ('change password by customer admin')");) 
	 	 	           {preparedstmt.executeUpdate(); }catch(Exception exception){ System.out.println("error in subadmin");}}
		 	 	
				
			   
			   
			  
			 return check;
		  }
	 
}
