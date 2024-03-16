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
            margin-top: 8%;
        }
     </style>
</head >
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container">
        <%
        String name=(String)session.getAttribute("username");
        %>
        <h3 class="text-center">Hello, <%= name %></h3>
      
     
      

            <div class="row p-3">
           
                <div class="col-md-6 p-2">
                    <a href="sellbook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-book-open fa-3x text-primary"></i>
                                
                                <h4>Sell Books</h4>
                                ...............
                            </div>
                        </div>
                    </a>
                        
                    
                </div>
                <div class="col-md-6 p-2">
                    <a href="editpf.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-edit fa-3x text-warning"></i>
                            <h4>Edit Profile</h4>
                            ...............
                            </div>
                        </div>
                    </a>
                        
                    
                </div>
            </div>

            <div class="row p-3">
           
                <div class="col-md-6 p-2">
                    <a href="vieworder.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-box-open fa-3x text-success"></i>
                                <h4>My Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                        
                    
                </div>
                <div class="col-md-6 p-2">
                    <a href="allsell.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-user-circle fa-3x text-danger"></i>
                                <h4>Your all sell book</h4>
                                <p>See Your Old book</p>
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