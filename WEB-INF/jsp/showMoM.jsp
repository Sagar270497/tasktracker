<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.task.model.MoM"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.security.cert.CertPathValidatorException.Reason"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MoM</title>
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
         
                    <!-- Table -->
                    <div class="container" style="width: 98%;">
                        <center><h3><b>MoM</b></h3></center>
                            <table class="table table-bordered" >
                                    <thead>
                                      <tr >
                                        <th>MoM No.</th>
                                        <th>MoM Date</th>
                                        <th>MoM Description</th>
                                        <th>Created Date</th>
                                        <th>MoM detail</th>
                                        <th>Primary Spoc</th>
                                         <th>TCS Attendee</th>
                                       <th>Other Stack Holder</th>
                                      </tr>
                                    </thead>
                                     <%
									            List<MoM> momList=(ArrayList<MoM>)request.getAttribute("momList");
									             Iterator<MoM> itrmom = momList.iterator();
									             while(itrmom.hasNext())
									             {
									            	 MoM momdata = itrmom.next();
									            	 SimpleDateFormat format=new SimpleDateFormat("dd-MMM-yyyy','hh:mm:ss a");
									  %>      
                                    <tbody>
                                      <tr>
                                        <td><a href="momDesc?id=<%=momdata.getId() %>"><%= momdata.getId() %></a></td>
                                        <td><%=momdata.getMomDate() %></td>
                                        <td><%=momdata.getMomDesc() %></td>
                                        <td><%=format.format(momdata.getMomCreatedDate()) %></td>
                                        <td>
				                         <textarea  cols="15" rows="2" readonly="readonly"><%=momdata.getMomDetail() %></textarea>
				                        </td>
                                        <td>
				                         <textarea  cols="15" rows="2" readonly="readonly"><%=momdata.getPrimaryScop() %></textarea>
				                       </td>
				                       <td>
				                         <textarea  cols="15" rows="2" readonly="readonly"><%=momdata.getOtherTcsAttendee() %></textarea>
				                       </td>
				                       <td>
				                         <textarea  cols="15" rows="2" readonly="readonly"><%=momdata.getOtherStackHolder() %></textarea>
				                       </td>
                                      </tr>
                                    </tbody>
                                   <%} %>
                                  </table>
                    </div>

</body>
</html>