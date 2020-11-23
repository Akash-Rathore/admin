<%@page import="com.customeradmin.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
 
              
 
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
                            <i class="material-icons">notifications</i>
                            <span class="label-count">5</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">NOTIFICATIONS</li>
                            
                              <%
                             try{
                                   Connection  connect=DBConnection.openConnection();
                                   PreparedStatement preparedStatement=connect.prepareStatement("SELECT `logintime`, `action` FROM `logfile` where role='customeradmin' ORDER BY id DESC LIMIT 5");
                                   
                                   ResultSet result=preparedStatement.executeQuery();
                                   int i = 1;
                                   while(result.next())
                                   {
                                	   
                             %>
                             
                             
                           
                          <li class="body">
                                <ul class="menu" style="overflow:hidden">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-light-green">
                                                <i class="material-icons">person_add</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><%=result.getString("action")%></h4>
                                                <p>
                                                    <i class="material-icons">access_time</i><%=result.getTimestamp("logintime")%>
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                <!--     <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-cyan">
                                                <i class="material-icons">add_shopping_cart</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>4 sales made</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 22 mins ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-red">
                                                <i class="material-icons">delete_forever</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>Nancy Doe</b> deleted account</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 3 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-orange">
                                                <i class="material-icons">mode_edit</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>Nancy</b> changed name</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 2 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-blue-grey">
                                                <i class="material-icons">comment</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>John</b> commented your post</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 4 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-light-green">
                                                <i class="material-icons">cached</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4><b>John</b> updated status</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> 3 hours ago
                                                </p>
                                            </div>
                                        </a>
                                    </li>
                                 -->    
                                    
                                    
                                  <!--   <li>
                                        <a href="javascript:void(0);">
                                            <div class="icon-circle bg-purple">
                                                <i class="material-icons">settings</i>
                                            </div>
                                            <div class="menu-info">
                                                <h4>Settings updated</h4>
                                                <p>
                                                    <i class="material-icons">access_time</i> Yesterday
                                                </p>
                                            </div>
                                        </a>
                                    </li> -->
                                </ul>
                            </li>
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
                            <li class="footer">
                                <a href="log.jsp">View All Notifications</a>
                            </li>
                        </ul>
                    </li>
       