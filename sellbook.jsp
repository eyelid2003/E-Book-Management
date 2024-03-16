<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <%@include file="msg.jsp" %>
                        <h4 class="text-center">Sell Books</h4>
                        <form action="SellBook" method="post" enctype="multipart/form-data" >
                            <div class="form-group">
                                <label for="bname">Book Name</label>
                                <input type="text" class="form-control" id="bname" name="bname" placeholder="Book Name" required>
                            </div>
            
                            <div class="form-group">
                                <label for="aname">Author Name</label>
                                <input type="text" class="form-control" id="aname" name="aname" placeholder="Author Name" required>
                            </div>
                        
                            <div class="form-group">
                              <label for="price">Price</label>
                              <input type="number" class="form-control" name="price" id="price" placeholder="Price" required>
                            </div>

                            <div class="form-group">
                                <label class="my-1 mr-2" for="bookCat">Book Catagory</label>
                                <select class="custom-select my-1 mr-sm-2" id="bookCat" name="bookCat">
                                    <option value="select">....select....</option>
                                    <option value="Old Book">Old Book</option>
                                    <option value="New Book">New Book</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="bookStatus">Book Status</label>
                              <input type="text" class="form-control" name="bookStatus" id="bookStatus" value="Active" readonly>
                            </div>

                            <div class="form-group">
                                <label for="photo">Upload Photo</label>
                                <input type="file" class="form-control" name="photo" value="photo" id="photo" placeholder="Chose Photo" required>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="all_component/footer.jsp" %>
</body>
</html>