<%@ page import="com.chainsys.library.model.Books"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Home Page</title>
    <%@include file ="all_components/allCss.jsp"%>
    <style type="text/css">

        .back-img{
            background: url("book/bookUser.jpg");
            height: 55vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .crd-ho:hover{
            background-color: #edede8;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;">
    <%@include file ="user/navbar.jsp"%>

    <div class="container-fluid back-img">

        <h2 class="text-center text-danger">The Book Oasis</h2>
    </div>

    <%
    List<Books> comicsBooks =(List<Books>) request.getAttribute("comicsBooks");
        %>

    <!-- Start Best Seller --> 
    <div class="container">
        <h3 class="text-center">Comics Books</h3>
        <div class="row">
             <% for(Books books : comicsBooks){
                 %> 
                
        <div class="col-md-3">
           <div class="card crd-ho mt-2">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="/viewBooks?id=<%=books.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-primary btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <%}%>