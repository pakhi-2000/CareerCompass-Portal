<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@include file="all_component/all_css.jsp" %>
    <style>
        /* Added background color to the body */
        body {
            background-color: #f0f1f2; /* Grey color */
            margin: 0; /* Reset default margin */
        }

        /* Added border to the card-body */
        .card-body {
            border: 1px solid #ccc; /* Adjust border styles as needed */
            border-radius: 8px; /* Optional: Add border radius for a softer look */
            padding: 20px; /* Optional: Add padding for spacing */
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp" %>
    <div class="container-fluid">
        <div class="row p-5">
            <div class="col-md-4 offset-md-4">
                <div class="card-body">
                    <div class="text-center">
                        <i class="fas fa-user-plus"></i>
                        <h5>Login Page</h5>
                        <c:out value="${userobj.role}"></c:out>
                    </div>
                     <c:if test="${not empty succMsg }">
                 <div class = "alert alert-success" role = "alert"> ${succMsg}</div>
                  <c:remove var="succMsg"/>
            </c:if>  

                    <form action="login" method="post">
                        <div class="form-group">
                            <label>Enter Email</label>
                            <input type="email" required="required" class="form-control"
                                   id="exampleInputEmail" aria-describedby="emailHelp" name="email">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Enter Password</label>
                            <input required="required" type="password" class="form-control"
                                   id="exampleInputPassword1" name="password">
                        </div>

                        <button type="submit" class="btn btn-primary badge-pill btn-black">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
