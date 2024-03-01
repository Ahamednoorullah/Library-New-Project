<%@ page import="com.chainsys.library.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<div class="container-fluid" style="height: 10px;background-color: #303f9f;"></div>

<div class="container-fluid p-3">
<div class="row">
    <div class="col-md-3 text-success">
        <h3><i class="fa-solid fa-book"></i>The Book Oasis</h3>
    </div>
    <div class="col-md-6">
        <form class="form-inline my-2 my-lg-0" action="/searchBook" method="get">
            <input class="form-control mr-sm-2" type="search"  aria-label="Search" name="ch">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            <input type="hidden" name="uid" value="${userobj.id}">
          </form>
    </div>

     <div class="col-md-3">
         <a href="/cartOut?uid=${userobj.id}"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
        <a href="" class="btn btn-success"><i class="fa-solid fa-user-plus"></i>  ${userobj.userName}</a>
        <a href="/home" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i></i> Logout</a>
    </div> 
</div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="/userHome?uid=${userobj.id}"> Home <span class="sr-only">(current)</span></a>
          </li>
        <li class="nav-item active">
          <a class="nav-link" href="/comicsBook?uid=${userobj.id}"><i class="fa-solid fa-book-open-reader"></i> Comics <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="/newBook?uid=${userobj.id}"><i class="fa-solid fa-book-open-reader"></i> New Arrival</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa-solid fa-book"></i> Books
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/newBook?uid=${userobj.id}">New Arrival</a>
            <a class="dropdown-item" href="/historicalBook?uid=${userobj.id}">Historical</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/userHome?uid=${userobj.id}">All Books</a>
          </div>
        </li>
      </ul>
      <!-- <form class="form-inline my-2 my-lg-0"> -->
       <a href="contact.jsp"> <button class="btn btn-light my-2 my-sm-0 ml-1"><i class="fa-regular fa-id-badge"></i> Contact us</button></a>
      <!-- </form> -->
    </div>
  </nav>