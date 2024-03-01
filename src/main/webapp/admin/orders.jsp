<%@ page import="com.chainsys.library.model.User"%>
<%@ page import="com.chainsys.library.model.Order"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Order Details</title>
    <%@include file = "allCss.jsp" %>
</head>
<body>
    <%@include file = "navbar.jsp" %>

    <%
    List<Order> order =(List<Order>) request.getAttribute("allOrder");
        %>
    <h2 class="text-center">Hello Admin</h2>

    <table class="table table-striped">
        <thead class="bg-primary">
          <tr>
            <th scope="col">Order Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">PH No</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Payment Type</th>
          </tr>
        </thead>
        <% 
        for(Order orders : order){
            %>
        <tbody>
          <tr>
            <th scope="row"><%=orders.getOrderId()%></th>
           
            <td><%=orders.getUserName()%></td>
            <td><%=orders.getEmail()%></td>
            <td><%=orders.getFullAdd()%></td>
            <td><%=orders.getPhoneNumber()%></td>
            <td><%=orders.getBookName()%></td>
            <td><%=orders.getAuthor()%></td>
            <td><%=orders.getPrice()%></td>
            <td><%=orders.getPaymentType()%></td>
          </tr>
          <%}%>
         
        </tbody>
      </table>
</body>
</html>