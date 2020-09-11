<%@page import="com.task.model.MoM"%>
<%@page import="com.task.model.Task_History"%>
<%@page import="com.task.model.Tasks"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.task.model.Remarks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MoM Desc</title>
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


              <!-- navbar button -->
              <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                      <ul class="nav navbar-nav navbar-right">
                        <li ><a href="home" style="color: white;" ><span class="glyphicon glyphicon-home "></span>  Home </a></li>
                      </ul>
                      <ul class="nav navbar-nav navbar-right">
                        <li ><a style="color: white;" ><span class="glyphicon glyphicon-user "></span> ${user}</a></li>
                      </ul>
                       
                    </div>
                  </nav> 
                  <br><br>
           
            


<div class="container style containercustom" >   
                <form:form class="well form-horizontal" method="post" action="/TaskTracker/taskStatusSave" enctype="multipart/form-data" id="contact_form">
                <fieldset>
                
               
               <%    List<MoM> momList = (ArrayList<MoM>)request.getAttribute("momData");
                     Iterator<MoM> itrmom = momList.iterator();
		             while(itrmom.hasNext())
		             {
		            	 MoM momdata = itrmom.next();
		            	 SimpleDateFormat format=new SimpleDateFormat("dd-MMM-yyyy','hh:mm:ss a");
		            
               %>
                <!-- Form Name -->
                <legend><center><h3><b>MoM Details</b></h3></center></legend><br>

                <!-- Text Input-->
                
              
                
                <div class="form-group">
                  <label class="col-md-5 control-label">MoM No. : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="taskId"  class="form-control"  type="text" value="<%= momdata.getId() %>" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                
                 <div class="form-group">
                  <label class="col-md-5 control-label">MoM Description : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="createDate"  class="form-control"  type="text" value="<%=momdata.getMomDesc() %>" readonly="readonly">
                    </div>
                  </div>
                </div>
                 <!-- Text Input-->
                <div class="form-group">
                  <label class="col-md-5 control-label">MoM Create Date : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="createDate"  class="form-control"  type="text" value="<%=format.format(momdata.getMomCreatedDate()) %>" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-5 control-label">MoM Date : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="lastModifyDate"  class="form-control"  type="text" value="<%=momdata.getMomDate() %>" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                      <div class="form-group">
                      <label class="col-md-5 control-label">MoM detail : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly"><%=momdata.getMomDetail() %></textarea> 
                      </div>
                      </div>
                      </div>
                     
                      <div class="form-group">
                      <label class="col-md-5 control-label">Primary Spoc : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly"><%=momdata.getPrimaryScop() %></textarea> 
                      </div>
                      </div>
                      </div>
                     
                      <div class="form-group">
                      <label class="col-md-5 control-label">Tcs Attendee : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly"><%=momdata.getOtherTcsAttendee() %></textarea> 
                      </div>
                      </div>
                      </div>
                      
                      <div class="form-group">
                      <label class="col-md-5 control-label">Stack Holder : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly"><%=momdata.getOtherStackHolder() %></textarea> 
                      </div>
                      </div>
                      </div>
                      
                      <div class="form-group">
                      <label class="col-md-5 control-label">Stack Holders Name : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly"><%=momdata.getStackHolderDetail()%></textarea> 
                      </div>
                      </div>
                      </div>
                      
                      <div class="form-group">
                      <label class="col-md-5 control-label">Require Action : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly"><%=momdata.getRequireAction() %></textarea> 
                      </div>
                      </div>
                      </div>
                     
                     
                      <table class="table table-bordered table-striped ">
                         <thead>
                          <tr>
                            
                         <th>File</th> 
                          </tr>
                        </thead> 
                        <c:forEach var="list" items="${file}">
                       <tbody>
                       <tr>
                        
                       <td>
                        <a href="fileName/${list.remark_id}" > <c:out value="${list.name}"/></a>
                       </td>
                     </tr>
                     </tbody>
                      </c:forEach>
                    </table>
                     
                <%} %>
              </fieldset>
             </form:form>
            </div>
             


</body>
</html>