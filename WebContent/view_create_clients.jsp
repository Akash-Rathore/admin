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
                            <form action="process?action=clientdetail" method="POST">    
                            
                                <legend>User Information:</legend>
                                <div class="row clearfix">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <div class="form-group form-float ">
                                            <div class="form-line">
                                                <input type="text" name="softdocnum" class="form-control"  required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="empid" class="form-control" required="required">
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="name" class="form-control" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="email" name="email" class="form-control">
                                               
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="joindate"  class="form-control">
                                              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">     
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="activitiondate" class="form-control" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="department" class="form-control" required="required">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="designation" class="form-control" required="required">
                                              
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="location" class="form-control" required="required">
                                               
                                            </div>
                                        </div>
                                    </div>                             
                                </div>
                                
                            <br>
                            <fieldset>
                                <legend>Access Information</legend>
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            Select Department
                                        </div>
                                        <div class="col-md-9">
                                            <div class="col-md-3">
                                                <label class="container">HR
                                                <input type="checkbox" name="vardepartment"  value="hr">
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="container">Sales
                                                <input type="checkbox" name="vardepartment"  value="sales">
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="container">Purchase
                                                <input type="checkbox" name="vardepartment"   value="purchase">
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </fieldset>
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
                        try
                        {
                            Connection connection=DBConnection.openConnection();
                            String  sql="SELECT `softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment` FROM `client_details` WHERE id='"+id+"'";
                            PreparedStatement  preparedStatement=connection.prepareStatement(sql);
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
                                                <input type="text" name="softdocnum"  value="<%=resultset.getString("softdoc_id")%>" class="form-control" placeholder="Softdoc No." disabled="disabled">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="empid" value="<%=resultset.getString("employee_id")%>" class="form-control" placeholder="Employee ID"  disabled="disabled">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="name" value="<%=resultset.getString("employee_name")%>" placeholder="Employee Name" class="form-control" disabled="disabled">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="email" name="email" value="<%=resultset.getString("emp_email_id")%>" placeholder="Employee Email ID" class="form-control" disabled="disabled">
                                               
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="joindate"  value="<%=resultset.getString("joining_date")%>" class="form-control" placeholder="Joining Date" disabled="disabled">
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">     
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" name="activitiondate" value="<%=resultset.getString("activation_date")%>" class="form-control" placeholder="Activation Date" disabled="disabled">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="department" value="<%=resultset.getString("department")%>" class="form-control" placeholder="Department" disabled="disabled">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row clearfix">    
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="designation" value="<%=resultset.getString("designation")%>" class="form-control" placeholder="Designation" disabled="disabled">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="text" name="location" class="form-control" value="<%=resultset.getString("location")%>"  placeholder="Location" disabled="disabled">
                                               
                                            </div>
                                        </div>
                                    </div>                             
                                </div>  
                            <br>
                            <div class="row" style="text-decoration:underline"><center><h4>Access Information</h4></center></div>
                            	<br>
                                <legend>Access Information</legend>
                                <%
                                     String deptinfo =resultset.getString("selectdepartment");
                                     String array[]=deptinfo.split(",");
                                     List<String> list= Arrays.asList(array);
                                 %>
                                <div class="row clearfix">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            Select Department
                                        </div>
                                        <div class="col-md-9">
                                            <div class="col-md-3">
                                                <label class="container">HR
                                                <% if(list.contains("hr")) { %>
                                                     <input type="checkbox" name="vardepartment" checked="checked" value="hr" disabled="disabled">
                                                <%}else { %>
                                                    <input type="checkbox" name="vardepartment"  value="hr" disabled="disabled">
                                                <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="container">Sales
                                                <% if(list.contains("sales")) { %>
                                                <input type="checkbox" name="vardepartment" checked="checked" value="sales" disabled="disabled">
                                                <%}else { %>
                                                <input type="checkbox" name="vardepartment"  value="sales" disabled="disabled">
                                                 <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="container">Purchase
                                                <% if(list.contains("purchase")) { %>
                                                   <input type="checkbox" name="vardepartment" checked="checked"  value="purchase" disabled="disabled">
                                                <%}else { %>
                                                   <input type="checkbox" name="vardepartment"   value="purchase" disabled="disabled">
                                                  <% } %>
                                                  <span class="checkmark"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
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
             <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            LIST OF CLIENTS
                                        </div>
                                    </h2>
                                    <div class="col-md-7 col-lg-7 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-2 m-t-10">
                                            <h2 class="">Filter</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control">
                                                    <label class="form-label">Search</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                            <div class="">
                                                <select class="form-control show-tick">
                                                    <option value="">Type of Documents</option>
                                                    <option value="">Business</option>
                                                    <option value="">Personal</option>
                                                    <option value="">Confidential</option>
                                                </select>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                   <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th width="15%">Name</th>
                                        <th>Designation</th>
                                        <th>Email</th>
                                        <th>Location</th>
                                        <th>Department</th>
                                        <th>Joining Date</th>
                                        <th>Activation Date</th>
                                        <th width="20%">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                    
                       <%
                           HttpSession sess=request.getSession();
    		               int customer_id=(int)session.getAttribute("id");
    		            
                            try
                           {
                               Connection  connection=DBConnection.openConnection();
                               String sql="SELECT `id`,`softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment` FROM `client_details` where `customer_id`='"+customer_id+"'";
                               PreparedStatement  preparedStatement=connection.prepareStatement(sql);
                               ResultSet resultset=preparedStatement.executeQuery();
                               int i=1;
                               while(resultset.next())
                               {
                      %>
                      
                                 <tr>
                                        <td><%=i%></td>
                                        <td><%=resultset.getString("employee_name")%></td>
                                        <td><%=resultset.getString("designation")%></td>
                                        <td><%=resultset.getString("emp_email_id")%></td>
                                        <td><%=resultset.getString("location")%></td>
                                        <td><%=resultset.getString("selectdepartment")%></td>
                                        <td><%=resultset.getString("joining_date")%></td>
                                        <td><%=resultset.getString("activation_date")%></td>
                                        <td>
                                            <a id="" href="create_clients.jsp?id=<%=resultset.getString("id")%>" title="Modify Access"><i class="material-icons">edit</i></a>
                                            <a id="" href="view_create_clients.jsp?id=<%=resultset.getString("id")%>" title="Modify Access"><i class="material-icons">remove_red_eye</i></a>
                                            <%-- <a id="" href="process?action=clientdetaildelete&id=<%=resultset.getString("id")%>" title="Modify Access"><i class="material-icons">delete</i></a> --%>
                                            <a class='delete' role="button" data-id='<%=resultset.getInt("id")%>'><i class="material-icons">delete</i></a>
                                        </td>
                                      </tr>
                                      <%
                                      i++;
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
                           
                                
                               </tbody>
                              </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
   <%@include file="include/footer.jsp"%>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script type="text/javascript">
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
