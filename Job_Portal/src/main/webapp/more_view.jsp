    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" import="com.dao.*,com.entity.*,java.util.*,com.DB.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:View Jobs</title>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">




                            <c:if test = "${empty userobj }">
                            <c:redirect url = "login.jsp"/></c:if> 
                            
                            
                             <%@include file="all_component/navbar.jsp" %>
                             
                             
                             
      <div class="container">
        <div class="row">
           <div class="col-md-12">
              <h5 class = "text-center text-primary">All Jobs</h5>
              
              <%
              String loc = request.getParameter("loc");
              String cat = request.getParameter("cat");
              System.out.println("Location "+loc+"  Category "+cat);
              String msg = null;
              JobDAO dao=new JobDAO(DBConnect.getConnection());
              List<Jobs> list = null;
             
               if(!loc.equals("") && !cat.equals(""))
              {
            	    list = dao.getJobsAndLocationAndCate(cat , loc);
             
              }
              if (loc.equals("") || cat.equals(""))
              {
            	  list = dao.getJobsORLocationAndCate(cat , loc);
              }
              if(loc.equals("") && cat.equals("")) {
            	   msg = "Job Not Available";
              }
              
              if(msg != null)
              {
              %>
              <h4 class = "text-center text-danger"><%= msg%></h4>
              <% }
              else
              {
              for(Jobs j : list)
              {
              %>
            <div class = "card mt-2">
            <div class = "card-body">
            <div class = "text-center text-primary"><i class = "far fa-clipboard fa-2x"></i>
            </div>
               <h6><%=j.getTitle() %></h6>
               <p><%=j.getDescription()%></p>
              <br>
               <div class= "form-row">
     <div class = "form-group col-md-3">
     <input type = "text" class = "form-control form-control-sm " value = "Location:<%=j.getLocation() %>" readonly>
     </div>
     <div class = "form-group col-md-3">
     <input type = "text" class = "form-control form-control-sm " value = "Category:<%=j.getCategory() %>" readonly>
      </div>
     </div>
      <h6> Publish Date :<%= j.getPdate().toString()%></h6>
      <div class = "text-center">
     <a href = "one_view.jsp?id=<%=j.getId()%>" class = "btn btn-sm bg-success text-white">View More</a>
     
     </div></div></div>
     <%
         }
              }%>
              </div>
              </div>
              </div>             
</body>
</html>