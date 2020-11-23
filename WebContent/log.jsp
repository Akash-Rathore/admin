<%@ page import="com.customeradmin.connection.DBConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="include/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
    function reportfilter(str) {
        
        var start_date = $('#start_date').val();
    	var end_date = $('#end_date').val(); 
       alert(start_date);    
    	   
       if (str=="") {
          document.getElementById("txtHint1").innerHTML="";
          return;
        }
        if (window.XMLHttpRequest) {
          // code for IE7+, Firefox, Chrome, Opera, Safari
          xmlhttp=new XMLHttpRequest();
        } else { // code for IE6, IE5
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function() {
          if (this.readyState==4 && this.status==200) {
            document.getElementById("txtHint1").innerHTML=this.responseText;
          }
        }
         
          xmlhttp.open("POST","ajax-report.jsp?start="+start_date+"&end="+end_date,true); 
          xmlhttp.send();
      }
    
    </script>
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
                    Log Report
                </h2>
            </div>
            
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            Log Reports
                                        </div>
                                    </h2>
                                        <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-1">
                                            <h2 class="">From</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" id="start_date" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 class="">To</h2>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" id="end_date" class="form-control">
                                            </div>
                                        </div>
                                         </div>
                                       <div class="col-md-4">
     								       <input type="button" name="search" onclick="reportfilter(this.value)" value="Search" class="btn btn-info" />
      						           </div>
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="example" >
                                <thead>
                                    <tr>
                                         <th>S.No.</th>
                                         <th width="15%">Login ID</th>
                                         <th>System IP</th>
                                         <th>Login Time</th>
                                         <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="txtHint1">
                                     <%
                                        try
                                        {
                                    	     Connection  connection=DBConnection.openConnection();
                                    	     PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM logfile, client_details WHERE logfile.user_id = client_details.customer_id AND logfile.role='customeradmin' AND logfile.user_id = '"+(int)session.getAttribute("id")+"' ORDER BY logfile.id DESC");
                                             ResultSet resultset=preparedStatement.executeQuery();
                                             int i = 1;
                                             while(resultset.next())
                                            {
                                            	
                                   %>
                                     <tr>
                                        <td><%=i %></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                        <td><%=resultset.getTimestamp("logintime")%></td>
                                        <td><%=resultset.getString("action")%></td>
                                        
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
                              <!-- <div class="m-t-10" style="float:right;">
                                    <a href="download_log.jsp" class="btn btn-primary" role="button">Generate Report</a>
                                </div> -->
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
                                             MyLog Report
                                        </div>
                                    </h2>
                                  <!--   <div class="col-md-8 col-lg-8 col-xs-12 pull-right accessCutomerTable">
                                        <div class="col-md-1">
                                            <h2 class="">From</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <h2 class="">To</h2>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group form-float">
                                            <div class="form-line">
                                                <input type="date" class="form-control">
                                            </div>
                                        </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="examplemy" >
                                <thead>
                                    <tr>
                                         <th>S.No.</th>
                                         <th width="15%">Login ID</th>
                                         <th>System IP</th>
                                         <th>Login Time</th>
                                         <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <%
                                        try{
                                    	     Connection  connection=DBConnection.openConnection();
                                    	     PreparedStatement preparedStatement=connection.prepareStatement("SELECT * FROM `logfile` WHERE loginid = '"+email+"' AND role='customeradmin' ORDER BY id DESC");
                                    	     ResultSet resultset=preparedStatement.executeQuery();
                                             int i = 1;
                                             while(resultset.next())
                                             {
                                            	
                                   %>
                                     <tr>
                                        <td><%=i %></td>
                                        <td><%=resultset.getString("loginid")%></td>
                                        <td><%=resultset.getString("ip")%></td>
                                        <td><%=resultset.getTimestamp("logintime")%></td>
                                        <td><%=resultset.getString("action")%></td>
                                        
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
                             <!--  <div class="m-t-10" style="float:right;">
                                      <a href="mylog.jsp" class="btn btn-primary" role="button">Generate Report</a>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

    <!-- Jquery Core Js -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

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
    
    <script src="js/pages/forms/basic-form-elements.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>


    <script>
        $(document).ready(function() {
            $('#example').DataTable( {
            	  dom: 'Bfrtip',
                  buttons: [
                      'copy', 'csv', 'excel', 'pdf', 'print'
                  ] 
            } );
        } );
        $(document).ready(function() {
            $('#examplemy').DataTable( {
            	dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ] 
            } );
        } );
    </script>
</body>

</html>
