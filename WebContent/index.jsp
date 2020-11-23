<%        
           response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
           String user=(String)session.getAttribute("Email");
           if(user!=null)
           {
        	   response.sendRedirect("dashboard.jsp");
           }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, name="viewport">
    <title>Log IN | SoftDoc</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Customer <strong>Admin</strong></a>
            <!-- <small>Admin BootStrap Based - Material Design</small> -->
        </div>
        <div class="card">
            <div class="body">
                <form action="loginService" method="POST" id="sign_in" >
                    <div class="msg">Sign in to start your session</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" id="email" name="email" placeholder="john.doe@example.com" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" id="password" name="password" placeholder="**********" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-light-blue waves-effect" type="submit">SIGN IN</button>
                        </div>
                    </div>
                    <div class="row m-b--20">
                        <!-- <div class="col-xs-6">
                            <a href="sign-up.html">Register Now!</a>
                        </div> -->
                        <div class="col-xs-12 align-left">
                             <a href="forgot-password.jsp">Forgot Password?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
   <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <script type="text/javascript">
      $('#sign_in').submit(function(e){
	     e.preventDefault();
	     var data={
	    		      email:$('#email').val(),
	    	          password:$('#password').val()
	              }
	         console.log(data);
	         $.ajax({
	    	        url:"loginService",
	    	        type:"POST",
	    	        dataType:"json",
	    	        data:data,
	    	        success:function(data,textStatus,jqXHR)
	    	        {
	    	    	  console.log(data);
	     	    	  if(data.status)
	    	          {
	     	    		
	     	    		 window.location.href='dashboard.jsp';  
	    	    		
	    	    	  }
	    	    	  else 
	    	    	  {
	    	    		    Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Password Wrong',
	    	    			  text:""+data.message+"",
	    	    			  footer:'',
	    	    			  timer:3500
	    	    			 }) 
	    	    			
	    	    	  }    
	    	    	    
	    	    },
	    	    error:function(e)
	    	    {
	    	    	console.log("error in pages");
	    	    }
	       
	    	     
	     }); 
   });
</script>
</body>
</html>