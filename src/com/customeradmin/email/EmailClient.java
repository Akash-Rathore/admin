package com.customeradmin.email;

import javax.mail.MessagingException;
import com.email.durgesh.Email;
 
public class EmailClient
{
	
	
     public  void email(String subject,String content,String recipient) throws MessagingException
     {
    	 try{
    	            Email email=new Email("akashrathore1999.ar@gmail.com","Akash1999@");
    	            email.setFrom("akashrathore1999.ar@gmail.com","INDIA");
    	            email.setSubject(subject);
    	            email.setContent(content, "text/html");
    	            email.addRecipient(recipient);
    	            email.send();
    	   }
    	   catch(Exception exception)
    	   {
    		   exception.printStackTrace();
    	   }
     }
}
