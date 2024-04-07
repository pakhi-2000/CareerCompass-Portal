<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN PAGE</title>
<%@include file = "all_component/all_css.jsp" %>
 <style type="text/css">
        /* Background image style */
        body {
            background-image: url("all_component/img/jobportal.jpeg");
            background-size: cover; /* Ensure the image covers the entire background */
            background-repeat: no-repeat; /* Prevent image repetition */
            /* Add any other background styles you require */
            
             /* Additional styles to fill the height and position the footer */
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensures the page takes at least the height of the viewport */
     
        }
        
         .container-fluid {
            flex: 1; /* Allows the container to take available space */
        }
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>

<%@include file = "all_component/navbar.jsp" %>

 
<div class = "container-fluid back-img">
     <div class = "text-center">
     
       <h1 class = "text-black p-4">
       <i class="fa-solid fa-book"></i>ONLINE JOB PORTAL</h1>
       

		
</div> 
</div>

<div class="footer">
<%@include file ="all_component/footer.jsp" %>
</div>
</body>
</html>