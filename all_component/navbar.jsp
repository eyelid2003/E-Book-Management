<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3><i class="fas fa-book"></i> E-Book</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" name="ch" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </form>
        </div>
        <%
          String un=(String)session.getAttribute("username");
          if(un == null){ %>
            <div class="col-md-3">
              <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
              <a href="sign.jsp" class="btn btn-primary"><i class="fa-regular fa-address-card"></i> Registration</a>
          </div>
        <%}
        else { %>
          <div class="col-md-3">
            <a href="cart.jsp"><i class="fa-solid fa-cart-plus fa-2x text-dark"></i> </a>
            <a href="" class="btn btn-success"><i class="fa-solid fa-user"></i> <%= un %></a>
            <a href="Logout" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
        <%
        
      }
      
        %>
    
    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active ">
          <a class="nav-link" href="newbook.jsp"><i class="fas fa-book-open"></i> New Book </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="oldbook.jsp"><i class="fas fa-book"></i> Old Book </a>
          </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <%
        if(un == null){ %>
          <a href="login.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fas fa-cog"></i>Setting</a>
        <%}
        else { %>
        <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fas fa-cog"></i>Setting</a>
        <%}
      %>
      
      </form>
    </div>
  </nav>