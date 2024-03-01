<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library- Login</title>
    <%@include file="all_components/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file ="all_components/navbar.jsp"%>

    <div class="container mt-2">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Login</h3>
                            
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                           
                        <form action="/log" method="get" id="loginForm">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                             
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                            </div>
        
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Login</button><br>
                                <a href="register.jsp">Create Account</a>
                            </div>
                          </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   
</body>
</html>