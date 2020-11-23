<%@include file="include/session.jsp" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import= "java.util.Date" %>
<%@ page import= "java.text.SimpleDateFormat" %>
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
                <h2>Reporting Hub</h2>
            </div>
            <div class="row clearfix dashboardBlocks">
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="m-b-20 font-bold">Unbilled Report</div>
                            <div class="table-responsive">
                                <table class="table dashboard-task-infos display nowrap" style="width:100%" id="myTableone">
                                    <thead>
                                        <tr>
                                            
                                        <th>S.No.</th>
                                        <th>Company Name</th>
                                        <th>Storage</th>
                                        <th>Total Document</th> 
                                        <th>Month</th>
                                        <th>Payment Status</th>    
                                    
                                      
                                        </tr>
                                    </thead>
                                    <tbody>
                                                 <%
                              
                                               Date date = new Date();
                                   			   SimpleDateFormat simpleDateFormatM = new SimpleDateFormat("EEEE");
                                   			   simpleDateFormatM = new SimpleDateFormat("MMMM");
                                   			   SimpleDateFormat simpleDateFormatY = new SimpleDateFormat("EEEE");
                                   			   simpleDateFormatY = new SimpleDateFormat("YYYY");
                                               String currentdate=simpleDateFormatM.format(date).toUpperCase()+" , "+simpleDateFormatY.format(date).toUpperCase();
                             
                              try{
                                     Connection  connect=DBConnection.openConnection();
                                     PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.id as did, count(document_info.id) as total_doc,customer_details.id as id, sum(size) as size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.billing_month = '"+currentdate+"' AND company_id = '"+(int)session.getAttribute("id")+"'  GROUP BY document_info.billing_month");
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     int i=1;
                                    while(resultset.next())
                                    {
                                    	
                               %>
                                  
                                
                                    <tr>                                        
                                          <td><%=i %></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getFloat("size")+" MB "%></td>
                                          <td><%=resultset.getInt("total_doc")%></td>
                                          <td><a href="monthlydata.jsp?id=<%=resultset.getInt("did")%>"><%=resultset.getString("billing_month")%></a></td> 
                                         
                                          <td><span class="label bg-green">Unpaid</span></td>
                                    </tr>
                             <%	   
                             i++;
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
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="body">
                            <div class="font-bold m-b-20">Billed Report</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%" id="myTable">
                                    <thead>
                                        <tr>
                                          
                                        <th>S.No.</th>
                                        <th>Company Name</th>
                                        <th>Storage</th>
                                        <th>Total Document</th> 
                                        <th>Month</th>
                                        <th>Invoice</th>
                                        <th>Payment Status</th>     
                                        
                                       
                                        </tr>
                                    </thead>
                                    <tbody>
                           <%                    
                                 
                           
                           
                         //  SELECT document_info.id as did, customer_details.id as id, sum(size) as size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.billing_month != '"+currentdate+"' AND d.company_id = '"+(int)session.getAttribute("id")+"'  GROUP BY document_info.billing_month
                           
                           
                              try{
                                     Connection  connect=DBConnection.openConnection();
                                     PreparedStatement preparedStatement=connect.prepareStatement("SELECT document_info.bill_report, document_info.id as did, count(document_info.id) as total_doc, customer_details.id as id, sum(size) as size, billing_month, file_no, company_name, department, upload_date FROM customer_details, document_info WHERE document_info.company_id = customer_details.id AND document_info.billing_month != '"+currentdate+"' AND company_id = '"+(int)session.getAttribute("id")+"'  GROUP BY document_info.billing_month");
                                     ResultSet resultset=preparedStatement.executeQuery();
                                     int i=1;
                                    while(resultset.next())
                                    {
                                    	
                               %>
                                  
                                
                                    <tr>                                        
                                          <td><%=i %></td>
                                          <td><%=resultset.getString("company_name")%></td>
                                          <td><%=resultset.getFloat("size")+" MB "%></td>
                                          <td><%=resultset.getInt("total_doc")%></td>
                                          <td><a href="monthlydata.jsp?id=<%=resultset.getInt("did")%>"><%=resultset.getString("billing_month")%></a></td> 
                                           
                                             <%if(resultset.getString("bill_report")==null){ %>
                                                 <td></td>
                                             <%}else { %>
                                                 <td><%=resultset.getString("bill_report")%> </td>
                                             <%} %>
                                          <td><span class="label bg-green">paid</span></td>
                                         
                                    </tr>
                             <%	   
                             i++;
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
                <!-- #END# Latest Social Trends -->
                <!--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">Total Cloud Usage</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%">
                                    <thead>
                                        <tr>
                                            
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Status</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>100 GB</th>
                                            <td>100</td>
                                            <td><span class="label bg-green">Paid</span></td>
                                            
                                        </tr>
                                        <tr>
                                            <th>200 GB</th>
                                            <td>200</td>
                                            <td><span class="label bg-green">Unpaid</span></td>
                                            
                                        </tr>
                                        <tr>
                                            <th>300 GB</th>
                                            <td>300</td>
                                            <td><span class="label bg-green">Pending</span></td>
                                            
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body">
                            <div class="font-bold m-b-20">Department Usage</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%">
                                    <thead>
                                        <tr>
                                            
                                            <th>Department</th>
                                            <th>Uploads</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            
                                            <td>A</td>
                                            <td><span class="label bg-green">700 MB</span></td>
                                            
                                        </tr>
                                        <tr>
                                            
                                            <td>B</td>
                                            <td><span class="label bg-green">300 MB</span></td>
                                            
                                        </tr>
                                        <tr>
                                            
                                            <td>C</td>
                                            <td><span class="label bg-green">200 MB</span></td>
                                            
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-body">
                            <div class="font-bold m-b-20">File Report</div>

                            
                            <div class="table-responsive">
                                <table class="table  dashboard-task-infos display nowrap" style="width:100%">
                                    <thead>
                                        <tr>
                                            
                                            <th>Upload Date</th>
                                            <th>File No.</th>
                                            <th>File Size</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            
                                            <td>21/10/2019</td>
                                            <td>F1</td>
                                            <td>150 MB</td>                                          
                                        </tr>
                                        <tr>
                                            
                                            <td>21/10/2019</td>
                                            <td>F2</td>
                                            <td>250 MB</td>                                         
                                        </tr>
                                        <tr>
                                            
                                            <td>21/10/2019</td>
                                            <td>F3</td>
                                            <td>300 MB</td>                                          
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>-->
<!--  
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header  margin0">
                            
                            <div class="row">
                                <div class="">
                                    <h2 class="col-md-4 col-lg-4 col-xs-12 pull-left">
                                        <div class="m-t-10">
                                            VIEW LOGS
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
                    <!--     <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th width="15%">Client Name</th>
                                        <th>Company Name</th>
                                        <th>Date of Creation</th>
                                        <th>Created by</th>
                                        <th>Email</th>
                                        <th>Department</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>Demo Name</td>
                                        <td>Demo Company</td>
                                        <td>21 Aug 2019</td>
                                        <td>Demo Title</td>
                                        <td>demo@gmail.com</td>
                                        <td>ABC Department</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            </div>
                        </div> -->
                    </div>
                </div>
 
            </div>
        </div>
    </section>
<%@include file="include/footer.jsp" %>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.0/js/buttons.print.min.js"></script>
     <script>
     $(document).ready( function () {
    	  $('#myTable').DataTable( {
              dom: 'Bfrtip',
              buttons: [
                  'copy', 'csv', 'excel', 'pdf', 'print'
              ] 
          } );
     } );
     
     $(document).ready( function () {
   	  $('#myTableone').DataTable( {
             dom: 'Bfrtip',
             buttons: [
                 'copy', 'csv', 'excel', 'pdf', 'print'
             ] 
         } );
    } );

   </script>
</body>

</html>
