<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="all_component/style.css">
    <title>Document</title>
    <%@include file="all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
</head>
<body class="bg-color" >
    <%@include file="all_component/navbar.jsp" %>
    <section class="d-flex flex-column min-vh-100 justify-content-center align-item-center">
        <div class="container">
            <div class="row">
                <div class="col-md-9 mx-auto rounded-5 shadow bg-white">
                    <div class="contect-form">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="m-5 text-center">
                                    <%@include file="msg.jsp" %>
                                    <h1>Login Page</h1>
                                </div>
                                
                                <form action="Login" method="post" class="m-5">
                                    <div class="mb-3">
                                        <label class="form-label" for="name">User Name</label>
                                        <input type="text" name="name" placeholder="Your Name" id="name" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="pass">User Password</label>
                                        <input type="password" name="pass" placeholder="Your Password" id="pass" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="contact">User email</label>
                                        <input type="email" name="email" placeholder="Your Email" id="email" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <button class="btn btn-primary">Login</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-5">
                                <div class="mb-3">
                                    <img src="images/logo.png" class="img-fluid mt-5 p-4" id="img" >
                                </div>
                                <div class="mb-2 ml-5">
                                    <a class="btn btn-outline-info" role="button" href="admin/admin.jsp">Admin Page</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<%@include file="all_component/footer.jsp" %>
</html>