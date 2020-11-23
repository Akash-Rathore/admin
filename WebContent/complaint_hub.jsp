<%@include file="include/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/head.jsp" %> 
       <!-- Modal  -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link href="http://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
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
                <h2>Raise Complaints</h2>
            </div>
            <div class="row clearfix">
                <div class="col-xs-12 col-sm-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Raise Your Concern
                            </h2>
                            
                        </div>
                        <div class="body mrgnbtm">
                         <form  id="fileUploadForm">
                              <!-- action="Process?action=complainlist" method="post" -->
                                <div class="row clearfix">
                                	<div class="form-group">
	                                    <label for="Email" class="col-sm-2 control-label">Title: </label>
	                                    <div class="col-sm-10">
	                                        <div class="form-line">
	                                            <input type="text" class="form-control" id="title" name="title" placeholder="Enter title" maxlength="50">
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                <div class="form-group">
	                                    <label for="Email" class="col-sm-2 control-label">Issue Description: </label>
	                                    <div class="col-sm-10">
	                                        <div class="form-line">
	                                            <textarea rows="4" class="form-control no-resize" id="description" name="description" maxlength="1000" placeholder="description"></textarea>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                  <label for="Email" class="col-sm-2 control-label">Category:</label>
	                                    <div class="col-sm-10">
	                                        <div class="form-line">
	                                            <select class="form-control show-tick" id="category" name="category">
                                                     <option value="scanning">scanning</option>
                                                     <option value="indexing">indexing</option>
                                                     <option value="general">general</option>
                                                </select>
	                                         </div>
	                                    </div>
	                                </div>
	                                
	                                 <div class="form-group">
	                                    <label for="Email" class="col-sm-2 control-label">Attachments:</label>
	                                    <div class="col-sm-10">
	                                        <div class="form-line">
	                                             
					                          <input type="file" id="attachment" name="attachment" value="">
					                        </div>
					                        <span style="color:red; font-size:13px;!important">(PNG,JPEG,JPG,PDF only) max : upto 5MB</span>
	                                       
	                                    </div>
	                                </div>
	                              </div>   
                                  <div class="form-group">
	                                    <label for="Email" class="col-sm-2 control-label">Document Number Reference</label>
	                                    <div class="col-sm-10">
	                                        <div class="form-line">
	                                            <input  type="text" class="form-control" id="documentnumberref" name="documentnumberref" value="">   
					                          
	                                        </div>
	                                    </div>
	                              </div>
	                              <div class="row clearfix">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        
                                        <button type="reset" class="btn btn-primary" style="float:right;margin-left:10px;">Clear</button>
                                        <button type="submit" id="btnSubmit" class="btn btn-primary" style="float:right; margin-left:10px;">Submit</button>
                                    </div>
                                 </div>
                             </form>
                        </div>
                     </div>
                </div>
                  
                
            </div>
        </div>
    </section>
    <%@include file="include/footer.jsp"%>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
    <script src="include/custom-script.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">
      
    $('#attachment').on('change', function() { 
        
	     console.log(this.files[0].size);
         if(this.files[0].size > 5242880) { 
               error('Try to upload file less than 5MB!'); 
               return false;
           } 
          var ext = $('#attachment').val().split('.').pop().toLowerCase();
	      if($.inArray(ext, ['png','jpg','jpeg','pdf',]) == -1) {
	    	   error('You must select  file only');
			   return false;
	      }
    }); 
    
    $('#btnSubmit').click(function(e){
	      e.preventDefault();
	          
	   
	       var form = $('#fileUploadForm')[0];
           var data = new FormData(form);
            $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "process?action=complainlist",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {

	            	  var result = JSON.parse(data);
	            	  console.log(result);
	     	    	 if( result.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Complain raise',
	     	    			  showConfirmButton: false,
	     	    			  timer: 2500
	     	    			})
	     	    			
	     	    			document.getElementById("fileUploadForm").reset();
	     	    			
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Some thing is wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    	  }    

	            },
	            error: function (e) {

                    console.log("error");
	            }
	        }); 
   
	 /* var description=$('#description').val();
	       
	          if(description=='')
			  {
			       error('Please fill the Description');
				   return false;	
			  }
	           
	      
	            var data={
	    	    		     department:$('#department').val(),
	    	    		      situation:$('#situation').val(),
	    	    		    areaofissue:$('#areaofissue').val(),
	    	                designation:$('#designation').val(),
	    	                description:$('#description').val(),
	    	              } 
	    	      console.log(data);
	      $.ajax({
	    	       
	    	        url:"process?action=complainlist",
	    	       type:"POST",
	    	       dataType:"json",
	    	       data:data,
	    	       success:function(data,textStatus,jqXHR)
	    	       {
	    	    	 console.log(data);
	     	    	 if(data.status)
	    	         {
	     	    		
	     	    		Swal.fire({
	     	    			  position: 'top-end',
	     	    			  icon: 'success',
	     	    			  title: 'Complain raise',
	     	    			  showConfirmButton: false,
	     	    			  timer: 2500
	     	    			})
	     	    			document.getElementById("complaint").reset();
	     	    			//setTimeout(function(){location.reload();},2500);
	     	    	  }
	    	    	  else 
	    	    	  {
	    	    		   Swal.fire({
	    	    			  icon:'error',
	    	    			  title:'Some thing is wrong',
	    	    			  text:"wrong",
	    	    			  footer:'',
	    	    			  timer:3000
	    	    			}) 
	    	    	  }    
	    	      },
	    	    error:function(e)
	    	    {
	    	    	console.log("error in pages");
	    	    }
	       
	      });*/
   }); 
</script>
 
</body>
</html>
