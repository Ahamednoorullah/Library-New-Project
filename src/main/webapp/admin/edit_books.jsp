<%@ page import="com.chainsys.library.model.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Add Books</title>
    <%@include file ="allCss.jsp" %>
</head>
 <body style="background-color: #f0f1f2;"> 

    <%@include file = "navbar.jsp" %>

    <%
    Books books =(Books) request.getAttribute("bookFound");
        %>

 <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Update Books</h4>
                        <form action="/updateBookData" method="get" id="formBook">

                            <div class="form-group">
                                <label for="bookId">Book Id</label>
                                <input type="number" class="form-control" id="bookId" name="bookId" value="<%=books.getBookId()%>">
                            </div>
                           
                            <div class="form-group">
                                <label for="bookName">Book Name</label>
                                <input type="text" class="form-control" id="bookName" name="bookName" value="<%=books.getBookName()%>">
                            </div>

                            <div class="form-group">
                                <label for="author">Author</label>
                                <input type="text" class="form-control" id="author" name="author" value="<%=books.getAuthor()%>">
                            </div>

                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="text" class="form-control" id="price" name="price" value="<%=books.getPrice()%>">
                            </div>

                            <div class="form-group">
                                <label for="bookCategory">Book Category</label>
                                <select  class="form-control" id="bookCategory" name="bookCategory">
                                    <option selected>---Select---</option>
                                    <option value="NewArrival">New Arrival</option>
                                    <option value="bestSeller">Best Seller</option>
                                    <option value="kids">Kids</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select  class="form-control" id="status" name="status">
                                    <option selected>---Select---</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="publishedYear">Published Year</label>
                                <input type="number" class="form-control" id="publishedYear" name="publishedYear" value="<%=books.getPublishedYear()%>">
                            </div>

                            <div class="form-group">
                                <label for="qtyInstock">Qty Instock</label>
                                <input type="number" class="form-control" id="qtyInstock" name="qtyInstock" value="<%=books.getQtyInstock()%>">
                            </div>

                            <div class="form-group">
                                <label for="photo">Upload Photo</label>
                                <input type="file" class="form-control" id="photo" name="photoName" value="<%=books.getPhotoName()%>">
                            </div>

                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> 
   
</body>
</html>