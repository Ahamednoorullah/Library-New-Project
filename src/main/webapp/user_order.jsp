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
    <title>Order</title>
    <%@include file ="all_components/allCss.jsp"%>
</head>
<body>
    <%@include file ="user/navbar.jsp"%>

    <%
    List<Order> order =(List<Order>) request.getAttribute("order");
        %>
    <div class="container p-1">
        <h3 class="text-center text-primary">Your Order</h3>

        <table class="table table-striped mt-3">
            <thead class="bg-primary text-white">
              <tr>
                <th scope="col">Order Id</th>
                <th scope="col">Name</th>
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
                <td><%=orders.getBookName()%></td>
                <td><%=orders.getAuthor()%></td>
                <td><%=orders.getPrice()%></td>
                <td><%=orders.getPaymentType()%></td>
              </tr>
              <%}%>
                  </tbody>
          </table>

    </div>
</body>
</html>