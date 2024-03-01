<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Add Books</title>
    <%@include file ="allCss.jsp" %>
</head>
 <body style="background-color: #f0f1f2;"> 

    <%@include file = "navbar.jsp" %>

 <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Add Books</h4>
                        <h5 class="text-center text-success">${bookAdd}</h5>
                        <h5 class="text-center text-danger">${bookNotAdd}</h5>

                        <form action="/addBook" method="get" id="formBook">
                           
                            <div class="form-group">
                                <label for="bookName">Book Name</label>
                                <input type="text" class="form-control" id="bookName" name="bookName">
                            </div>

                            <div class="form-group">
                                <label for="author">Author</label>
                                <input type="text" class="form-control" id="author" name="author">
                            </div>

                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="text" class="form-control" id="price" name="price">
                            </div>

                            <div class="form-group">
                                <label for="bookCategory">Book Category</label>
                                <select  class="form-control" id="bookCategory" name="bookCategory">
                                    <option selected>---Select---</option>
                                    <option value="NewArrival">New Arrival</option>
                                    <option value="comics">Comics</option>
                                    <option value="historical">Historical</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select  class="form-control" id="status" name="status">
                                    <option selected>---Select---</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="publishedYear">Published Year</label>
                                <input type="number" class="form-control" id="publishedYear" name="publishedYear">
                            </div>

                            <div class="form-group">
                                <label for="qtyInstock">Qty Instock</label>
                                <input type="number" class="form-control" id="qtyInstock" name="qtyInstock">
                            </div>

                            <div class="form-group">
                                <label for="photo">Upload Photo</label>
                                <input type="file" class="form-control" id="photo" name="photoName">
                            </div>

                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> 
   
</body>
</html>