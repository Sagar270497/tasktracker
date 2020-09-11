<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
    
<title>User Roles</title>
</head>
         <script type="text/javascript">
         
	          var msg = "${msg}";
	         
	          if(msg != "")
	        	 {
	        	     alert(msg);
	        	 }
	      
	         </script>


<body>
<jsp:include page="Header.jsp"></jsp:include>



             
       <div class="container style containercustom " style="width: 50%;">
        <form class="well form-horizontal center" action="createRole" method="post"  id="contact_form" autocomplete="off">
            <fieldset >
                    
                    <!-- Form Name -->
                    <legend ><h2><b><center>Add Role</center></b></h2></legend><br>
                    
                     <!-- Text input-->
                     <div class="form-group">
	                  <label class="col-md-4 control-label">Roles : </label>  
	                  <div class="col-md-4 inputGroupContainer">
	                  <div class="input-group">
	                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                  <input  name="role" placeholder="Enter Role" class="form-control"  type="text" required>
	                   </div>
	                  </div>
	                </div>
	                
                       <!-- Button -->
                <div class="form-group">
                  <label class="col-md-5 control-label"></label>
                  <div class="col-md-5"><br>
                    <button type="submit" class="btn btn-success" >Add Role</button>
                  </div>
                </div>
                    
            </fieldset>
        </form>
     </div>
     




</body>
</html>