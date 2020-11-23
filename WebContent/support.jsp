<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>CUSTOMER ADMIN | SOFTDOC</title>
    <!-- Favicon-->
    <link rel="icon" href="images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Bootstrap Select Css -->
    <link href="plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="css/themes/all-themes.css" rel="stylesheet" />
    <!-- Datatable-->
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
       <%@include file="include/sidebar.jsp" %>
         <!-- #END# Left Sidebar -->
        
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Help & Support
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Support
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                            <p>
                                For any Query
                                   <%
                               try{
                                     Connection  connect=DBConnection.openConnection();
                                     PreparedStatement preparedStatement=connect.prepareStatement("SELECT `mobile`, `email` FROM `softdoc_staff` WHERE `role`='admin'");
                                     ResultSet resultset=preparedStatement.executeQuery();
                                  
                                    if(resultset.next())
                                    {
                              %>
                                    <h5>
                                        Call:<%=resultset.getLong("mobile")%>
                                    </h5>
                                    <h5>
                                      Mail at:<%=resultset.getString("email")%>
                                    </h5>
                                   <%	   
                                    }
                               }
                              catch(SQLException sqlexception )
                              {
                            	  sqlexception.printStackTrace();
                              }
                              catch(Exception exception)
                              {
                            	  exception.printStackTrace();
                              }
                             %> 
                           
                               
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                    <div class="m-t-10">
                                        FAQs
                                    </div>
                                </h2>
                            </div>
                        </div>
                        <% 
                             try(Connection  connection=DBConnection.openConnection();PreparedStatement preparedStat=connection.prepareStatement("SELECT `title`, `description` FROM `faq`");)
                             {
                                    ResultSet result=preparedStat.executeQuery();
                                    while(result.next())
                                    {
                               %>
                                      <div class="header">
                                      	<div class="row">
                                      		<button type="button" style="margin-left:15px;" class="btn btn-info" data-toggle="collapse" data-target="#demo">Ques</button>
                                      		<strong><%=result.getString("title")%></strong>
                                      	</div>
                                          
                                          <div id="demo" style="margin-top:10px">
                                              <%=result.getString("description")%> 
                                          </div>
                                      </div>
                             <%	   
                                    }
                               }
                              catch(SQLException sqlexception )
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
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Complaint List
                                        </div>
                                    </h2>
                                   
                                </div>
                            </div>
                        </div>
                        
                        <div class="body">
                            <div class="table-responsive">

                                <table class="table table-bordered table-striped table-hover" id="myTable">
                                    <thead>
                                        <tr>
                                            <th>Complain ID</th>
                                            <th>Company name</th>
                                            <th>Username</th>
                                            <th>Raised On</th>
                                            <th>Department</th>
                                            <th>Status</th> 
                                            
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                          <%
                                    
                                      try(Connection  connection=DBConnection.openConnection();PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM customer_details,complain_list WHERE customer_details.id=complain_list.customer_id ORDER BY id DESC");){
                                    	    
                                    	    ResultSet resultset=preparedStatement.executeQuery();
                                            
                                            while(resultset.next())
                                            {
                                     %>          
                                     
                                     
                                   
                                        <tr>
                                        	
                                        	<td><a href="#my_modal_<%=resultset.getString("complain_id")%>"  data-toggle="modal"><%=resultset.getString("complain_id")%></a></td>
                                            <td><%=resultset.getString("company_name")%></td>
                                            <td><%=resultset.getString("username")%></td>
                                            <td><%=resultset.getTimestamp("date")%></td>
                                            
                                            <td><%=resultset.getString("department")%></td>
                                            <td><%=resultset.getString("status")%></td> 
	                                            <td width="15%">
	                                                <select class="form-control status"  data-id="<%=resultset.getString("id")%>">
	                                            		<option value="<%=resultset.getString("status")%>"><%=resultset.getString("status")%></option>
	                                            		<option value="Raised">Raised</option>
	                                            		<option value="Pending">Pending</option>
	                                            		<option value="Complete">Complete</option>
	                                                 </select>
	                                           </td>
                                        </tr>
                                        
                                          	<div class="modal" id="my_modal_<%=resultset.getString("complain_id")%>">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											          <h4 class="modal-title">Complain Description</h4>
											      </div>
											      <div class="modal-body">
											        <p><%=resultset.getString("comment")%></p>
											          
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											      </div>
											    </div>
											  </div>
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
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
        <div class="row">
	       <div class="col-md-12">
	             <center>
	                 <a href="complaint_hub.jsp" class="btn btn-danger btn-lg" role="button">Raise A Complaint</a>
	            </center>
	      </div>
       </div> 
    </section>

    <!-- Jquery Core Js -->
    <script src="plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="plugins/node-waves/waves.js"></script>

    <!-- Chart Plugins Js -->
    <script src="plugins/chartjs/Chart.bundle.js"></script>

    <!-- Custom Js -->
    <script src="js/admin.js"></script>
    <script src="js/pages/charts/chartjs.js"></script>

    <!-- Demo Js -->
    <script src="js/demo.js"></script>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
