  <%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create task</title>
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
<body >

                   <%
                
                 if(request.getSession(false).getAttribute("currentUserName") == null)
                 {
                	 response.sendRedirect("logout");
                 }
         
         %>   
              <jsp:include page="Header.jsp"></jsp:include>    

                  
       <div class="container style containercustom " >
        <form class="well form-horizontal center" action="taskCreate" method="post"  id="contact_form" autocomplete="off">
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
                            <label class="col-md-5 control-label">Expected Date</label>  
                            <div class="col-md-5 inputGroupContainer">
                            <div class="input-group">
                            <input  name="expectDate" placeholder="Date" class="form-control"  type="date" required>
                            </div>
                            </div>
                    </div>
 
                    
                       <!-- Text input-->
                  <div class="form-group"> 
                        <label class="col-md-5 control-label">Priority</label>
                          <div class="col-md-5 selectContainer">
                          <div class="input-group">
                         
                          <select name="priority" class="form-control selectpicker" required>
                            <option value="">Select your Priority</option>
                            <option>Very High</option>
                            <option>High</option>
                            <option>Medium</option>
                            <option>Low</option>
                          </select>
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
                      

                     
                    <!-- Text input-->
                    <div class="form-group"> 
                      <label class="col-md-5 control-label">Assigned To</label>
                        <div class="col-md-5 selectContainer">
                        <div class="input-group">
                      
                        <select  name="assignedTo"  class="form-control selectpicker" required="required">
                        <option value="">Select Developer</option>
                        <c:forEach var="user" items="${userName}">
                          <option >${user.user_name} (${user.id})</option>
                          </c:forEach> 
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