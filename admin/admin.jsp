<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="/all_component/allCSS.jsp" %>
    <link rel="stylesheet" href="style1.css">
</head>
<body class="bg-color" >
    <section class="d-flex flex-column min-vh-100 justify-content-center align-item-center">
        <div class="container">
            <div class="row">
                <div class="col-md-9 mx-auto rounded-5 shadow bg-light">
                    <div class="contect-form">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="mb-2 mt-5">
                                    <a class="btn btn-outline-info" role="button" href="../login.jsp">Login Page</a>
                                </div>
                                <div class="mb-3">
                                    <img src="images/logo.png" class="img-fluid p-5" id="img" >
                                </div>
                                
                            </div>
                            <div class="col-md-7">
                                <div class="m-5 text-center">
                                    <h1>Admin Login Page.</h1>
                                </div>
                                <form  method="post" class="m-5" action="adminHome.jsp">
                                    <div class="mb-3">
                                        <label class="form-label" for="name">Admin Name</label>
                                        <input type="text" name="name" placeholder="Name" id="name" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="pass">Admin Password</label>
                                        <input type="password" name="pass" placeholder="Your Password" id="pass" class="form-control form-lg fs-6 shadow-sm" required>
                                    </div>
                                    <div class="mb-3">
                                        <button class="btn btn-primary" onclick="return p1()">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="all_component/footer.jsp" %>
</body>
<script>
    function p1()
    {
        a=document.getElementById("pass").value
        if(a!="madebypalak")
        {
            alert("wrong password")
            return false
        }
    }
</script>
</html>