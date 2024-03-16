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
            width: 160px;
            height: 180px;
        }
    </style>
</head>
<body class="bg-color">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container p-5">
        <div class="row">
            
            <%
                String s= request.getParameter("id");
                int bid=Integer.parseInt(s);
                try 
                { 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root"); 
                    String query="select * from books where bid='"+bid+"' " ; 
                    PreparedStatement ps=con.prepareStatement(query);
                    ResultSet rs=ps.executeQuery(query); 
                    while(rs.next()) 
                    {
            %>
            <div class="col-md-6 text-center p-5 border bg-white">
                <img src="Book/<%= rs.getString(7) %>" class="img-thumbnail plk">
                <h4 class="mt-3">Book Name <span class="text-success"><%= rs.getString(2) %></span></h4>
                <h4>Book Author <span class="text-success"><%= rs.getString(3) %></span></h4>
                <h4>Book Catagories <span class="text-success"><%= rs.getString(5) %></span></h4>
                <h4>Book Price <span class="text-success"><%= rs.getString(4) %> <i class="fa-solid fa-indian-rupee-sign"></i></span></h4>
            </div>
            
            <div class="col-md-6 text-center p-5 border bg-white">
                <h2><%= rs.getString(2) %></h2>
                <h5 class="text-primary">Contact to Saller</h5>
                <h5><i class="far fa-envelope"></i> Email:<span class="text-success">
				<a href="mailto:<%= rs.getString(8) %>" class="text-muted"><%= rs.getString(8) %></a>
				</span></h5>
                <div class="row">
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fas fa-money-bill-wave fa-2x"></i>
                        <p>Cash on Delivery</p>
                    </div>
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fas fa-undo-alt fa-2x"></i>
                        <p>Return Available</p>
                    </div>
                    <div class="col-md-4 text-danger text-center p-2">
                        <i class="fas fa-truck-moving fa-2x"></i>
                        <p>Free Shipping</p>
                    </div>
                </div>
                <div class="text-center">
                    <%
                        String n=(String)session.getAttribute("username");
                        String ui=(String)session.getAttribute("uid");
                        if((n == null) && (ui==null))
						{
					%>
                    <a href="login.jsp" class="btn btn-warning"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                    <a href="index.jsp" class="btn btn-info">Continue Shoping</a>
                    <%
						}
						else
						{
					%>
                    <a href="Cart?uid=<%= session.getAttribute("uid")%>&&bid=<%= rs.getString(1) %>" class="btn btn-warning "><i class="fa-solid fa-cart-plus"></i>Add Cart</a>        
                    <a href="index.jsp" class="btn btn-info">Continue Shoping</a>
                    <%
						}
                                        
                    %>
                    
                </div>
            </div>
            <% } 
            
        } catch(Exception e) { } %>
        </div>
    </div>
    
</body >

</html>