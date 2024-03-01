<%@ page import="com.chainsys.library.model.Books"%>
<%@ page import="com.chainsys.library.model.User"%>
<%@ page import="com.chainsys.library.model.Cart"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart Page</title>
    <%@include file ="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file ="user/navbar.jsp"%>

    <%
    List<Cart> cart =(List<Cart>) request.getAttribute("cart");
        %>
   <div class="container">
    <div class="row p-2">
        <div class="col-md-6">
            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Selected Item</h3>
                    <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">Book Name</th>
                            <th scope="col">Author</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                          </tr>
                        </thead>
                        <% 
                        double totalPrice = 0.0;
                        for(Cart carts : cart){
                           totalPrice += carts.getTotalPrice();
                            %>
                        <tbody>
                          <tr>
                            <td><%=carts.getBookName()%></td>
                            <td><%=carts.getAuthor()%></td>
                            <td>$<%=carts.getPrice()%></td>
                            <td>
                              <a href="/removeBook?cid=<%=carts.getCartId() %>&&uid=<%=carts.getUserId() %>" class="btn btn-sm btn-danger">Remove</a>
                            </td>
                          </tr>
                        <%}%>

                        <tr>
                          <td>Total Price</td>
                          <td></td>
                          <td></td>
                          <td><%=totalPrice %></td>
                        </tr>
                          <!-- <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                          </tr>
                          <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                          </tr> -->
                        </tbody>
                      </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Details for Order</h3>
                    <form action="/order" method="get">
                      <input type="hidden" value="${userobj.id}" name="id">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="name">Name</label>
                              <input type="text" class="form-control" id="name" value="${userobj.userName}" name="name">
                            </div>
                            <div class="form-group col-md-6">
                              <label for="email">Email</label>
                              <input type="email" class="form-control" id="email" value="${userobj.email}" name="email">
                            </div>
                          </div>

                          <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="phoneNumber">Phone Number</label>
                              <input type="number" class="form-control" id="phoneNumber" value="${userobj.phoneNumber}" name="phoneNumber">
                            </div>
                            <div class="form-group col-md-6">
                              <label for="address">Address</label>
                              <input type="text" class="form-control" id="address" name="address">
                            </div>
                          </div>

                          <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="landmark">Landmark</label>
                              <input type="text" class="form-control" id="landmark" name="landmark">
                            </div>
                            <div class="form-group col-md-6">
                              <label for="inputPassword4">City</label>
                              <input type="text" class="form-control" id="city" name="city">
                            </div>
                          </div>

                          <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="state">State</label>
                              <input type="text" class="form-control" id="state" name="state">
                            </div>
                            <div class="form-group col-md-6">
                              <label for="pincode">Pincode</label>
                              <input type="number" class="form-control" id="pincode" name="pincode">
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="payment">Payment Mode</label>
                            <select class="form-control" name="payment">
                                <option value="noSelect">--Select--</option>
                                <option value="COD">Cash On Delivery</option>
                            </select>
                          </div>

                          <div class="text-center">
                            <button type="submit" class="btn btn-warning">Order Now</button>
                            <a href="/userHome?uid=${userobj.id}" class="btn btn-success">Continue Shopping</a>
                          </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
   </div>
</body>
</html>