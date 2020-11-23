<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>CUSTOMER ADMIN</title>
    <!-- Favicon-->
    <link rel="icon" href="images/favicon.png" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
                <a class="navbar-brand" href="index.jsp">CUSTOMER ADMIN	</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- Notifications -->
                        <%@include file="include/notification.jsp" %>
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
                   Monthly Files
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">	
                        	<div class="col-md-8">
	                            <h2>
	                                 Monthly Files
	                            </h2>
                            </div>
                             <br><br>
                            <div class="col-md-3">
	                          	
                       		</div>
                            
                           
                        </div>
                       	
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>	 
                                    	<!-- <th>File No.</th> -->
                                        <th>Department</th>
                                        <th>Size</th>
                                        <th>Status</th>
                                        <th>Month</th>
                                        <th width="15%">Created Date</th>
                                    	<!-- <th>Upload Bill</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                              
                         
                              
                              
                              <%
                              
                              
                              int did = Integer.parseInt(request.getParameter("id"));
                             
                              try{
                                     Connection  connect=DBConnection.openConnection();
                                     PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM document_info WHERE billing_month = (SELECT billing_month FROM document_info WHERE id ='"+did+"') AND company_id = (SELECT company_id FROM document_info WHERE id ='"+did+"') GROUP BY file_no");
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     
                                    while(resultset.next())
                                    {
                                    	
                               %>
                                  
                                
                                    <tr>                                        
                                         <%--  <td><%=resultset.getString("file_no")%></td> --%>
                                          <td><%=resultset.getString("department")%></td>
                                          <td><%=resultset.getFloat("size")+" MB "%></td>
                                          <td><%=resultset.getString("status")%></td>
                                          <td><%=resultset.getString("billing_month")%></td> 
                                          <td><%=resultset.getTimestamp("upload_date")%></td>
                                        
                                    </tr>
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
                                 
                                 
                                   
                                </tbody>
                                </table>
                            </div>    
                        </div>
                    </div>
                </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
    

    /*   $( "#target" ).submit(function( event ) {
    		  
    	      event.preventDefault();
    	       var data={
    	    		      companyid:$('#companyid').val(),
    	    		      billingmonth:$('#billingmonth').val()
    	              }
    		    console.log(data);
    		}); */
     
   </script>
</body>

</html>
