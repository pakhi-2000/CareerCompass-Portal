<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" 
import="com.dao.*,com.entity.*,java.util.*,com.DB.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">Job Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse"
   data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
   aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <c:if test="${userobj != null && userobj.role eq 'admin'}"> 
        <li class="nav-item"> 
          <a class="nav-link" href="add_job.jsp"><i class="fa-solid fa-circle-plus"></i>Post Job</a>
        </li>
        <li class="nav-item"> 
          <a class="nav-link" href="view_jobs.jsp"><i class="fa-solid fa-eye"></i>View Job</a>
        </li>
      </c:if>
    </ul>
    
   <%--  <c:choose>
      <c:when test="${userobj != null && userobj.role eq 'admin'}">
        <li class="form-inline my-2 my-lg-0">
          <a class="btn btn-light mr-1" href="Admin.jsp"><i class="fa-solid fa-user"></i> Admin</a>
        </li>
        <li class="form-inline my-2 my-lg-0">
          <a class="btn btn-light" href="#"><i class="fa-sharp fa-solid fa-right-from-bracket"></i>Logout</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="form-inline my-2 my-lg-0">
          <a class="btn btn-light mr-1" href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login </a>
        </li>
        <li class="form-inline my-2 my-lg-0">
          <a class="btn btn-light" href="signup.jsp"><i class="fa-solid fa-user"></i>Signup</a>
        </li>
      </c:otherwise>
    </c:choose>
     --%>
     
      <form class = form-inline my-2 my-lg-0">
    
    
     <c:if test="${userobj.role eq 'admin'}">
     <a class="btn btn-light mr-1" href="#"><i class="fa-solid fa-right-to-bracket"></i> Admin </a> 
      <a class="btn btn-light  mr-1"  href="logout"><i class="fa-solid fa-user"></i>Logout</a>
      
     </c:if>
    
    <c:if test="${userobj.role eq 'user'}">
     <a class="btn btn-light mr-1" data-toggle="modal" data-target="#exampleModal" href="#"><i class="fa-solid fa-right-to-bracket"></i>
    ${userobj.name}
    </a>
     <a class="btn btn-light  mr-1"  href="logout"><i class="fa-solid fa-user"></i>Logout</a>
      
    </c:if>
    
    
       <!-- <a class="btn btn-light  mr-1"  href="Logout"><i class="fa-solid fa-user"></i>Logout</a> -->
      
      <c:if test="${ empty userobj}">
       
    <a class="btn btn-light mr-1" href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login </a>
    <a class="btn btn-light"  href="signup.jsp"><i class="fa-solid fa-user"></i>Signup</a>
    
      </c:if>
      
      
    </form>
  </div>
</nav>


<div class="modal fade" id = "exampleModal" tabindex="-1" role="dialog" aria-labelledby = "exampleModalLabel" aria-hidden = "true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile: ${userobj.name }</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
              <!-- <div class= "modal body">
                 <div class = "card">
                    <div class = "card-body"> -->
 <div class = "text-center text-primary"><i class="fa-solid fa-circle-user" style="font-size: 50px"></i></div>  


<table class = "table">
  
<tr>
<th scope = "row">Name</th>
<td>${userobj.name }</td>
</tr>
<tr>
<th scope = "row">Email</th>
<td>${userobj.email}</td>
</tr> 
<tr>
<th scope = "row">Password</th>
<td>${userobj.password}</td>
</tr>
<tr>
<th scope = "row">Qualification</th>
<td>${userobj.qualification}</td>
</tr>

</table>
<!-- </div>
</div>

	</div> -->
       <div class="modal-footer">
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href = "edit_profile.jsp" class ="btn btn-primary">Edit</a>
      </div>
    </div>
  </div>
</div>
