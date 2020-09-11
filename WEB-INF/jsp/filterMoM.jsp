<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter MoM</title>
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
    
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> 
     
     
     
     <style>
		 .Imgnavbar
		            {
		            background-color:cornflowerblue;
		            margin-top: 1%;
		            margin-bottom: 1%;
		            border-radius: 0%;
		            text-align: center;
		            }
		            
		            #datepicker 
		            {
		              width: 300px;
		            }
 
     </style>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="from"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'yyyy/mm/dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>
<script>
	$(document).ready(function(){
		var date_input=$('input[name="to"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'yyyy/mm/dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>

</head>
<body>

 <%
                 if(request.getSession(false).getAttribute("currentUserName") == null)
                 {
                	 response.sendRedirect("logout");
                 }
                 else
                 {
                %>  
               
               <%
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
                 }
         %>


 <div class="container style containercustom " >
                  <form class="well form-horizontal center" action="filterMomOperation" method="post"  id="contact_form">
                        <fieldset >
                                
                                <!-- Form Name -->
                                <legend ><h3><b><center>View MoM</center></b></h3></legend><br>
                               
                               <!-- Date Input -->
							      <div class="form-group date" style="margin-left: 358px;"> 
                                    <div class="col-md-5 selectContainer">
                                    <div class="input-group date">
                                    <div class="col-md-5 selectContainer" >
							        <div class="input-group date" >
							         <input class="form-control" id="date" name="from" placeholder="YYYY/MM/DD" type="text" style="width: 150px;"  autocomplete="off" required="required"/>
							        <div class="input-group-addon">To</div>
							         <input  class="form-control" id="date" name="to"  placeholder="YYYY/MM/DD" type="text" style="width: 150px;"  autocomplete="off" required="required"/>
							       </div>
							        </div>
                                    </div>
                                   </div>
                                 </div>
                                <br>
                                
                                
                            <!-- Drop down input-->
                            <div class="form-group"> 
                                    <label class="col-md-5 control-label">Primary Spoc :</label>
                                    <div class="col-md-5 selectContainer">
                                    <div class="input-group">
                                    <select name="spoc" class="form-control selectpicker" style="width: 256px;">
                                        <option value="">Select Task status</option>
                                         <c:forEach var="user" items="${userlist}">
                                        <option>${user.user_name}</option>
                                     </c:forEach>
                                    </select>
                                    </div>
                                </div>
                                </div>
                                
                                 <!-- Drop down input-->
                            <div class="form-group"> 
                                    <label class="col-md-5 control-label">TCS Attendee :</label>
                                    <div class="col-md-5 selectContainer">
                                    <div class="input-group">
                                    <select name="attendee" class="form-control selectpicker" style="width: 256px;">
                                        <option value="">Select Task status</option>
                                         <c:forEach var="user" items="${userlist}">
                                        <option>${user.user_name}</option>
                                     </c:forEach>
                                    </select>
                                    </div>
                                </div>
                                </div>
                                
                                <div class="form-group"> 
                                    <label class="col-md-5 control-label">Stack Holder :</label>
                                    <div class="col-md-5 selectContainer">
                                    <div class="input-group">
                                    <select name="stackHolder" class="form-control selectpicker" style="width: 256px;">
                                        <option value="">Select Task status</option>
                                         <c:forEach var="companies" items="${companiesName}">
                                        <option>${companies.company_name}</option>
                                     </c:forEach>
                                      <option>Other</option>
                                    </select>
                                    </div>
                                </div>
                                </div>
                                
                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-5 control-label"></label>
                                    <div class="col-md-5"><br>
                                    <button type="submit" class="btn btn-success" >View</button>
                                    </div>
                                </div>
                            </fieldset>
                           </form>
                          </div>
                                

</body>
</html>