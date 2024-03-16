<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
    <style>
     
    .f
        {
            margin-top: 20%;
        }
    </style>
    
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container text-center mt-5">
        <i class="fas fa-check-circle fa-5x text-success"></i>
        <h1>Thank You</h1>
        <h2>Your Order Successfully</h2>
        <h5>With in 7 Days Your Project will be Delivered In your Address</h5>
       
        <a href="vieworder.jsp" class="btn btn-danger mt-3">View Order</a>
    </div>
    <div class="f">
        <%@include file="all_component/footer.jsp" %>
    </div>
    
</body>
</html>