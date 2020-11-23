<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp"%>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/1.6.0/css/buttons.bootstrap.min.css" rel="stylesheet" />
 
  
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
                    Cloud Usage Report
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
                                            Cloud Usage Report
                                        </div>
                                    </h2>
                                 
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%" id="mytable">
                                    <thead>
                                        <tr>
                                            <th>S.NO.</th>
                                            <th>Company Name</th>
                                            <th>Total Usage</th>
                                            <th>Current Usage</th>
                                            <th>month</th>
                                          <!--   <th>Storage</th> 
                                           -->  
                                        </tr>
                                    </thead>
                                    <tbody>
                           <%
                                  
                                try{
                                	 Connection  connect=DBConnection.openConnection();
                                     PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.id as did, count(document_info.id) as total_doc,customer_details.id as id, sum(size) as size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id  AND company_id = '"+(int)session.getAttribute("id")+"' GROUP BY document_info.billing_month");
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     int i=1;    
                                     while(resultset.next())
                                    {
                                    	
                               %>
                                    
                                        <tr>
                                             <td><%=i%></td>
                                             <td><%=resultset.getString("company_name")%></td>
                                             <td><%=resultset.getString("total_doc")%></td>
                                             <td><%=resultset.getInt("size")+"MB"%></td>
                                             <td><%=resultset.getString("billing_month")%></td>
                                            <%--
                                                <td><%=resultset.getString("billing_month")%></td>
                                             --%>
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
<!--                                 <div class="m-t-10" style="float:right;">
                                    <a href="download_usage.jsp" role="button" class="btn btn-primary">Generate Usage Report</a>
                                </div>
 -->                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </section>

    <%@include file="include/footer.jsp"%>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            $('#mytable').DataTable( {
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            } );
        } );
        
    </script>
    
</body>
</html>
