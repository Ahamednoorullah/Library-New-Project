<%@ page import="com.chainsys.library.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <%@include file ="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file ="user/navbar.jsp"%>
    <div class="container text-center mt-3">
        <i class="fas fa-check-circle fa-5x text-success"></i>
        <h1>Thank You</h1>
        <h5>With in 7 Days Your Product will be Delivered In Your Address</h5>
        <a href="/userHome?uid=${userobj.id}" class="btn btn-primary mt-3">Home</a>
        <a href="/userOrder?email=${userobj.email}" class="btn btn-danger mt-3">View Order</a>
    </div>
    
</body>
</html>