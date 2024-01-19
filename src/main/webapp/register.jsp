<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <%@include file="all_components/allCss.jsp" %>
    <script src="JS/register.js" defer></script>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file ="all_components/navbar.jsp"%>

    <div class="container p-2">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                              <h4 class="text-center">Registration Form</h4>
                        <form id="form" action="/addUser" method="get">
                            <div class="form-group">
                                <label for="inputName">Enter Name</label>
                                <input type="text" class="form-control" id="inputName" aria-describedby="nameHelp" required="required" name="userName">
                                <div class="error"></div>
                              </div>
                            <div class="form-group">
                              <label for="inputEmail">Email address</label>
                              <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" required="required" name="email">
                              <div class="error"></div>

                            </div>
                            <div class="form-group">
                              <label for="inputPassword">Password</label>
                              <input type="password" class="form-control" id="inputPassword" required="required" name="password">
                              <div class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="inputphoneNumber">Phone Number</label>
                                <input type="number" class="form-control" id="inputphoneNumber" aria-describedby="pjoneNumberHelp" required="required" name="phoneNumber">
                                <div class="error"></div>
                               
                              </div>
                            <div class="form-check">
                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Register</button>
                          </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_components/footer.jsp" %>
</body>
</html>