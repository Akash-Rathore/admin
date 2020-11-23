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
                <h2>Dashboard</h2>
            </div>
            <div class="row clearfix">
           
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                 <a href="profile.jsp">   
                    <div class="info-box bg-pink hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">public</i>
                        </div>
                        <div class="content">
                            <div class="text">My profile</div>
                            <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a>   
                </div>
                 
                 <a href="activity.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">help</i>
                        </div>
                        <div class="content">
                            <div class="text">Activity</div>
                            <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                   </a>
                </div>
                 <a href="user.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                                          
                         <%
                         HttpSession sess=request.getSession();
   		                 int customer_id=(int)session.getAttribute("id");
                             try
                               {
                            	  Connection connection=DBConnection.openConnection();
                            	  PreparedStatement preparedStatement=connection.prepareStatement("SELECT count(id) as Number FROM `client_details` where `customer_id`='"+customer_id+"'");
                                  ResultSet resultset=preparedStatement.executeQuery();
                                 
                                 if(resultset.next())
                                 {
                            	   
                       
                          %>
                            <div class="content">
                                
                                <div class="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Users</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("Number")%></strong></div>
                                <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                            </div>
                           <% 
                                           
                                      } 
                                   }
                                  catch(Exception e)
                                  {
                                     e.printStackTrace();	 
                                  }
                             %>
                        
                        
                        
                        
                        
                        
                        
                       
                    </div>
                    </a>
                </div>
                <a href="reporting.jsp">
                  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                        <div class="content">
                            <div class="text">Reporting Hub</div>
                            <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                   </div>
                </a>
            </div>
            <div class="row clearfix">
             <a href="complaint_hub.jsp">
                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        
                       
                        <div class="content">
                            <div class="text">Complaint Hub</div>
                            
                            <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                         
                    
                    </div>
                  </div>
                </a> 
                
               <a href="cloud_usage.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">forum</i>
                        </div>
                            <%
                             try
                               {
                            	 Connection connection=DBConnection.openConnection();
                            	 PreparedStatement preparedStatement=connection.prepareStatement("SELECT Sum(size) as size FROM `document_info` where company_id='"+(int)session.getAttribute("id")+"'");
                                 ResultSet resultset=preparedStatement.executeQuery();
                                 
                                 if(resultset.next())
                                 {
                            	   
                             %>
                        
                        <div class="content">
                             <div class="text">&nbsp;&nbsp;&nbsp;<titles style="font-size:15px;">Cloud Usage</titles> &nbsp;&nbsp;&nbsp;<strong style="font-size:30px;"><%=resultset.getInt("size")+"MB"%></strong></div>
                             <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
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
                 </a>
                </div>
                
             <a href="log.jsp">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">help</i>
                        </div>
                        <div class="content">
                            <div class="text">log Reports</div>
                            <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                  </a>
                </div> 
                
             
                
                
            </div>
            <div class="row clearfix">
                <!-- Visitors -->
                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5"  style="height:180px;">
                    <div class="card">
                        <div class="body bg-pink">
                            <div class="m-b--35 font-bold">COMPLAINT LOG</div>
                            <ul class="dashboard-stat-list"  style="height:200px;">
                             <%
                               try{
                            	   
                                    Connection  connect=DBConnection.openConnection();
                                    PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM complain_list, client_details WHERE complain_list.customer_id = client_details.id AND client_details.customer_id = '"+(int)session.getAttribute("id")+"'");
                                    ResultSet result=preparedStatement.executeQuery();
                                    int i = 1;
                                    while(result.next())
                                    {
                                %>
                            
                                <li>
                                   
                                   <%=result.getString("complain_id")%>
                                    <span class="pull-right">
                                        <a href="complaint_hub.jsp"><i class="material-icons">trending_up</i></a>
                                    </span>
                                </li>
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
                                
                          
                            </ul>
                             <center><a role="button" class="btn" class="font-bold" href="complaint_hub.jsp" style="color:white">View More</i></a></center>
                        </div>
                    </div>
                </div>
                <!-- #END# Visitors -->
                <!-- Latest Social Trends -->
                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-cyan">
                            <div class="m-b--35 font-bold">ACTIVITY LOG</div>
                            <ul class="dashboard-stat-list">
                              
                                <%
                               try{
                                    Connection  connect=DBConnection.openConnection();
                                    PreparedStatement preparedStatement=connect.prepareStatement("SELECT * FROM logfile, client_details WHERE logfile.user_id = client_details.customer_id AND logfile.role='customeradmin' AND logfile.user_id = '"+(int)session.getAttribute("id")+"' ORDER BY logfile.id DESC LIMIT 5");
                                    ResultSet result=preparedStatement.executeQuery();
                                    int i = 1;
                                    while(result.next())
                                    {
                                %>
                              
                              
                                <li>
                                   <%=result.getString("action")%>
                                    <span class="pull-right">
                                        <i class="material-icons">trending_up</i>
                                    </span>
                                </li>
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
                            </ul>
                                
                            <center><a role="button" class="btn" class="font-bold" href="log.jsp" style="color:white">View More</i></a></center>
                            
                        </div>
                    </div>
                </div>
                <!-- #END# Latest Social Trends -->
                <!-- Answered Tickets -->
               <!--  <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="body bg-teal">
                            <div class="font-bold m-b--35">ACTIVITY LOG</div>
                            <ul class="dashboard-stat-list">
                                <li>
                                    TODAY
                                    <span class="pull-right"><b>12</b> <small>TICKETS</small></span>
                                </li>
                                <li>
                                    YESTERDAY
                                    <span class="pull-right"><b>15</b> <small>TICKETS</small></span>
                                </li>
                                <li>
                                    LAST WEEK
                                    <span class="pull-right"><b>90</b> <small>TICKETS</small></span>
                                </li>
                                <li>
                                    LAST MONTH
                                    <span class="pull-right"><b>342</b> <small>TICKETS</small></span>
                                </li>
                                <li>
                                    LAST YEAR
                                    <span class="pull-right"><b>4 225</b> <small>TICKETS</small></span>
                                </li>
                                <li>
                                    ALL
                                    <span class="pull-right"><b>8 752</b> <small>TICKETS</small></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
 -->                <!-- #END# Answered Tickets -->
            </div>
        </div>
    </section>
  <%@include file="include/footer.jsp"%>
</body>

</html>
