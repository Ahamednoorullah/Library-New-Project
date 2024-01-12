<%@ page import="com.chainsys.library.model.User"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UserList page</title>
</head>
<body>
    <h1>This is UserList page</h1>
    <%
    List<User> users =(List<User>) request.getAttribute("USER_LIST");
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
                 <% for(User user : users){
                    %>
                     <tr>
                        <td><%=user.getUserName()%></td>
                        <td><%=user.getConfirmPassword()%></td>
                        <td><%=user.getEmail()%></td>
                        <td><%=user.getPassword()%></td>
                     </tr>
                     <%}%>

             </tbody>
            </table>
        </div>
</body>
</html>