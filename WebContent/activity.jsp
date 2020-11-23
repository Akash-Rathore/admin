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
        <%@include file="include/sidebar.jsp"%>
       <!-- #END# Left Sidebar -->
        
    </section>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Current Activity
                    
                </h2>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="col-md-7 p-l-0 p-t-10">Current Activity</h2>
                           
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped m-b-0" id="mytable">
                                    <thead>
                                        <tr>
                                            <th>S.No.</th>
                                            <th>File Number</th>
                                            <th>Pickup Date</th>
                                            <th>Tracking Info</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    
                                                           
                         <%                 
                           try(Connection  connection=DBConnection.openConnection();  PreparedStatement  preparedStatement=connection.prepareStatement("SELECT df.file_no as file_no,df.pickup_date as pickup_date,df.status as status FROM `document_info` df,customer_details cd WHERE df.company_id=cd.id and cd.id='"+(int)session.getAttribute("id")+"' order by pickup_date");)
                           {
                                ResultSet resultset=preparedStatement.executeQuery();
                                int i=1;
                                if(resultset.next())
                                {
                           %>
                                   <tr> 
                                          <th><%=i%></th>
                                          <th><%=resultset.getString("file_no")%></th>
                                          <td><%=resultset.getString("pickup_date")%></td>
                                          <% if(resultset.getString("status").equals("store")){ %>
                                               <td><%="PICKED UP"%></td>
                                          <% }else if(resultset.getString("status").equals("indexing")){ %>
                                               <td><%="PICKED UP --> INDEXING "%></td> 
                                           <%}else if(resultset.getString("status").equals("quality")){ %> 
                                               <td><%="PICKED UP --> QUALITY"%></td> 
                                          <%}else if(resultset.getString("status").equals("completed")){ %> 
                                               <td><%="LIVE"%></td> 
                                          <%} %>        
                                           
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
  <%@include file="include/footer.jsp" %>
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
