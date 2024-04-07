<%@page import="com.dao.*,com.entity.*,java.util.*,com.DB.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: view jobs</title>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">

		
 <c:if test="${userobj.role ne 'admin'}">
 <c:redirect url="login.jsp"></c:redirect>               
            </c:if>   
            
 <%@include file="all_component/navbar.jsp" %>
  <%
                  DBConnect getConn = new DBConnect();
                  JobDAO jobDao = new JobDAO(getConn.getConnection());
                  List<Jobs> printJobs = jobDao.getAllJobs();
  %>
  
    <div class="container">
    			
        <div class="row ">
            <div class="col-md-12">
 			<c:if test="${not empty succMsg }">
                 <div class = "alert alert-success" role = "alert"> ${succMsg}</div>
                  <c:remove var="succMsg"/>
            </c:if>   
                  <h5 class = "text-center text_primary">All Jobs </h5>
                  
                 
                <%  
                  for(Jobs jobs : printJobs)
                  {  
                %>   
     <div class="card mt-2">
     			
         <div class="card-body">
         		
              <div class="text-center text-primary">
                   <i class="fa-sharp fa-solid fa-clipboard"></i>
              </div>
              	 
                    
         			<h6>Title: <%= jobs.getTitle() %> </h6>
                    <p>Description: <%= jobs.getDescription() %></p>
                    <br>
                    
                  <div class="form-row">
                      
                      <div class="form-group col-md-3">
                       <input type="text" class="form-control  form-control-sm" value = "Location:<%= jobs.getLocation()%>" readonly>
                      </div>
                    
                     <div class="form-group col-md-3">    
         				<input type="text" class="form-control  form-control-sm" value = "Category:<%= jobs.getCategory() %>" readonly>           
         			 </div>
         
         			 <div class="form-group col-md-3"> 
         			<input type="text" class="form-control  form-control-sm" value = "Status:<%= jobs.getStatus() %>" readonly>  
         			</div>
         
         
        		</div>
        
        			<h6> Publish Date : <%= jobs.getPdate() %></h6>
        		<div class = "text-center ">
        			<a href = "edit_job.jsp?id=<%=jobs.getId() %>" class = "btn btn-success text-white"> Edit</a>
        
        			<a href = "delete?id=<%=jobs.getId() %>" class = "btn btn-danger  text-white "> Delete </a>   
 				</div>
  		</div>
   </div>
   <%}%>
    </div>
     </div>
      </div>
</body>
</html>