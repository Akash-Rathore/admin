      <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="images/user.png" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></div>
                    <div class="email"></div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="profile.jsp"><i class="material-icons">person</i>Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="process?action=logout"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="<% if(request.getRequestURI().equals("/customeradmin/dashboard.jsp")) { out.print("active"); } %>">
                        <a href="dashboard.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/customeradmin/activity.jsp")){ out.print("active"); }%>">
                        <a href="activity.jsp">
                            <i class="material-icons">accessibility</i>
                            <span>Activity</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/customeradmin/user.jsp")){ out.print("active"); }%>">
                        <a href="user.jsp">
                            <i class="material-icons">supervised_user_circle</i>
                            <span>Users</span>
                        </a>
                    </li>
                    <li class="<% if(request.getRequestURI().equals("/customeradmin/reporting.jsp")){ out.print("active"); }%>" >
                        <a href="reporting.jsp">
                            <i class="material-icons">file_copy</i>
                            <span>Reporting Hub</span>
                        </a>
                    </li>
                  <!--   <li>
                        <a href="complaint_hub.jsp">
                            <i class="material-icons">policy</i>
                            <span>Complaint Hub</span>
                        </a>
                    </li> -->
                     <li class="<% if(request.getRequestURI().equals("/customeradmin/cloud_usage.jsp")){ out.print("active"); }%>">
                        <a href="cloud_usage.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>Cloud Usage</span>
                        </a>
                    </li> 
                     <li class="<% if(request.getRequestURI().equals("/customeradmin/log.jsp")){ out.print("active"); }%>">
                        <a href="log.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>log Reports</span>
                        </a>
                    </li>
                    <li  class="<% if(request.getRequestURI().equals("/customeradmin/support.jsp")){ out.print("active"); }%>">
                        <a href="support.jsp">
                            <i class="material-icons">settings_applications</i>
                            <span>Support</span>
                        </a>
                    </li>
                   
                    
                    <li>
                        <a href="process?action=logout">
                            <i class="material-icons">lock</i>
                            <span>Logout</span>
                        </a>
                    </li>
                     
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2019 <a href="dashboard.jsp">SoftDoc</a>. All Right Reserved
                </div>

            </div>
            <!-- #Footer -->
        </aside>
