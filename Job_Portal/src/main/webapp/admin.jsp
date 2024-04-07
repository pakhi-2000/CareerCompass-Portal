<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.*,com.entity.*,java.util.*,com.DB.*"%>
    
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<%@include file="all_component/all_css.jsp" %>
  <style type="text/css">
        /* Background image style */
        body {
            background-image: url("all_component/img/Admin.jpeg");
            background-size: cover; /* Ensure the image covers the entire background */
            background-repeat: no-repeat; /* Prevent image repetition */
            /* Add any other background styles you require */
        }
    </style>
</head>
<body>

  <c:if test="${userobj.role ne 'admin'}">
 <c:redirect url="login.jsp"></c:redirect>               
            </c:if>  
             
 <%@include file="all_component/navbar.jsp"%>  
 
            <div class = "container-fluid back-img">
     <div class = "text-center">
     
       <h1 class = "text-black p-4">
       <i class="fa-duotone fa-user-tie-hair"></i>Welcome Admin</h1>
    
</body>
</html>