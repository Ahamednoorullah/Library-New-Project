<%@ page import="com.chainsys.library.model.Books"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checking</title>
</head>
<body>
    <h2>Hello Admin</h2>
    
    <%List<Books> book =(List<Books>) request.getAttribute("book_list");
        out.println(book); %>

</body>
</html>