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
            background: url("book/book.jpg");
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
    <%@include file ="all_components/navbar.jsp"%>

    <div class="container-fluid back-img">

        <h2 class="text-center text-danger">Ebook Management System</h2>
    </div>

    <%
    List<Books> newBooks =(List<Books>) request.getAttribute("newBook");
        %>

    <!-- Start new arrival --> 
    <div class="container">
        <h3 class="text-center">New Arrival</h3>
        <div class="row">
            <% for(Books books : newBooks){ %>
        <div class="col-md-3">
           <div class="card crd-ho">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-danger btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <%}%>
<!-- 
        <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/j2ee.jpg" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Advanced Java</p>
                 <p>B Parasanalakshmi</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$300</a>
                 </div>
             </div>
            </div>
         </div>

         <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/html.jfif" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Html 5</p>
                 <p>Bruce Lawson & Remy Sharp</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$190</a>
                 </div>
             </div>
            </div>
         </div>

         <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/100.jpg" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>The 100</p>
                 <p>Kass Morgan</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$350</a>
                 </div>
              </div> -->
            <!--</div>
         </div> -->


    </div>

   <div class="text-center mt-1">
    <a href="" class="btn btn-danger btn-sm text-white">View All</a>
   </div>
    </div>
    
     <!-- End new arrival -->

     <hr>

     <%
     List<Books> bestBooks =(List<Books>) request.getAttribute("bestBook");
         %>

       <!-- Start BestSeller  --> 
    <div class="container">
        <h3 class="text-center">Best Seller</h3>
        <div class="row">
            <% for(Books books : bestBooks){ %>
        <div class="col-md-3">
           <div class="card crd-ho">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-danger btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <%}%>

        <!-- <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/spring.jpg" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Springboot Learning</p>
                 <p>Greg L.Turnquiest</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$240</a>
                 </div>
             </div>
            </div>
         </div>

         <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/java.jfif" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Java Programming</p>
                 <p>Srikanth Dodoamani</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$270</a>
                 </div>
             </div>
            </div>
         </div>

         <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/java.jfif" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Java Programming</p>
                 <p>Srikanth Dodoamani</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$270</a>
                 </div>
             </div>
            </div>
         </div> -->


    </div>

   <div class="text-center mt-1">
    <a href="" class="btn btn-danger btn-sm text-white">View All</a>
   </div>
    </div>
    
     <!-- End BestSeller -->
     
     <hr>

     <%
     List<Books> kidsBooks =(List<Books>) request.getAttribute("kidsBook");
         %>

       <!-- Start kids --> 
    <div class="container">
        <h3 class="text-center">Kids</h3>
        <div class="row">
            <% for(Books books : kidsBooks){ %>
        <div class="col-md-3">
           <div class="card crd-ho">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-danger btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <%}%>

        <!-- <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/java.jfif" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Java Programming</p>
                 <p>Srikanth Dodoamani</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$270</a>
                 </div>
             </div>
            </div>
         </div>

         <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/java.jfif" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Java Programming</p>
                 <p>Srikanth Dodoamani</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$270</a>
                 </div>
             </div>
            </div>
         </div>

         <div class="col-md-3">
            <div class="card crd-ho">
             <div class="card-body text-center">
                 <img src="book/java.jfif" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                 <p>Java Programming</p>
                 <p>Srikanth Dodoamani</p>
                 <p>Categories:New</p>
                 <div class="row text-center">
                     <a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                     <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
                     <a href="" class="btn btn-danger btn-sm ml-1">$270</a>
                 </div>
             </div>
            </div>
         </div> -->


    </div>

   <div class="text-center mt-1">
    <a href="" class="btn btn-danger btn-sm text-white">View All</a>
   </div>
    </div>
    
     <!-- End Kids -->

     <%@include file="all_components/footer.jsp"%>
</body>
</html>