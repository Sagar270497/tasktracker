<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
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
    
<style>
  
  .Imgnavbar
            {
            background-color:cornflowerblue;
            margin-top: 1%;
            margin-bottom: 1%;
            border-radius: 0%;
            text-align: center;
            }
    .customalign
    {
        text-align: right;
    }
    .containercustom 
     {
     width: 800px !important;
     }
          
</style>

      <script type="text/javascript">
         
            var msg = "${password}";
         
             if(msg != "")
        	 {
        	     alert(msg);
        	 }
      
         </script>
         
         <script type="text/javascript">
         
            var msg = "${msg}";
         
             if(msg != "")
        	 {
        	     alert(msg);
        	 }
      
         </script>
</head>
<body >

      

                 <%
               
                 if(request.getSession(false).getAttribute("currentUserName") == null)
                 {
                	 response.sendRedirect("logout");
                 }
                 else
                 {
                %> 
                
                 <%
                 if(request.getSession(false).getAttribute("msg2").equals(""))
                 {
	                 if(request.getSession(false).getAttribute("roles").equals("Admin"))
	                 {  
	                	 %>
	                	  <jsp:include page="Header.jsp"></jsp:include> 
	                	  <% 
	                 }else
	                 {
	                	 %>
	                	  <jsp:include page="DeveloperHeader.jsp"></jsp:include> 
	                	  <%
	                 }
                  }else
                  {
                	  %>
                	  <br><br><br>
                	  <% 
                  }
                 }
                 %>
        
        
        
         <div class="container style containercustom" >

              <form class="well form-horizontal" action="savePassword" method="post"  id="contact_form" autocomplete="off">
                <fieldset>
                
                <!-- Form Name -->
                <legend><center><h3><b>Change Password</b></h3></center></legend><br>
                
	                 <!-- Text input-->
	                
	                <div class="form-group">
	                  <label class="col-md-4 control-label">Current Password : </label>  
	                  <div class="col-md-4 inputGroupContainer">
	                  <div class="input-group">
	                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                  <input  name="currentPassword" placeholder="Enter Current Password" class="form-control"  type="password" required>
	                    </div>
	                  </div>
	                </div>
	                
	                
	                 <div class="form-group">
	                  <label class="col-md-4 control-label">New Password : </label>  
	                  <div class="col-md-4 inputGroupContainer">
	                  <div class="input-group">
	                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                  <input  name="newPassword" placeholder="Enter New Password" class="form-control"  type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required">
	                    </div>
	                  </div>
	                </div>
	                
	                
	                 <div class="form-group">
	                  <label class="col-md-4 control-label">Confirm : </label>  
	                  <div class="col-md-4 inputGroupContainer">
	                  <div class="input-group">
	                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                  <input  name="confirm" placeholder="Confirm Password" class="form-control"  type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required">
	                    </div>
	                  </div>
	                </div>
	                
	                
	                 <!-- Button -->
                <div class="form-group">
                  <label class="col-md-4 control-label"></label>
                  <div class="col-md-4"><br>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-success" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Change</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
                  </div>
                </div>
	                
	                
                </fieldset>
              </form>
          </div>
</body>
</html>