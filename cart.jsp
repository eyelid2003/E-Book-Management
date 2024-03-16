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
    .plk
    {
        width: 170px;
        height: 200px;
	}
	.crd-ho:hover 
	{
        background-color: #fcf7f7;
    }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    
    <hr>
        <div class="container p-3">
            <%@include file="msg.jsp" %>
                <div class="row">
                    <%
                        String uid=(String)session.getAttribute("uid");
                        String email=(String)session.getAttribute("email");
                        String name=(String)session.getAttribute("username");
                        try 
							{ 
							    Class.forName("com.mysql.jdbc.Driver"); Connection
							    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
							    query="select * from cart where uid='"+uid+"' and bookCat='new book' and email='admin' "; 
							    PreparedStatement ps=con.prepareStatement(query); 
							    ResultSet rs=ps.executeQuery(query); 
							    while(rs.next()) 
							    {
                    %>
                        <div class="col-md-3 p-3">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                        <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                                        <p>Book Name:<b><%= rs.getString(4) %></b></p>
                                        <p>Author Name:<b><%= rs.getString(5) %></b></p>
                                        <p>Price:<b><%= rs.getString(6) %> <i class="fa-solid fa-indian-rupee-sign"></i></b></p>
                                        <div class="row ">
                                            <div class="col-6">
                                                <a  href="Remove?cid=<%= rs.getString(1) %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Remove</a>
											</div>
                                             <div class="col-6">
                                                <a href="viewdetail.jsp?id=<%= rs.getString(2) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="row text-center m-1">
                                                <div class="col-md-12">
                                                    <a href="order.jsp?id=<%= rs.getString(2) %>" class="btn btn-info text-center">Order Now</a>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    <%
                                }
                            }
							catch(Exception e){}
                    %>
               
                    <%
                       
                    try 
                        { 
                            Class.forName("com.mysql.jdbc.Driver"); Connection
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
                            query="select * from cart where uid='"+uid+"' and bookCat='new book' and email!='admin'"; 
                            PreparedStatement ps=con.prepareStatement(query); 
                            ResultSet rs=ps.executeQuery(query); 
                            while(rs.next()) 
                            {
                %>
                        <div class="col-md-3 p-3">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                        <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                                        <p>Book Name:<b><%= rs.getString(4) %></b></p>
                                        <p>Author Name:<b><%= rs.getString(5) %></b></p>
                                        <p>Price:<b><%= rs.getString(6) %> <i class="fa-solid fa-indian-rupee-sign"></i></b></p>
                                        <div class="row ">
                                            <div class="col-6">
                                                <a  href="Remove?cid=<%= rs.getString(1) %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Remove</a>
                                            </div>
                                             <div class="col-6">
                                                <a href="viewdetail.jsp?id=<%= rs.getString(2) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="row text-center m-1">
                                               
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    <%
                                }
                            }
							catch(Exception e){}
                    %>
   
                    <%
                       
                        try 
                            { 
                                Class.forName("com.mysql.jdbc.Driver"); Connection
                                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); String
                                query="select * from cart where uid='"+uid+"' and bookCat='old book' and email!='admin'"; 
                                PreparedStatement ps=con.prepareStatement(query); 
                                ResultSet rs=ps.executeQuery(query); 
                                while(rs.next()) 
                                {
                    %>
                        <div class="col-md-3 p-3">
                            <div class="card crd-ho">
                                <div class="card-body text-center">
                                        <img alt="" src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                                        <p>Book Name:<b><%= rs.getString(4) %></b></p>
                                        <p>Author Name:<b><%= rs.getString(5) %></b></p>
                                        <p>Price:<b><%= rs.getString(6) %> <i class="fa-solid fa-indian-rupee-sign"></i></b></p>
                                        <div class="row ">
                                            <div class="col-6">
                                                <a  href="Remove?cid=<%= rs.getString(1) %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Remove</a>
                                            </div>
                                             <div class="col-6">
                                                <a href="viewdetail.jsp?id=<%= rs.getString(2) %>" class="btn btn-success btn-sm ">View Detail</a>
                                            </div>
                                            <div class="row text-center m-1">
                                               
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    <%
                                }
                            }
                            catch(Exception e){}
                    %>
                </div>
        </div>
    </hr>
</body>
</html>