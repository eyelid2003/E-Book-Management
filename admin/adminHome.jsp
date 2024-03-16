<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="/all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
    <style>
        a
        {
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
        .f
        {
            margin-top: 25%;;
        }
      
       
     </style>
</head >
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container">
        <div class="row p-5">
            <div class="col-md-3 p-3">
                <a href="addBook.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-plus-square fa-3x text-primary"></i>
                            <h4>Add Books</h4>
                            ..................
                        </div>
                    </div>
                </a>
                
            </div>
            <div class="col-md-3 p-3">
                <a href="allBook.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-book-open fa-3x text-danger"></i>
                            <h4>All Books</h4>
                            ..................
                        </div>
                    </div>
                </a>
                
            </div>
        
            <div class="col-md-3 p-3">
                <a href="order.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-box-open fa-3x text-warning"></i>
                            <h4>Order</h4>
                            ..................
                        </div>
                    </div>
                </a>
                
            </div>
            <div class="col-md-3 p-3">
                <a href="admin.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-sign-out-alt fa-3x text-primary"></i>
                            <h4>Logout</h4>
                            ..................
                        </div>
                    </div>
                </a>
                    
                
            </div>
        </div>
    </div >
    <div class="f">
        <%@include file="all_component/footer.jsp" %>
    </div>
    
</body>
</html>