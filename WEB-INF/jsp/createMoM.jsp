     <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.springframework.web.servlet.ModelAndView"%>
    <%@page import="java.security.cert.CertPathValidatorException.Reason"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
   <!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
       <!--  <script src="http://code.jquery.com/jquery-latest.min.js"></script>  -->
   
    
   <style type="text/css">
    .containercustom 
     {
     width: 850px !important;
     }
   
   </style> 
  <style>
		  .Imgnavbar
		            {
		            background-color:cornflowerblue;
		            margin-top: 1%;
		            margin-bottom: 1%;
		            border-radius: 0%;
		            text-align: center;
		           
		            }
		     
		.b
		{
		position:relative;
		background-color:  white;
		  width: 200px;
		  height:10px;
		  border: 0;
		  padding: 10px 0;
		  margin: 5px 0;
		  text-align: center;
		  color: black;
		  font-weight: bold;
		  margin-top: 2%;
		  margin-left: 8%;
		}
		
		.dropdown dd {
		  position: relative;
		}
		
		.dropdown2 dd {
		  position: relative;
		}
		 
		 .dropdown3 dd {
		  position: relative;
		}
		  .dropdown a
		 {
		  color: #fff;
		  text-decoration: none;
		  outline: none;
		  font-size: 14px;
		}
		 .dropdown2 a
		 {
		  color: #fff;
		  text-decoration: none;
		  outline: none;
		  font-size: 14px;
		} 
		.dropdown3 a
		 {
		  color: #fff;
		  text-decoration: none;
		  outline: none;
		  font-size: 14px;
		}
		
		.dropdown dt a {
		  background-color: #4F6877;
		  display: block;
		  padding: 8px 20px 5px 10px;
		  min-height: 25px;
		  line-height: 24px;
		  overflow: hidden;
		  border: 0;
		  width: 272px;
		} 
		
		.dropdown2 dt a {
		  background-color: #4F6877;
		  display: block;
		  padding: 8px 20px 5px 10px;
		  min-height: 25px;
		  line-height: 24px;
		  overflow: hidden;
		  border: 0;
		  width: 272px;
		} 
		
		.dropdown3 dt a {
		  background-color: #4F6877;
		  display: block;
		  padding: 8px 20px 5px 10px;
		  min-height: 25px;
		  line-height: 24px;
		  overflow: hidden;
		  border: 0;
		  width: 272px;
		}
		.dropdown dd ul {
		 z-index:5;
		  background-color:white;
		  border: 0;
		  color:black;
		  display: none;
		  left: 0px;
		  padding: 2px 15px 2px 5px;
		  position: absolute;
		  top: 2px;
		  width: 275px;
		  list-style: none;
		  height: 200px;
		  overflow: auto;
		  
		}
		
		 .dropdown2 dd ul {
		 z-index:5;
		  background-color:white;
		  border: 0;
		  color:black;
		  display: none;
		  left: 0px;
		  padding: 2px 15px 2px 5px;
		  position: absolute;
		  top: 2px;
		  width: 275px;
		  list-style: none;
		  height: 200px;
		  overflow: auto;
		  
		}  
		
		.dropdown3 dd ul {
		 z-index:5;
		  background-color:white;
		  border: 0;
		  color:black;
		  display: none;
		  left: 0px;
		  padding: 2px 15px 2px 5px;
		  position: absolute;
		  top: 2px;
		  width: 275px;
		  list-style: none;
		  height: 200px;
		  overflow: auto;
		  
		}
		
		</style> 
		
	
<script type="text/javascript">
         
	          var msg1 = "${msg1}";
	         
	          if(msg1 != "")
	        	 {
	        	     alert(msg1);
	        	 }
	      
	         </script> 
   
<title>MoM</title>
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
           <form class="well form-horizontal center" method="post" action="saveMoM" enctype="multipart/form-data" id="contact_form">
           <fieldset >
                    
                    <!-- Form Name -->
                    <legend ><h2><center>Create MoM</center></h2></legend><br>
                   
                    
                      <div class="form-group">
                            <label class="col-md-5 control-label">MoM Date</label>  
                            <div class="col-md-5 inputGroupContainer">
                            <div class="input-group">
                            <input  name="momDate" placeholder="Date" class="form-control"  type="date" required="required">
                            </div>
                            </div>
                      </div>
                    
                    <div class="form-group">
                      <label class="col-md-5 control-label">MoM Description :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
	                     <input class="form-control" name="momDesc" type="text" placeholder="Enter Description" style="width: 270px;"required="required"  autocomplete="off" />
                      </div>
                      </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group"> 
                     <label class="col-md-5 control-label">Primary Spoc :</label>
                      <div class="col-md-6 selectContainer" style="margin-left: 17px; " >
                        <div class="input-group">
                    <dl class="dropdown2 form-group" > 
			          <dt>
				        <a href="#" >
				          <span class="hida" >Select Primary Spoc</span>    
				          <p class="multiSel"></p>  
				       </a>
			        </dt>
			       <dd>
			        <div class="mutliSelect" >
			         <ul>
			           <li>
		                  <c:forEach var="list" items="${userlist}">
						   <input type="checkbox" name="spoc" value="${list.user_name }" >${list.user_name } <br>
						 </c:forEach>
						</li>
			          </ul>
		             </div> 
			        </dd>
		           </dl>
                    </div>
                   </div>
                    </div>
                    
                    
                    
                    <div class="form-group"> 
                     <label class="col-md-5 control-label">Other TCS Attendee :</label>
                    <div class="col-md-6 selectContainer" style="margin-left: 17px; ">
                        <div class="input-group">
                    <dl class="dropdown form-group" > 
			          <dt>
				        <a href="#1" >
				          <span class="hida2" >Select TCS Attendee</span>    
				          <p class="multiSel2"></p>  
				       </a>
			        </dt>
			       <dd>
			        <div class="mutliSelect2" >
			         <ul>
			           <li>
		                  <c:forEach var="list" items="${userlist}">
						   <input type="checkbox" name="attendee" value="${list.user_name }">${list.user_name } <br>
						 </c:forEach>
						</li>
			          </ul>
		             </div> 
			        </dd>
		           </dl>
                    </div>
                   </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group"> 
                      <label class="col-md-5 control-label">Other Stack Holder :</label>
                      
                       <div class="col-md-6 selectContainer" style="margin-left: 17px; ">
                        <div class="input-group">
                    <dl class="dropdown3 form-group" > 
			          <dt>
				        <a href="#2" >
				          <span class="hida3" >Select Stack Holder</span>    
				          <p class="multiSel3"></p>  
				       </a>
			        </dt>
			       <dd>
			        <div class="mutliSelect3" >
			         <ul>
			           <li>
		                  <c:forEach var="user" items="${companiesName}">
						   <input type="checkbox" name="company" value="${user.company_name}">${user.company_name} <br>
						 </c:forEach>
						    <input type="checkbox" name="company" value="Other">Others <br>
						</li>
			          </ul>
		             </div> 
			        </dd>
		           </dl>
                    </div>
                   </div>
                    </div>
                     
                     
                      <div class="form-group">
                      <label class="col-md-5 control-label">Details of stack holder :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                        <textarea name="stackholders" rows="4" cols="100" class="form-control" style="width: 275px;"></textarea>     
                      </div>
                      </div>
                      </div>
                      
                       <div class="form-group">
                      <label class="col-md-5 control-label">Details of MOM :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                        <textarea name="momDetails" rows="4" cols="100" class="form-control" style="width: 275px;"></textarea>     
                      </div>
                      </div>
                      </div>
                      
                        <div class="form-group">
                      <label class="col-md-5 control-label">Future action require :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                        <textarea name="requireAction" rows="4" cols="100" class="form-control" style="width: 275px;"></textarea>     
                      </div>
                      </div>
                      </div>
                    
                     <!--   File Attechment  -->
                   <div class="form-group">
                      <label class="col-md-5 control-label">File :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
	                     <input name="file" id="fileToUpload" type="file" />
		                  <h6>Max Size 10 MB</h6>
                      </div>
                      </div>
                    </div>   
              
                    
                     <!-- Button -->
                 <div class="form-group">
                  <label class="col-md-5 control-label"></label>
                  <div class="col-md-6"><br>
                    <input type="submit" class="btn btn-success" value="Submit"/>
                  </div>
                </div>
           </fieldset>
           </form>
           </div>
  
  <script>
			$(".dropdown2 dt a").on('click', function() {
				  $(".dropdown2 dd ul").slideToggle('fast');
				});
			
				$(".dropdown2 dd ul li a").on('click', function() {
				  $(".dropdown2 dd ul").hide();
				});
			
				function getSelectedValue(id) {
				  return $("#1" + id).find("dt a span.value").html();
				}
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown2")) $(".dropdown2 dd ul").hide();
				});
			
				$('.mutliSelect input[type="checkbox"]').on('click', function() {
			
				  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
				    title = $(this).val() + ",";
			
				  if ($(this).is(':checked')) {
				    var html = '<span title="' + title + '">' + title + '</span>';
				    $('.multiSel').append(html);
				    $(".hida").hide();
				  } else {
				    $('span[title="' + title + '"]').remove();
				    var ret = $(".hida");
				    $('.dropdown2 dt a').append(ret);
			
				  }
				});
				
				$(".dropdown1 dt a").on('click', function() {
				  $(".dropdown1 dd ul").slideToggle('fast');
				});
			
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown1")) $(".dropdown1 dd ul").hide();
				});

      </script>
<script>
			$(".dropdown dt a").on('click', function() {
				  $(".dropdown dd ul").slideToggle('fast');
				});
			
				$(".dropdown dd ul li a").on('click', function() {
				  $(".dropdown dd ul").hide();
				});
			
				function getSelectedValue(id) {
				  return $("#2" + id).find("dt a span.value").html();
				}
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
				});
			
				$('.mutliSelect2 input[type="checkbox"]').on('click', function() {
			
				  var title = $(this).closest('.mutliSelect2').find('input[type="checkbox"]').val(),
				    title = $(this).val() + ",";
			
				  if ($(this).is(':checked')) {
				    var html = '<span title="' + title + '">' + title + '</span>';
				    $('.multiSel2').append(html);
				    $(".hida2").hide();
				  } else {
				    $('span[title="' + title + '"]').remove();
				    var ret = $(".hida2");
				    $('.dropdown dt a').append(ret);
			
				  }
				});
				
				$(".dropdown1 dt a").on('click', function() {
				  $(".dropdown1 dd ul").slideToggle('fast');
				});
			
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown1")) $(".dropdown1 dd ul").hide();
				});

      </script>
      <script>
			$(".dropdown3 dt a").on('click', function() {
				  $(".dropdown3 dd ul").slideToggle('fast');
				});
			
				$(".dropdown3 dd ul li a").on('click', function() {
				  $(".dropdown3 dd ul").hide();
				});
			
				function getSelectedValue(id) {
				  return $("#2" + id).find("dt a span.value").html();
				}
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown3")) $(".dropdown3 dd ul").hide();
				});
			
				$('.mutliSelect3 input[type="checkbox"]').on('click', function() {
			
				  var title = $(this).closest('.mutliSelect3').find('input[type="checkbox"]').val(),
				    title = $(this).val() + ",";
			
				  if ($(this).is(':checked')) {
				    var html = '<span title="' + title + '">' + title + '</span>';
				    $('.multiSel3').append(html);
				    $(".hida3").hide();
				  } else {
				    $('span[title="' + title + '"]').remove();
				    var ret = $(".hida3");
				    $('.dropdown3 dt a').append(ret);
			
				  }
				});
				
				$(".dropdown1 dt a").on('click', function() {
				  $(".dropdown1 dd ul").slideToggle('fast');
				});
			
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown1")) $(".dropdown1 dd ul").hide();
				});

      </script>
      

</body>
</html>