<%@ page import="com.chainsys.library.model.User"%>
<!-- <%@ page import="java.util.List"%> -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FInd By User</title>
</head>
<body>
    <h2>Success..</h2>
    <h4>${userFound}</h4>


    <%
    User users =(User) request.getAttribute("userFound");
        out.println(users);
        %>
        <div class="container">
            <table border="1">
             <thead>
                <tr>
                    <th>User Name</th>
                    <th>Confirm Password</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
             </thead>
             <tbody>
                     <tr>
                        <td><%=users.getUserName()%></td>
                        <td><%=users.getConfirmPassword()%></td>
                        <td><%=users.getEmail()%></td>
                        <td><%=users.getPassword()%></td>
                     </tr>

             </tbody>
            </table>
        </div>
</body>
</html>