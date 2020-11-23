<%@ page import="com.customeradmin.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.PreparedStatement"%>


<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    
<style>
fieldset { 
  display: block;
  padding-left: 2px;
  padding-right: 2px;
  border: 1px solid grey;
}

    .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 16px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
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
             <%@ include file="include/sidebar.jsp"%>
        <!-- #END# Left Sidebar -->
        
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Create Clients
                </h2>
            </div>
            <% String id=request.getParameter("id");%>
            <%
               if(id==null)
               {
            %>
              <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create Clients
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                            <form action="process?action=clientdetail" method="POST" id="userclient">   
                                <div class="row" style="text-decoration:underline"><center><h4>Client Details</h4></center></div>
                            	<br>
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-xs-12">
                                        <div class="form-group form-float ">
                                            <div class="form-line">
                                             <%      
							                          
							                          try(Connection connection=DBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("select cd.company_name as company_name, cc.id as id from customer_details cd , client_details cc where cd.id='"+(int)session.getAttribute("id")+"' ORDER BY id DESC LIMIT 1");)
							                           { ResultSet resultset=preparedStatement.executeQuery();
							                               if(resultset.next())
							                               {
							                      %>
							                                     <%
							                                         String clientnumber = String.format ("%04d",resultset.getInt("id")+1);  
							                                         String companyname =resultset.getString("company_name");
							                                 	     String company="";
							                                 	     for (int i = 0; i <= 3; i++) {
							                                 	    	   company += companyname.charAt(i);
								                            		 }
                                                                          
							                                     %>
                                                                    <input type="text" name="softdocnum" class="form-control" value="<%=company.toUpperCase()+"CC"+clientnumber%>" required="required" placeholder="Enter Softdoc No." readonly="readonly">
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
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                 <input type="text"  name="empid" class="form-control"  placeholder="Employee ID ">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                               <input type="text" pattern="[A-Za-z\s]{0,50}" name="name" class="form-control" placeholder="Employee Name">
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                  <input type="email" name="email" class="form-control" placeholder="Employee Email ID">  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <h6>Joining Date</h6>
                                                <input type="date" name="joindate"  class="form-control" >
                                                 
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                  <h6>Activation Date</h6>
                                                <input  type="date" name="activitiondate" class="form-control">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">     
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                 <input type="text" pattern="[A-Za-z\s]{0,50}" name="designation" class="form-control" placeholder="Designation" >  
                                                  
                                            </div>
                                        </div>
                                    </div>
                                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" pattern="[A-Za-z\s]{0,50}" name="location" class="form-control"  placeholder="Location">
                                                   
                                            </div>
                                        </div>
                                    </div>
                                  
                                </div>
                              
                            <br>
                            	<div class="row" style="text-decoration:underline"><center><h4>Access Information</h4></center></div>
                            	<br>
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            Select Department
                                        </div>
                                        <div class="col-md-9">
                                     
                                           <%
                                           try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT `id`,`depart_info`  FROM  `customer_details` WHERE `company_per_email`='"+email+"'");)
                                           {
                                              
                                        	   ResultSet resultset=preparedStatement.executeQuery();   
                                                 if(resultset.next())
                                                 {
                                          %>  
                                                   
                                                       
                                                        <%
                                                               String deptinfo =resultset.getString("depart_info");
                                                               String array[]=deptinfo.split(",");
                                                               for (int j = 0; j < array.length; j++) { 
                                                         %>
                                                    
                                                        <div class="col-md-3">
                                                            <label class="container"><%=array[j]%>
                                                               <input type="checkbox" name="vardepartment"  value="<%=array[j]%>">
                                                               <span class="checkmark"></span>
                                                            </label>
                                                       </div>
                                                      <% 
                                                        }     
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
                            <br>
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <button type="submit" id="usersubmit" class="btn btn-primary btn-lg waves-effect btn-block">Submit</button>
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                        

                    </div>
                </div>
            </div>
           <%
               }
               else if(id!=null)
               {
            	   
           %>
           <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Create Clients
                            </h2>
                        </div>
                        <%
                        try(Connection connection=DBConnection.openConnection();PreparedStatement  preparedStatement=connection.prepareStatement("SELECT `softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment` FROM `client_details`  WHERE  id='"+id+"'");)
                        {
                            
                            ResultSet resultset=preparedStatement.executeQuery();
                            int i=1;
                            if(resultset.next())
                            {
                          %>
                         <div class="body mrgnbtm">
                            <form action="process?action=clientdetailupdate&id=<%=id%>" method="POST">    
                            <div class="row" style="text-decoration:underline"><center><h4>Client Details</h4></center></div>
                            	<br>
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <div class="form-group form-float ">
                                            <div class="form-line">
                                                <input type="text" name="softdocnum"  value="<%=resultset.getString("softdoc_id")%>" placeholder="Softdoc No." class="form-control" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="empid" value="<%=resultset.getString("employee_id")%>" placeholder="Employee ID" class="form-control"  required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="name" value="<%=resultset.getString("employee_name")%>" placeholder="Employee Name" class="form-control" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="email" name="email" value="<%=resultset.getString("emp_email_id")%>" placeholder="Employee Email ID" class="form-control">
                                                
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="joindate"  value="<%=resultset.getString("joining_date")%>" placeholder="Joining Date" class="form-control">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">     
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="activitiondate" value="<%=resultset.getString("activation_date")%>" placeholder="Activation Date" class="form-control" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="department" value="<%=resultset.getString("department")%>" placeholder="Department" class="form-control" required="required">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="designation" value="<%=resultset.getString("designation")%>" placeholder="Designation" class="form-control" required="required">
                                               
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="location" class="form-control" value="<%=resultset.getString("location")%>" placeholder="Location" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>                             
                                </div> 
                            <br>
                            <div class="row" style="text-decoration:underline"><center><h4>Access Information</h4></center></div>
                            	<br>
                              
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            Select Department
                                        </div>
                                        <div class="col-md-9">
                                           <%
                                                  String deptinfo =resultset.getString("selectdepartment");
                                                  String array[]=deptinfo.split(",");
                                                  for (int j = 0; j < array.length; j++) { 
                                            %>
                                       
                                           <div class="col-md-3">
                                               <label class="container"><%=array[j]%>
                                                   <input type="checkbox" name="vardepartment"  value="<%=array[j]%>" checked="checked">
                                                   <span class="checkmark"></span>
                                               </label>
                                          </div>
                           
                                        <%
                                            } 
                                         %>
                                        
                                        
                                        
                                          <%--   <div class="col-md-3">
                                                <label class="container">HR
                                                <% if(list.contains("Hr")) { %>
                                                     <input type="checkbox" name="vardepartment" checked="checked" value="Hr">
                                                <%}else { %>
                                                    <input type="checkbox" name="vardepartment"  value="Hr">
                                                <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                       --%>     <%--  <div class="col-md-3">
                                                <label class="container">Sales
                                                <% if(list.contains("Sales")) { %>
                                                    <input type="checkbox" name="vardepartment" checked="checked" value="Sales">
                                                <%}else { %>
                                                    <input type="checkbox" name="vardepartment"  value="Sales">
                                                 <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div> --%>
                                          <%--   <div class="col-md-3">
                                                <label class="container">Purchase
                                                <% if(list.contains("Purchase")) { %>
                                                   <input type="checkbox" name="vardepartment" checked="checked"  value="Purchase">
                                                <%}else { %>
                                                   <input type="checkbox" name="vardepartment"   value="Purchase">
                                                  <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div> --%>
                                           <%--  <div class="col-md-3">
                                                <label class="container">Marketing
                                                <% if(list.contains("Marketing")) { %>
                                                   <input type="checkbox" name="vardepartment" checked="checked"  value="Marketing">
                                                <%}else { %>
                                                   <input type="checkbox" name="vardepartment"   value="Marketing">
                                                  <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            --%> <%-- <div class="col-md-3">
                                                <label class="container">Management
                                                <% if(list.contains("Management")) { %>
                                                    <input type="checkbox" name="vardepartment" checked="checked"  value="Management">
                                                  <%}else { %>
                                                    <input type="checkbox" name="vardepartment"   value="Management">
                                                  <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div> --%>
                                        </div>
                                    </div>
                                    
                                </div>
                            <br>
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <button type="submit" class="btn btn-primary btn-lg waves-effect btn-block">Submit</button>
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                        

                    </div>
                </div>
            </div>
            <%
                            }
                        }     
                       catch(Exception exception)
                       {
      	                   exception.printStackTrace();
                       } 
                  } 
                   %>
              
        </div>
    </section>
   <%@include file="include/footer.jsp"%>
   <script src="include/custom-script.js"></script>  
   <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    <script type="text/javascript">
      $("#userclient").submit(function(e){
	     e.preventDefault();
	    
	     var form=$(this);
    	 var formdata=new FormData($(form)[0]);
    	 var data={};
         formdata.forEach(function(value,key)
    	 {
    		 data[key]=value;
    	 });
         if(data.empid=='')
         {
            error('Please fill the Employee ID');
            return false;
         }
         else if(data.name=='')
         {
             error('Please fill the Employee Name');
             return false;
         }
         else if(data.email=='')
         {
             error('Please fill the Employee Email');
             return false;
         }
         else if(data.activitiondate=='')
         {
             error('Please fill the Activation Date');
             return false;
         }
         else if(data.designation=='')
         {
             error('Please fill the Designation');
             return false;
         }
         else if(data.designation=='')
         {
              error('Please fill the Location');
             return false;
         }
         
	     
 	      $("#usersubmit").prop("disabled", true);
	      $.ajax({
	    	       url:"process?action=clientdetail",
	    	       type:"POST",
	    	       dataType:"json",
	    	       data:$("#userclient").serialize(),
	    	       success:function(data,textStatus,jqXHR)
	    	       {
	    	    	  console.log(data);
	     	    	  if(data.status)
	    	          {
	     	    	   Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Successfully',
	     	    			  showConfirmButton: false,
	     	    			  timer: 3500
	     	    			})
	     	    			 
	     	    			 $("#usersubmit").prop("disabled", false);
	     	    	         setTimeout(function(){location.reload();},4500);
	     	    	       //  document.getElementById("myForm").reset();
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Something Wrong',
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
  	    			  title:'Something Wrong',
  	    			  text:"wrong",
  	    			  footer:'',
  	    			  timer:3000
  	    			}) 
	    	    }
	       
	      });  
   });  
      $(document).on('click','.delete',function(){
     	  
  	    let id=$(this).data('id');
  	    
  	    console.log(id);
  	    
  	    let element = $(this);
  	    Swal.fire({
  	    	  title: 'Are you sure?',
  	    	  text: "You won't be able to revert this!",
  	    	  icon: 'warning',
  	    	  showCancelButton: true,
  	    	  confirmButtonColor: '#3085d6',
  	    	  cancelButtonColor: '#d33',
  	    	  confirmButtonText: 'Yes, delete it!'
  	    	}).then((result) => {
  	    	  if (result.value) {
  	    	  
  	    		  $.ajax({
  	          	        url:"process?action=clientdetaildelete&id="+id,
  	          	        type:"POST",
  	          	        dataType:"json",
  	          	        success:function(data,textStatus,jqXHR)
  	          	        {
  	          	      	   if(data.status)
  	          	      	   {
  	          	      		   console.log(data);
  	          	      
  	          	      		   if(data.status){
  		          	      			Swal.fire({
  		          	      			     position: 'center',
  		          	      		         icon: 'success',
  		          	      		         title: 'Delete Subadmin Successfully',
  		          	      		         timer: 3500
  		          	      		    });
  		          	      	       $(element).parents('tr').remove();
  		          	      	       //delete_data('#customer-table');
  		          	      	   setTimeout(function(){location.reload();},4000);
  	          	              	}
  	          	      	   }
  	          	        
  	          	        },
  	            	    error:function(e)
  	            	    {
  	            		    	console.log("error in pages");
  	            		}
  	              });
  	    		  
  	    	   }
  	    	})
  	    
        });   
    </script>
  </body>
</html>
