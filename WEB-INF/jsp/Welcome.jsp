<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.security.cert.CertPathValidatorException.Reason"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Welcome</title>
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
<body >
           <script type="text/javascript">
         
            var msg = "${msg}";
         
             if(msg != "")
        	 {
        	     alert(msg);
        	 }
      
         </script>
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
              
          
                      <!-- Table -->
                    <div class="container" style="width: 98%;">
                        <center><h4><b>Task Assigned</b></h4></center>
                            <table class="table table-bordered" >
                                    <thead>
                                      <tr >
                                        <th>Task No.</th>
                                        <th>Date</th>
                                        <th>Description</th>
                                        <th>Assigned By</th>
                                        <th>Created By</th>
                                         <th>Category</th>
                                        <th>Priority</th>
                                        <th>Expected Date</th>
                                        <th>Task Status</th>
                                        <th>User Status</th>
                                      </tr>
                                    </thead>
                                     <c:forEach var="task" items="${taskList}">            
                                    <tbody>
                                      <tr>
                                        <td><a href="taskStatus/${task.taskId }">${task.taskId }</a></td>
                                        <td>${task.createDate}</td>
                                        <td>
				                         <textarea  cols="15" rows="2" readonly="readonly">${task.description}</textarea>
				                       </td>
                                        <td>${task.assignedBy}</td>
                                        <td>${task.createdBy}</td>
                                         <td>${task.category}</td>
                                        <td>${task.priority}</td>
                                        <td>${task.expectDate}</td>                               
                                        <td><b>${task.task_status}</b></td>
                                        <td>${task.user_status}</td>   
                                      </tr>
                                    </tbody>
                                    </c:forEach>
                                  </table>
                    </div>
</body>
</html>