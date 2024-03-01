<%@ page import="com.chainsys.library.model.Books"%>
<%@ page import="com.chainsys.library.model.User"%>
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
        
#toast{
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: white;
	padding: 10px;
	color: black;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display{
	visibility: visible;
	animation: ease-in 0.5,ease-out 0.5s 2.5s;
}

@keyframes fadeIn{from { 
	bottom:0;
    opacity:0
    }
to{
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut{from { 
	bottom:30px;
    opacity:1;
    }
to{
	bottom: 0;
	opacity: 0;
}

}
    </style>
</head>
<body style="background-color: #f7f7f7;">



    <%@include file ="user/navbar.jsp"%>

    <div id="toast">${addCart}</div>

    <script type="text/javascript">
        showToast();
        function showToast(content){
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(()=>{
                $("#toast").removeClass("display");
            },2000)
        }
    </script>

    <div class="container-fluid back-img">

        <h2 class="text-center text-danger">The Book Oasis</h2>
    </div>

    <%
    List<Books> newBooks =(List<Books>) request.getAttribute("newBook");
        %>

        <!-- <%
        User users =(User) request.getAttribute("userobj");
            %> -->
    <!-- Start new arrival --> 
    <div class="container">
        <h3 class="text-center">New Arrival</h3>
        <div class="row">
             <% int countNewBook =1;
             for(Books books : newBooks){
                 %> 
                
        <div class="col-md-3">
           <div class="card crd-ho">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="/cart?bid=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="/viewUserBooks?id=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-primary btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <% countNewBook++;
        if(countNewBook==5){
            break;
        }
    
    }%>



    </div>

   <div class="text-center mt-1">
    <a href="/newBook?uid=${userobj.id}" class="btn btn-danger btn-sm text-white">View All</a>
   </div>
    </div>
    
     <!-- End new arrival -->

     <hr>

     <%
     List<Books> comicsBooks =(List<Books>) request.getAttribute("comicsBook");
         %>

       <!-- Start comics  --> 
    <div class="container">
        <h3 class="text-center">Comics</h3>
        <div class="row">
            <% int countcomicsBook =1; 
            for(Books books : comicsBooks){ %>
        <div class="col-md-3">
           <div class="card crd-ho">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="/cart?bid=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="/viewUserBooks?id=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-primary btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <% countcomicsBook++;
        if(countcomicsBook==5){
            break;
        }
    }%>

        


    </div>

   <div class="text-center mt-1">
    <a href="/comicsBook?uid=${userobj.id}" class="btn btn-danger btn-sm text-white">View All</a>
   </div>
    </div>
    
     <!-- End comics -->
     
     <hr>

     <%
     List<Books> historicalBooks =(List<Books>) request.getAttribute("historicalBook");
         %>

       <!-- Start historical --> 
    <div class="container">
        <h3 class="text-center">Historical</h3>
        <div class="row">
            <% int countHistoricalBook =1;
             for(Books books : historicalBooks){      %>
        <div class="col-md-3">
           <div class="card crd-ho">
            <div class="card-body text-center">
                <img src="../book/<%=books.getPhotoName()%>" alt="" style="width: 150px; height: 200px" class="img-thumblin">
                <p><%=books.getBookName()%></p>
                <p><%=books.getAuthor()%></p>
                <p><%=books.getBookCategory()%></p>
                <div class="row text-center">
                    <a href="/cart?bid=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                    <a href="/viewUserBooks?id=<%=books.getBookId() %>&&uid=${userobj.id}" class="btn btn-success btn-sm ml-1">View Details</a>
                    <a href="" class="btn btn-primary btn-sm ml-1">$<%=books.getPrice()%></a>
                </div>
            </div>
           </div>
        </div>
        <% countHistoricalBook++;
        if(countHistoricalBook == 5){
            break;
        }
     } %>


       


    </div>

   <div class="text-center mt-1">
    <a href="/historicalBook?uid=${userobj.id}" class="btn btn-danger btn-sm text-white">View All</a>
   </div>
    </div>
    
     <!-- End historical -->

     <%@include file="all_components/footer.jsp"%>
</body>
</html>