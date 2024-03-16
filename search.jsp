<%@ page import="java.sql.* " %>
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
                
                .plk {
                    width: 170px;
                    height: 200px;
                }

                .crd-ho:hover {
                    background-color: #fcf7f7;
                }
            </style>
    </head>

    <body class="bg-color">
        <%@include file="all_component/navbar.jsp" %>
        <h3 align="center">Search Book</h3>
            <hr>
            <div class="container p-2">
                <div class="row">
                    <% 
                    try 
                    { 
                        String ch =request.getParameter("ch");
                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
                        query="select * from books where (bname Like '"+ "%" + ch + "%" +"' or aname Like '"+ "%" + ch + "%" +"' or bookCat Like '"+ "%" + ch + "%" +"') and  (bookStatus='active') and (email='admin')" ;
                     
                        PreparedStatement ps=con.prepareStatement(query);
                       
                        ResultSet rs=ps.executeQuery(query); 
                        while(rs.next()) 
                        {
                     %>
                        <div class="col-md-3 p-3">
                            <div class="card crd-ho">
            
                                
                                <div class="card-body text-center">
                                    <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                                    <p>Book Name:<b><%= rs.getString(2) %></b></p>
                                    <p>Author Name:<b><%= rs.getString(3) %></b></p>
                                    <p>Price:<b><%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i></b></p>
                                    <div class="row ">
                                        <%
                                            String name=(String)session.getAttribute("username");
                                            String uid=(String)session.getAttribute("uid");
                                            if((name == null) && (uid==null))
                                            {
                                        %>
                                                <div class="col-6">
                                                    <a href="login.jsp" class="btn btn-warning btn-sm "><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                                                </div>
                                                <div class="col-6">
                                                <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success btn-sm ">View Detail</a>
                                                </div>
                                                <div class="row text-center m-1">
                                                    <div class="col-md-12">
                                                        <a href="login.jsp" class="btn btn-info text-center">Order Now</a>
                                                    </div>
                                                        
                                                    
                                                </div>
                                        <%
                                            }
                                            else
                                            {
                                        %>
                                                <div class="col-6">
                                                    <a href="Cart?uid=<%= session.getAttribute("uid")%>&&bid=<%= rs.getString(1) %>" class="btn btn-warning btn-sm "><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                                                </div>
                                                <div class="col-6">
                                                    <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success btn-sm ">View Detail</a>
                                                </div>
                                                <div class="row text-center m-1">
                                                    <div class="col-md-12">
                                                        <a href="order.jsp?id=<%= rs.getString(1) %>" class="btn btn-info text-center">Order Now</a>
                                                    </div>
                                                        
                                                    
                                                </div>
                                                
                                        <%
                                            }
                                            
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } } catch(Exception e) { } %>
                </div>
            </div>
            </hr>


            <hr>
            <div class="container p-2">
                <div class="row">
                    <% 
                    try 
                    { 
                        String ch =request.getParameter("ch");
                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
                        query="select * from books where (bname Like '"+ "%" + ch + "%" +"' or aname Like '"+ "%" + ch + "%" +"' or bookCat Like '"+ "%" + ch + "%" +"') and  (bookStatus='active') and (email!='admin') and (bookCat='new book')" ;
                     
                        PreparedStatement ps=con.prepareStatement(query);
                       
                        ResultSet rs=ps.executeQuery(query); 
                        while(rs.next()) 
                        {
                     %>
                     <div class="col-md-3 p-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                                <p>Book Name:<b><%= rs.getString(2) %></b></p>
                                <p>Author Name:<b><%= rs.getString(3) %></b></p>
                                <p>Categories:<b><%= rs.getString(5) %></b></p>
                                <div class="row">
                                    <%
                                        String name=(String)session.getAttribute("username");
                                        String uid=(String)session.getAttribute("uid");
                                        if((name == null) && (uid==null))
                                        {
                                    %>
                                            <div class="col-4">
                                                <a href="login.jsp" class="btn btn-warning btn-sm "><i class="fa-solid fa-cart-plus"></i>+Cart</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="" class="btn btn-info btn-sm">
                                                <%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i>
                                            </a>
                                            </div>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                            <div class="col-4">
                                                <a href="Cart?uid=<%= session.getAttribute("uid")%>&&bid=<%= rs.getString(1) %>" class="btn btn-warning btn-sm "><i class="fa-solid fa-cart-plus"></i>+Cart</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="" class="btn btn-info btn-sm">
                                                <%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i>
                                            </a>
                                            </div>
                                    <%
                                        }
                                        
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                        <% } } catch(Exception e) { } %>
                </div>
            </div>
            </hr>


            <hr>
            <div class="container p-2">
                <div class="row">
                    <% 
                    try 
                    { 
                        String ch =request.getParameter("ch");
                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
                        query="select * from books where (bname Like '"+ "%" + ch + "%" +"' or aname Like '"+ "%" + ch + "%" +"' or bookCat Like '"+ "%" + ch + "%" +"') and  (bookStatus='active') and (email!='admin') and (bookCat='old book')" ;
                     
                        PreparedStatement ps=con.prepareStatement(query);
                       
                        ResultSet rs=ps.executeQuery(query); 
                        while(rs.next()) 
                        {
                     %>
                     <div class="col-md-3 p-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                                <p>Book Name:<b><%= rs.getString(2) %></b></p>
                                <p>Author Name:<b><%= rs.getString(3) %></b></p>
                                <p>Categories:<b><%= rs.getString(5) %></b></p>
                                <div class="row">
                                    <%
                                        String name=(String)session.getAttribute("username");
                                        String uid=(String)session.getAttribute("uid");
                                        if((name == null) && (uid==null))
                                        {
                                    %>
                                            <div class="col-4">
                                                <a href="login.jsp" class="btn btn-warning btn-sm "><i class="fa-solid fa-cart-plus"></i>+Cart</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="" class="btn btn-info btn-sm">
                                                <%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i>
                                            </a>
                                            </div>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                            <div class="col-4">
                                                <a href="Cart?uid=<%= session.getAttribute("uid")%>&&bid=<%= rs.getString(1) %>" class="btn btn-warning btn-sm "><i class="fa-solid fa-cart-plus"></i>+Cart</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="viewdetail.jsp?id=<%= rs.getString(1) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="col-4">
                                            <a href="" class="btn btn-info btn-sm">
                                                <%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i>
                                            </a>
                                            </div>
                                    <%
                                        }
                                        
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                        <% } } catch(Exception e) { } %>
                </div>
            </div>
            </hr>



            <%@include file="all_component/footer.jsp" %>
    </body>

    </html>