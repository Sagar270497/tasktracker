<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Create</title>
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

<style >
  
  
    .customalign
    {
        text-align: right;
    }
    .containercustom 
     {
     width: 850px !important;
     }
     .btnalign
     {
         text-align: center;
     }
     .inputalign
     {
        text-align: center; 
     }
           
</style>
<script type="text/javascript">
         
	          var msg1 = "${msg1}";
	         
	          if(msg1 != "")
	        	 {
	        	     alert(msg1);
	        	 }
	      
	         </script>
</head>
<body>


<%
                
                 if(request.getSession(false).getAttribute("currentUserName") == null)
                 {
                	 response.sendRedirect("logout");
                 }
         
         %>   
              <jsp:include page="DeveloperHeader.jsp"></jsp:include>    
           
           
                       
       <div class="container style containercustom " >
        <form class="well form-horizontal center" action="taskCreateDev" method="post"  id="contact_form" autocomplete="off">
            <fieldset >
                    
                    <!-- Form Name -->
                    <legend ><h3><b><center>Create Task</center></b></h3></legend><br>
                  
                   <!-- Text input-->
                                 
                    <div class="form-group">
                            <label class="col-md-5 control-label">Description</label>  
                            <div class="col-md-5 inputGroupContainer">
                            <div class="input-group">
                            <textarea name="description" placeholder="Description" rows="1" cols="22" class="form-control" required="required"></textarea>
                            </div>
                            </div>
                    </div>
                    
                    <!-- Text input-->
	                  <div class="form-group"> 
	                        <label class="col-md-5 control-label">Category</label>
	                          <div class="col-md-5 selectContainer">
	                          <div class="input-group">
	                         
	                          <select name="category" class="form-control selectpicker" required>
	                            <option value="">Select Task Category</option>
	                            <option>Change Request</option>
	                            <option>Bug fix</option>
	                            <option>Service Request</option>
	                            <option>Others</option>
	                          </select>
	                        </div>
	                      </div>
	                      </div>
                    
                      <!-- Button -->
	                <div class="form-group">
	                  <label class="col-md-5 control-label"></label>
	                  <div class="col-md-5"><br>
	                    <button type="submit" class="btn btn-success" >Task Create</button>
	                  </div>
	                </div>
                  
              </fieldset>
          </form>
       </div>

</body>
</html>