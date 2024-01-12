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
    <h2>User Upadte Form..</h2>
    <h4>${userFound}</h4>


    <%
    User users =(User) request.getAttribute("userFound");
        out.println(users);
        %>
        <div class="container">
          <form action="/updatedata" method="get">
             <label for="username">User Name</label>
             <input type="text" value="<%=users.getUserName()%>" name="username">
            <br>
            <label for="email">Email</label>
            <input type="email" value="<%=users.getEmail()%>" name="email">
           <br>
           <label for="password">Password</label>
           <input type="password" value="<%=users.getPassword()%>" name="password">
          <br>
          <label for="cnfpassword">Confirm Password</label>
          <input type="password" value="<%=users.getConfirmPassword()%>" name="cnfpassword">
         <br>
         <button type="submit">Update</button>

          </form>
              
<!-- 
             <tbody>
                     <tr>
                        <td><%=users.getUserName()%></td>
                        <td><%=users.getConfirmPassword()%></td>
                        <td><%=users.getEmail()%></td>
                        <td><%=users.getPassword()%></td>
                     </tr>

             </tbody>
            </table> -->
        </div>
</body>
</html>