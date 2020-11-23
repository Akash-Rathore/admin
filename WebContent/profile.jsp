<%@include file="include/session.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="com.customeradmin.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
     <%@include file="include/head.jsp"%>
     <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
     <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
     <style>
     .modal-open .content{
     -webkit-filter: blur(7px);
     -moz-filter: blur(15px);
     -o-filter: blur(15px);
     -ms-filter: blur(15px);
     filter: blur(15px);
   }
  
.modal-backdrop {background: #f7f7f7;}

.close {
    font-size: 50px;
    display:block;
}
</style>	
     
</head>

<body class="theme-light-blue">
    
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="index.jsp">CUSTOMER ADMIN</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- Notifications -->
                      <%@include file="include/notification.jsp"%>
                    <!-- #END# Notifications -->                    
                    <!-- <li class="pull-right"><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="material-icons">more_vert</i></a></li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <%@include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
        
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                   Customer Profile
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               Customer Profile
                            </h2>
                            
                        </div>
                        <%!
                          String sql=null;
                          Connection connection=null;
                          ResultSet resultset=null;
                          PreparedStatement  preparedStatement=null;
                       %>
                       <%
                            
                            try(Connection connection=DBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("SELECT  `password`,`company_per_name`,`company_per_designation` , `mobile` , `username` , `location` FROM `customer_details` WHERE `company_per_email`='"+email+"'");)
                           {
                                ResultSet resultset=preparedStatement.executeQuery();
                                     
                              
                               if(resultset.next())
                               {
                            	   
                               
                       %>
                   
                        
                        <div class="body mrgnbtm">
                            <form action="process?action=updateprofile"  id="profile" method="post" class="form-horizontal">
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">User Name</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="username" name="username" placeholder="User Name" value="<%=resultset.getString("username")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Password</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="password"  class="form-control" id="password" name="password" placeholder="******" value="<%=resultset.getString("password")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="NameSurname" class="col-sm-2 control-label">Name</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" pattern="[A-Za-z\s]{0,50}" class="form-control" id="name" name="name" placeholder="Name" value="<%=resultset.getString("company_per_name")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Designation</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" pattern="[A-Za-z\s]{0,50}" class="form-control" id="designation" name="designation" placeholder="Designation" value="<%=resultset.getString("company_per_designation")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Mobile No.</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="number"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                        maxlength = "10" class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%=resultset.getLong("mobile")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" class="col-sm-2 control-label">Email</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="<%=email%>"  disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Email" pattern="[A-Za-z\s]{0,50}" class="col-sm-2 control-label">Location</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="location" name="location" placeholder="Location" value="<%=resultset.getString("location")%>" required="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                                    <button type="submit" class="btn btn-primary" style="float: right;">Modify</button>
                                                    <!-- <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary" style="float: right; margin-right: 3px;">Change Password</button> -->
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                   <%     	   
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
                        
                       
                        %> 

                    </div>
                </div>
             </div>
      

        </div>
    </section>

<%@include file="include/footer.jsp"%>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
     <script type="text/javascript">
      $('#profile').submit(function(e){
	     e.preventDefault();
	     
	    	      var data={
	    	                  username:$('#username').val(),
	    	                  password:$('#password').val(),
	    	                      name:$('#name').val(),
	    	               designation:$('#designation').val(),
	    	                    mobile:$('#mobile').val(),
	    	                     email:$('#email').val(),
	    	                  location:$('#location').val()
	    	                 
	    	                 }
	    	      console.log(data);
	      $.ajax({
	    	       url:"process?action=updateprofile",
	    	       type:"POST",
	    	       dataType:"json",
	    	       data:data,
	    	       success:function(data,textStatus,jqXHR)
	    	       {
	    	    	  console.log(data);
	     	    	 if(data.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Update profile',
	     	    			  showConfirmButton: false,
	     	    			  timer: 2000
	     	    			})
	     	    			
	     	    			
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Not update profile',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    	  }    
	    	      },
	    	    error:function(e)
	    	    	{
	    	    	 console.log("error in pages");
	    	    	  Swal.fire({
    	    			  icon:'error',
    	    			  title:'Not update profile',
    	    			  text:"wrong",
    	    			  footer:'',
    	    			  timer:3000
    	    			}) 
	    	    }
	       
	      });
   });
</script>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 col-sm-offset-3 text-center">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
        <br><br>
        <form action="process?action=changepassword" method="post">
          <div class="form-group">
              <label for="NameSurname" class="col-sm-5 control-label">Current Password</label>
              <div class="col-sm-7">
                  <div class="form-line">
                      <input type="password" class="form-control" id="NameSurname" name="password" placeholder="User Name" required="">
                  </div>
              </div>
          </div>
          <br>
          <div class="form-group">
              <label for="Email" class="col-sm-5 control-label">New Password</label>
              <div class="col-sm-7">
                  <div class="form-line">
                      <input type="password" class="form-control" id="Email" name="newpassword" placeholder="******">
                  </div>
              </div>
          </div>
          <br>
          <div class="form-group">
              <label for="NameSurname" class="col-sm-5 control-label">Confirm Password</label>
              <div class="col-sm-7">
                  <div class="form-line">
                      <input type="password" class="form-control" id="NameSurname" name="confirm" placeholder="Name" required="">
                  </div>
              </div>
          </div>
          <br>
          <div class="row clearfix">
               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                    <button type="submit" data-toggle="modal" data-target="#myModal" class="btn btn-primary" style="float: center; margin-right: 3px;">Change Password</button>
               </div>
           </div>
        </form>       
      </div>
    </div>
  </div>
</div>
</body>
</html>
