 <!DOCTYPE html>  
<html lang="en">  
  <head>  
     <title>Login</title>  
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="keywords" content="footer, contact, form, icons" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
  <script src="${pageContext.request.contextPath}/resources/bootstrap/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/file.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/font-awesome.min.css"/>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/style.css"/>
  
	
  </head>  
			   <style>
			 body, html
				   {
				    height: 100%;
				    margin: 0;
				    font-family:inherit;
				    }  
			  .navbar
				    {
				     background-color: rgba(0, 0, 0, 0.5);
			         margin-bottom: 7%;
			         border-radius: 0%;
			        }
				  .bg 
				     {
					  /* The image used */
					  background-image: url('${pageContext.request.contextPath}/resources/img/TCS-sky.jpg');
					
					  /* Full height */
					  height: 100%; 
					
					  /* Center and scale the image nicely */
					  background-position: center;
					  background-repeat: no-repeat;
					  background-size: cover;
					  } 
	           
					.container
					{
					margin-top: 10%;
					align-content: center;
					background-color: rgba(0,0,0,0.5) !important;
					width: 400px;
					height: 250px;
					}
			      
				
			  </style> 
  
		  <body >
		    <script type="text/javascript">
         
	          var msg1 = "${msg1}";
	         
	          if(msg1 != "")
	        	 {
	        	     alert(msg1);
	        	     msg1="";
	        	 }
	      
	         </script>
	         
			 <div class="bg"> 
			        <!-- Navbar -->
				    <div class="navbar">
				        <img src="${pageContext.request.contextPath}/resources/img/TCS1.png">
				    </div>
				    <!-- Container -->
				   <div class="container ">
					
				   <form class="form-horizontal" action="login" method="post">
				    <center style="color: white;"><h2><b>Login User</b></h2></center>
				    <div class="form-group">
				      <label class="control-label col-md-4" for="User Name"></label>
				      <div class="col-md-4 col-sm-offset-1 inputGroupContainer" style="width: 80%;">
	                  <div class="input-group">
	                  <span class="input-group-addon"><i class="glyphicon glyphicon-user" style="font-size:15px"></i></span>
	                  <input  name="id" placeholder="Enter Emp Id" class="form-control"  type="text" required>
	                    </div>
	                  </div>
				    </div>
				    <div class="form-group">
				      <label class="control-label col-md-4" for="password"></label>
				       <div class="col-md-4 col-sm-offset-1 inputGroupContainer" style="width: 80%;">
	                  <div class="input-group" >
	                  <span class="input-group-addon " ><i class="fa fa-key" style="font-size:18px"></i></span>
	                  <input  name="password" placeholder="Enter Password" class="form-control"  type="password" required>
	                    </div>
	                  </div>
				    </div>
				    <br>
				    <div class="form-group">        
				      <div class="col-sm-offset-4 col-sm-8">
				        <button type="submit" class="btn btn-success" style="width: 50%; margin-left: 30%;">Login</button>
				      </div>
				    </div>
				  </form>
			 </div>
			 </div>
			 
		</body>
			  <footer class="footer navbar-fixed-bottom">
			    <!-- Copyright -->
			    <div class="footer-copyright text-center py-3 "style="color:white;background-color:rgb(34, 29, 29);font-size:110%;padding:1%;">© 2019 Copyright:
			      Developed by Deepak saini
			    </div>
			    <!-- Copyright -->
			</footer>
      
  
</html>  

 