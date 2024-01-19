<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <%@include file ="admin/allCss.jsp" %>
    <style type="text/css">
     a{
        text-decoration: none;
        color: black;
     }
     a:hover{
        text-decoration: none;
        color: black;
     }
    </style>
</head>
<body>
    <%@include file="admin/navbar.jsp" %>
   
    <div class="container">
        <div class="row p-5">
            <div class="col-md-3">
                <a href="admin/add_books.jsp">
                <div class="card text-center">
                    <div class="card-body">

                        <i class="fa-solid fa-square-plus fa-3x text-primary"></i>
                        <h4>Add Books</h4>
                        ----------------
                    </div>
                </div>
            </a>
            </div>

            <div class="col-md-3">
                <a href="/allBooks">
                <div class="card text-center">
                    <div class="card-body">

                        <i class="fa-solid fa-book-open fa-3x text-danger"></i>
                        <h4>All Books</h4>
                        ----------------
                    </div>
                </div>
            </a>
            </div>

            <div class="col-md-3">
                <a href="admin/orders.jsp">
                <div class="card text-center">
                    <div class="card-body">

                        <i class="fas fa-box-open fa-3x text-warning"></i>
                        <h4>Orders</h4>
                        ----------------
                    </div>
                </div>
            </a>
            </div>

            <div class="col-md-3">
                <a href="/home">
                <div class="card text-center">
                    <div class="card-body">

                        <i class="fas fa-sign-out-alt fa-3x text-primary"></i>
                        <h4>Logout</h4>
                        ----------------
                    </div>
                </div>
                </a>
            </div>
        </div>
    </div>
   
</body>
</html>