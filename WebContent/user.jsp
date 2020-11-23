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
    <link href="http://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
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
                    User Details
                </h2>
            </div>
            
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            <h2> User Details </h2>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="myTable">
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
                                        <th width="15%">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                       </div>
                        <%!
                          String sql=null;
                          Connection connection=null;
                          ResultSet resultset=null;
                          PreparedStatement  preparedStatement=null;
                       %>
                       
                           
                          
                       <%
                          HttpSession sess=request.getSession();
    		              int customer_id=(int)session.getAttribute("id");
    		            
                            try(Connection connection=DBConnection.openConnection(); PreparedStatement  preparedStatement=connection.prepareStatement("SELECT `id`,`softdoc_id`, `employee_id`, `employee_name`, `emp_email_id`, `joining_date`, `activation_date`, `department`, `designation`, `location`, `selectdepartment` FROM `client_details` where `customer_id`='"+customer_id+"'and flag=0");)
                           {
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
                                            <%--<a id="" href="process?action=clientdetaildelete&id=<%=resultset.getString("id")%>" title="Modify Access"><i class="material-icons">delete</i></a>--%>
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
                            <div class="m-t-10" style="float:right;">
                                <button class="btn btn-primary" onclick="window.location.href='create_clients.jsp'">Add Users</button>
                                <button class="btn btn-primary" onclick="window.location.href='downloaduser.jsp'">Download</button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
     </section>
   <%@include file="include/footer.jsp" %>
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
   <script src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
     <script>
     $(document).ready( function () {
    	  $('#myTable').DataTable( {
              dom: 'Bfrtip',
              buttons: [
                  'copy', 'csv', 'excel', 'pdf', 'print'
              ] 
          } );
     } );
 
   </script>
  </body>
</html>
