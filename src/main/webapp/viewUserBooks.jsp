<%@ page import="com.chainsys.library.model.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file ="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file ="user/navbar.jsp"%>

    <%
    Books books =(Books) request.getAttribute("viewBooks");
        %>


    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 text-center p-5 border bg-white">

                <img src="../book/<%=books.getPhotoName()%>" style="height: 150px;width: 150px;"><br>
                <h4 class="mt-3">Book Name : <span class="text-success"><%=books.getBookName()%></span></h4>
                <h4>Author Name :<span class="text-success"> <%=books.getAuthor()%></span></h4>
                <h4>Category :<span class="text-success"> <%=books.getBookCategory()%></span></h4>
                <h4>Published Year :<span class="text-success"> <%=books.getPublishedYear()%></span></h4>
            </div>
            <div class="col-md-6 text-center p-5 border bg-white">
                <h2><%=books.getBookName()%></h2>
                <div class="row">

                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                        <p>Cash on Delivery</p>
                    </div>
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fa-solid fa-rotate-left fa-2x"></i>
                        <p>Return Available</p>
                    </div>
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fa-solid fa-truck fa-2x"></i>
                        <p>Free Shipping</p>
                    </div>
                
                </div>
                <div class="text-center p-3">
                    <a href="/cart?bid=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                    <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=books.getPrice()%></a>

                </div>

            </div>
        </div>
    </div>
    
</body>
</html>