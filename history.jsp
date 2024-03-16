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
        
        #img
        {
            width: 300px;
            height: 300px;
        }
     </style>
</head>
<body class="bg-color" >
    <%@include file="all_component/navbar.jsp" %>
    <section class="d-flex flex-column m-5 justify-content-center align-item-center">
        <div class="container">
            <div class="row">
                <div class="col-md-9 mx-auto rounded-5 shadow bg-white">
                    <div class="row">
                        <div class="col-md-12 text-center">
                          <img src="images/logo.png" class="img-fluid p-5" id="img" >
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                           <h3>This website Made By <span class="text-success">Palak Dixit</span>  Starting Date of this website is 04-02-2023 and Ending Date of this website is 19-02-2023. I made this using JSP,Java,MySQL Data Base,Bootstrap Framwork</h3>
                            <h3 class="text-info">The website is still under Progress :)</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="all_component/footer.jsp" %>
</body>
</html>