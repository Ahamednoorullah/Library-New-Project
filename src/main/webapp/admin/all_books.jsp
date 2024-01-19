<%@ page import="com.chainsys.library.model.Books"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: All Books</title>
    <%@include file = "allCss.jsp" %>
</head>
<body>
    <%@include file = "navbar.jsp" %>
    <h2 class="text-center">Hello Admin</h2>
    
    <%
    List<Books> book =(List<Books>) request.getAttribute("book_list");
        %>

    <table class="table table-striped">
        <thead class="bg-primary">
          <tr>
            <th scope="col">Book Id</th>
            <th scope="col">Image</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author Name</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Status</th>
            <th scope="col">Published Year</th>
            <th scope="col">Qty Instock</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <% for(Books books : book){ %>
            <th><%=books.getBookId()%></th>
            <td><img src="../book/<%=books.getPhotoName()%>" style="width: 50px; height: 50px;"></td>
            <td><%=books.getBookName()%></td>
            <td><%=books.getAuthor()%></td>
            <td>$<%=books.getPrice()%></td>
            <td><%=books.getBookCategory()%></td>
            <td><%=books.getStatus()%></td>
            <td><%=books.getPublishedYear()%></td>
            <td><%=books.getQtyInstock()%></td>
            <td><a href="/updateBooks?id=<%=books.getBookId() %>" class="btn btn-sm btn-primary">Edit</a>
            <a href="/deleteBook?id=<%=books.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
          </tr>
          <%}%>
         
        </tbody>
      </table>
</body>
</html>