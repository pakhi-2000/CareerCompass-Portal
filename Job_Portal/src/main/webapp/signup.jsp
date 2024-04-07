<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup Page</title>
    <%@include file="all_component/all_css.jsp" %>
 
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_component/navbar.jsp" %>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="signup-box">
                    <div class="text-center mb-4">
                        <i class="fas fa-user-plus"></i>
                        <h5>Registration</h5>
                    </div>

<c:if test="${not empty succMsg }">
<div class = "text-center text-success" role = "alert"> ${succMsg}</div>
<c:remove var="succMsg"/>
</c:if>   


                    <form action="add_user" method="post">
                        <div class="form-group">
                            <label>Enter Full Name</label>
                            <input type="text" required="required" class="form-control"
                                   id="fullName" name="name">
                        </div>

                        <div class="form-group">
                            <label>Enter Qualification</label>
                            <input type="text" required="required" class="form-control"
                                   id="qualification" name="qua">
                        </div>

                        <div class="form-group">
                            <label>Enter Email</label>
                            <input type="email" required="required" class="form-control"
                                   id="inputEmail" name="email">
                        </div>

                        <div class="form-group">
                            <label for="inputPassword">Enter Password</label>
                            <input required="required" type="password" class="form-control"
                                   id="inputPassword" name="ps">
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
